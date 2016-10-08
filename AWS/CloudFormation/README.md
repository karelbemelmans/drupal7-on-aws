## Drupal 7 CloudFormation stack

This directory contains Cloudformation templates for creating a Multi-AZ Drupal webserver stack. Read more about it on [my blog](https://www.karelbemelmans.com/2016/06/running-drupal-7-on-aws---part-2/).

### S3 stack

The file drupal7.json contains the full CloudFormation stack that creates the Multi-AZ Drupal setup, using AWS S3 for file storage.

### EFS stack

The file drupal7-efs.json contains the full CloudFormation stack that creates the Multi-AZ Drupal setup, using AWS Elastic File System.

### EFS stack, realistic Drupal example

This stack has both a JSON and a YAML version available. The YAML version is recommended.

The file drupal7-efs-realistic.yml contains the full CloudFormation stack that creates the Multi-AZ Drupal setup, using AWS Elastic File System with an actual realistic Drupal 7 example site.

This stack also uses redis instead of memcached.

A few details about the stack parameters:

  - You need an EC2 key, it will be used for ssh access to the instances (if needed)
  - You need to provide an ARN for a SSL certificate. This can either come from IAM or from ACM.

The Docker image used in this stack is hosted on [Docker hub](https://hub.docker.com/r/karelbemelmans/d7-docker-v1/).



