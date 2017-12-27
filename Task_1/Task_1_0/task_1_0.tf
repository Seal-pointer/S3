provider "aws" {
  region       = "eu-central-1"
}

variable "bucket_name" {
  type         = "string"
  default      = "birm-tstbckt"
}

# Initialization/creation of bucket
resource "aws_s3_bucket" "web_bucket" {
  bucket       = "${var.bucket_name}"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

#  HTML Files can be downloaded from previous task repo...

resource "aws_s3_bucket_object" "index_page" {
  bucket       = "${var.bucket_name}"
  key          = "index.html"
  content_type = "text/html"
  acl          = "public-read"
  source       = "./S3Website/index.html"
  etag         = "${md5(file("./S3Website/index.html"))}"
  depends_on   = ["aws_s3_bucket.web_bucket"]
}

resource "aws_s3_bucket_object" "error_page" {
  bucket       = "${var.bucket_name}"
  key          = "error.html"
  content_type = "text/html"
  acl          = "public-read"
  source       = "./S3Website/error.html"
  etag         = "${md5(file("./S3Website/error.html"))}"
  depends_on   = ["aws_s3_bucket.web_bucket"]
}
