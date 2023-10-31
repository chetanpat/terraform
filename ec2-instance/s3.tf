resource "aws_s3_bucket" "s3_bucket" {
  bucket = "svp-403"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    name = "S3 Storage"
  }
}

resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = "svp-403"

  versioning_configuration {
    status = "Enabled"
  }

  lifecycle {
      prevent_destroy = true
    }
}