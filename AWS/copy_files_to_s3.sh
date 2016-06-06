#!/bin/bash
#
# Small script to copy the files to my S3 bucket.
# This will only work for me ofcourse.

BUCKET=karelbemelmans-running-drupal7-on-aws/2016-06-06
REGION=eu-west-1

# Clean everything first
aws s3 rm s3://$BUCKET --region $REGION --recursive

# Copy the new files
aws s3 cp . s3://$BUCKET --region $REGION --recursive --exclude "*.md" --exclude "*.sh"
