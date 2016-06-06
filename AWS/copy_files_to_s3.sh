#!/bin/bash
#
# Small script to copy the files to my S3 bucket.
# This will only work for me ofcourse.

aws s3 cp . s3://karelbemelmans-running-drupal7-on-aws --region eu-west-1 --recursive
