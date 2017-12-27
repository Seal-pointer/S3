aws s3 mb s3://birm-tstbckt
aws s3 cp .\S3Website\ s3://birm-tstbckt --recursive --acl public-read
aws s3 website s3://birm-tstbckt/ --index-document index.html --error-document error.html
