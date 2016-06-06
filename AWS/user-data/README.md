## AWS User Data scripts

This directory contains user-data scripts used by AWS Launch Configurations or EC2 instances.

They're simple bash scripts that install a bunch of software on a server. This will include copy stuff from various locations, amount which AWS S3. This is done without providing credentials; these credentials will be automatically supplied by the instance role assigned to the EC2 instance running these scripts.