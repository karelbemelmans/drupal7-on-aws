#!/bin/bash
#
# This User Data script will install a docker container running Drupal7.
#
# Our EC2 instances will be running Amazon Linux, which uses yum, so most of
# our packages will be installed via yum. We really do NOT want to build our
# own packages, if we have to do that we would prefer running it as a docker
# container or command.

# Install some utility packages we are going to use in our script:
yum install -y jq

#
# These can be called up by any EC2 instance, they do not require additional
# roles or permissions. The awk command looks pretty ugly, but it comes straight
# from the AWS documentation.
INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id 2>/dev/null)
INSTANCE_REGION=$(curl http://169.254.169.254/latest/dynamic/instance-identity/document 2>/dev/null |grep region|awk -F\" '{print $4}')

# This creates a tag on the EC2 instance, which we can later use to identify
# instances. This requires additional permissions for the instance. Make sure
# this policy has been added to your instance's role:
#
# Policy Name: SelfConfiguringResourcePolicy
#
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Sid": "Stmt1449063803000",
#             "Effect": "Allow",
#             "Action": [
#                 "ec2:DescribeTags"
#             ],
#             "Resource": [
#                 "*"
#             ]
#         }
#     ]
# }
aws ec2 create-tags \
  --region=$INSTANCE_REGION \
  --resources $INSTANCE_ID \
  --tags Key=Service,Value=Drupal Key=Datadog,Value=True

# We need docker ofcourse. We install it as a service that gets restarted after
# a reboot. This might not be needed, as our instances only get killed or created,
# but it's always nice to configure it properly.
yum install docker -y
usermod -a -G docker ec2-user
chkconfig docker on
service docker restart

# Docker compose, as we start our containers using a docker-compose.yml file.
curl -sL https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` \
  -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Go to the ec2-user's homedirectory
cd /home/ec2-user

# Create out custom Drupal settings file.
# We append this file to the normal settings.php file, so we can overwrite any
# setting we would like.
cat << EOF > settings.php
# This is a test.
EOF


# Create our customer Drupal container with a modified settings file.
#
# Note: If this was a real project, you would not start with the Drupal 7 file
# from the docker hub, you would take your own Drupal Dockerfile that also
# contains all your contrib and custom modules and themes. This has to be the
# complete website, we are only going to overwrite the settings file here.
cat << EOF > Dockerfile
FROM drupal:7-apache
COPY settings.php /var/www/html/sites/default/settings.php
EOF

# Create out Docker compose file to start out container:
DOCKER_COMPOSER_FILE=docker-compose.yml

cat << EOF > $DOCKER_COMPOSER_FILE
drupal:
  build: .
  ports:
    - "5000:5000"
  environment:
    - REGISTRY_HTTP_SECRET=oonohch4pughoh9ienguxaem7sheij3x
EOF

# Add papertrail logging if the tag has been set on the instance.
# Our Launch Configuration will create the correct Logger tag so Docker will do
# remote syslogging to the address specified in that tag (papertrail in my case)
if [ "$LOGGER_TAG" != "None" ]; then

cat << EOF >> $DOCKER_COMPOSER_FILE
  log_driver: syslog
  log_opt:
    syslog-address: "${LOGGER_TAG}"
    tag: "drupal7"
EOF

fi

# Build and run
/usr/local/bin/docker-compose build
/usr/local/bin/docker-compose up -d

# Return a clean exit code when we ar done
exit 0
