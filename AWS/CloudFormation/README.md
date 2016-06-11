## Drupal 7 CloudFormation stack

The file drupal7.json contains the full CloudFormation stack that creates the Multi-AZ Drupal setup.

Read more about it on [my blog](https://www.karelbemelmans.com/2016/06/running-drupal-7-on-aws---part-2/).

## Todo list

Things still missing from this stack:

  - Use 2 CloudFront distributions:
    - One for the S3 static content
    - One for the ELB so anonymous users also get a cached page
  - Add Papertrail logging to the Docker containers
  - Use more CloudWatch metrics for the Auto Scaling Group adjusments
  - Configure SES so Drupal can send emails
  - ...

## Problems

There are still some problems with running this setup on AWS though:

  - CSS and JS aggregation does not work with the s3fs module
  - Question: Is the session fixation on the ELB the right way to go?

