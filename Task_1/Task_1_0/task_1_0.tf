provider "aws" {
  region       = "eu-central-1"
}

# Initialization/creation of bucket
resource "aws_s3_bucket" "web_bucket" {
  bucket = "birm-tstbckt"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

#  HTML Files can be downloaded from previous task repo...

resource "aws_s3_bucket_object" "index_page" {
  bucket       = "birm-tstbckt"
  key          = "index.html"
  content_type = "text/html"
  acl          = "public-read"
  source       = "E:/S3Website/index.html"
  etag         = "${md5(file("E:/S3Website/index.html"))}"
  depends_on   = ["aws_s3_bucket.web_bucket"]
}

resource "aws_s3_bucket_object" "error_page" {
  bucket       = "birm-tstbckt"
  key          = "error.html"
  content_type = "text/html"
  acl          = "public-read"
  source       = "E:/S3Website/error.html"
  etag         = "${md5(file("E:/S3Website/error.html"))}"
  depends_on   = ["aws_s3_bucket.web_bucket"]
}
