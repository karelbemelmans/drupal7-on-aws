## Drupal 7 CloudFormation stack

The file drupal7.json contains the full CloudFormation stack that creates Multi-AZ Drupal setup.

Read more about it on [my blog](https://www.karelbemelmans.com/2016/06/running-drupal-7-on-aws---part-2/).

## Todo list

Things still missing from this stack:

  - CloudFront (right now you connect straight to the ELB)
  - Papertrail loggin
  - Use more CloudWatch metrics for the Auto Scaling Group
