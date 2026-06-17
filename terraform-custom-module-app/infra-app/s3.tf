resource "aws_s3_bucket" "s3_bucket_for_infra" {
  bucket = "${var.env}-${var.bucket_name}-bucket"

  tags = {
    Name        = "${var.env}-${var.bucket_name}-bucket"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_bucket_for_infra.id
  versioning_configuration {
    status = "Enabled"
  }
}
