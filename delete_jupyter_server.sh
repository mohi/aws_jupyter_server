NBNAME='jupyter3'

SECURITY_GROUP_NAME=$NBNAME'-sg'
KEY_NAME=$NBNAME'-key'

aws ec2 delete-instances --instance-id $INSTANCE_ID

# wait before instances gets terminated
aws ec2 delete-security-groups --group-id $SECURITY_ID 

aws ec2 delete-key-pair --key-name $KEY_NAME

