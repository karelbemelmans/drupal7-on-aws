## Drupal 7 CloudFormation stack

While this code is on github, it needs to be in an AWS S3 bucket for the sub stacks
to be able to referenced. I have a build server that pushes this automatically to this S3
url, but you should probably fork this code and push it to your own bucket.

S3 top stack location: https://s3-eu-west-1.amazonaws.com/karelbemelmans-running-drupal7-on-aws/2016-06-06/CloudFormation/drupal7.json

### Todo list

Things still missing from this stack:

  - CloudFront (right now you connect straight to the ELB)
  - Papertrail loggin
  - Use more CloudWatch metrics for the Auto Scaling Group
