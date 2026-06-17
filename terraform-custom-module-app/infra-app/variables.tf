variable "env" {
  description = "This is the environment variable for the terraform infrastructure"
  type        = string

  validation {
    condition     = contains(["dev", "stage", "prd"], var.env)
    error_message = "The env variable must be one of the following values: dev. stage, prd, but got ${var.env}"
  }

}


variable "bucket_name" {
  description = "This is the bucket name for the S3 bucket"
  type        = string
}

variable "instance_count" {
  description = "This is the instance count for the EC2 instance"
  type        = number
}

variable "ec2_instance_type" {
  description = "This is the instance type for the EC2 instance"
  type        = string
}

variable "ec2_ami_id" {
  description = "This is the AMI ID for the EC2 instance"
  type        = string

  validation {
    condition     = startswith(var.ec2_ami_id, "ami-")
    error_message = "The AMI ID must start with 'ami-', but got ${var.ec2_ami_id}"
  }
}

variable "hash_key" {
  description = "This is the hash key for the DynamoDB table"
  type        = string
}