## Drupal 7 CloudFormation stack

This directory contains Cloudformation templates for creating a Multi-AZ Drupal webserver stack. Read more about it on [my blog](https://www.karelbemelmans.com/2016/06/running-drupal-7-on-aws---part-2/).

### S3 stack

The file drupal7.json contains the full CloudFormation stack that creates the Multi-AZ Drupal setup, using AWS S3 for file storage.

### EFS stack

The file drupal7-efs.json contains the full CloudFormation stack that creates the Multi-AZ Drupal setup, using AWS Elastic Filesystem.





