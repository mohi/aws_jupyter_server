# Prerequisite: Having a AWS account and
# Run aws configure before this

# This script will create a new group, a new key for the notebook server
NBNAME='jupyter3'
SECURITY_GROUP_NAME=$NBNAME'-sg'
KEY_NAME=$NBNAME'-key'
PORT=8888
IMAGE_TYPE='ami-15872773' # image_type is ubuntu for region is ap-northeast-1 
INSTANCE_TYPE='t2.micro'

mkdir $NBNAME

aws ec2 create-security-group --group-name $SECURITY_GROUP_NAME --description "security group for development environment in EC2"`date` > $NBNAME/$SECURITY_GROUP_NAME.json

SECURITY_ID=`cat $NBNAME/$SECURITY_GROUP_NAME.json | python fetch_groupid.py`
echo 'security group is '$SECURITY_GROUP_NAME':'$SECURITY_ID
aws ec2 authorize-security-group-ingress --group-name $SECURITY_GROUP_NAME --protocol tcp --port $PORT --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name $SECURITY_GROUP_NAME --protocol tcp --port 22 --cidr 0.0.0.0/0

aws ec2 create-key-pair --key-name $KEY_NAME --query 'KeyMaterial' --output text > $NBNAME/$KEY_NAME.pem

chmod 400 $NBNAME/$KEY_NAME.pem

INSTANCE_ID=`aws ec2 run-instances --image-id $IMAGE_TYPE --security-group-ids $SECURITY_ID --count 1 --instance-type t2.micro --key-name $KEY_NAME --query 'Instances[0].InstanceId'`
INSTANCE_ID=`echo $INSTANCE_ID | tr -d '"'`
echo 'instance created and running is '$INSTANCE_ID
INSTANCE_IP=`aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicIpAddress'`
INSTANCE_IP=`echo $INSTANCE_IP | tr -d '"'`
echo 'instance created and running is '$INSTANCE_IP
