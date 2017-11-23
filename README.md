# Setting up AWS server with jupyter using cmd line

## Steps 

*  Follow this to get a server ready 
    * http://docs.aws.amazon.com/cli/latest/userguide/tutorial-ec2-ubuntu.html
         * Use AMI from the same region as in the ```aws configure```
         * Use ```aws <cmd/s> help``` to know the usage of cmd/s
         * Export output of cmds in a file for future use
         * Allow inbound port for 8888 in the security group creation
         * Imp commands
              * ```aws ec2 describe-instances```
              * ```aws ec2 start(/stop)-instances --instance-ids 'i-xxxxxxxxx'```
* Install conda and run jupyter 
     * https://medium.com/@josemarcialportilla/getting-spark-python-and-jupyter-notebook-running-on-amazon-ec2-dec599e1c297
         * Install conda and edit the jupyter setting file and run
         * Generate password by checking out the setting file
* Start using jupyter notebooks with conda libraries from browser and password

## Future work 

* Automating this with one command using fabric and shell scripts

## Status

* Server ready Done
* Conda and jupyter launch using fabric remaining
      
              
