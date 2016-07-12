## Drupal 7 CloudFormation stack

This directory contains Cloudformation templates for creating a Multi-AZ Drupal webserver stack. Read more about it on [my blog](https://www.karelbemelmans.com/2016/06/running-drupal-7-on-aws---part-2/).

### S3 stack

The file drupal7.json contains the full CloudFormation stack that creates the Multi-AZ Drupal setup, using AWS S3 for file storage.

### EFS stack

The file drupal7-efs.json contains the full CloudFormation stack that creates the Multi-AZ Drupal setup, using AWS Elastic Filesystem.

### EFS stack, realistic Drupal example

The file drupal7-efs-realistic.json contains the full CloudFormation stack that creates the Multi-AZ Drupal setup, using AWS Elastic Filesystem with an actual realistic Drupal example site.

The Docker image user in this stack is hosted on Docker hub: https://hub.docker.com/r/karelbemelmans/d7-docker-v1/



