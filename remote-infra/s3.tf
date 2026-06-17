resource "aws_s3_bucket" "remote_infra_s3_bucket" {
  bucket = "remote-state-management-bucket"

  tags = {
    Name = "remote-infra-s3-bucket"
  }
}

resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.remote_infra_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
