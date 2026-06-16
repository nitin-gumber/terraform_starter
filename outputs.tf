# output "ec2_public_ip" {
#   value = aws_instance.my_instance.public_ip
# }

# output "ec2_public_dns" {
#   value = aws_instance.my_instance.public_dns
# }

# output "ec2_private_ip" {
#   value = aws_instance.my_instance.private_ip
# }


# count for output

# output "ec2_public_ip" {
#   value = aws_instance.my_instance[*].public_ip
# }

# output "ec2_public_dns" {
#   value = aws_instance.my_instance[*].public_dns
# }

# output "ec2_private_ip" {
#   value = aws_instance.my_instance[*].private_ip
# }



# output for for_each:

output "ec2_public_ip" {
  value = {
    for key, value in aws_instance.my_instance : key => value.public_ip
  }
}

output "ec2_public_dns" {
  value = {
    for key, value in aws_instance.my_instance : key => value.public_dns
  }
}


output "ec2_private_ip" {
  value = {
    for key, value in aws_instance.my_instance : key => value.private_ip
  }
}
