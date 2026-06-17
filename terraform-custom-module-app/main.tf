module "prd-infra-app" {
  source            = "./infra-app"
  env               = "prd"
  bucket_name       = "infra-app-gumber"
  instance_count    = 2
  ec2_instance_type = "c7i-flex.large"
  ec2_ami_id        = "ami-01a00762f46d584a1"
  hash_key          = "studentID"
}


module "dev-infra-app" {
  source            = "./infra-app"
  env               = "dev"
  bucket_name       = "infra-app-gumber"
  instance_count    = 1
  ec2_instance_type = "t3.micro"
  ec2_ami_id        = "ami-01a00762f46d584a1"
  hash_key          = "studentID"
}


module "stage-infra-app" {
  source            = "./infra-app"
  env               = "stage"
  bucket_name       = "infra-app-gumber"
  instance_count    = 1
  ec2_instance_type = "t3.small"
  ec2_ami_id        = "ami-01a00762f46d584a1"
  hash_key          = "studentID"
}
