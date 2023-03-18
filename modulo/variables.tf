

variable "domain" {
  description = "The domain to add the record to"  
  type = string
  default = "gomex.me"
}

variable "record_type" {
  description = "The type of the record"  
  type = string
  default = "A"
}

variable "record_ttl" {
  description = "The TTL of the record"  
  type = string
  default = "10"
}

variable "az" {
  type = string
  description = "Availability zone of AWS"
  default = "us-east-2a"
}

variable "instance_type" {
  description = "EC2 instance type"  
  type = string
  default = "t3.micro"
}


variable "vpc_security_group_ids" {
  description = "Security Group ID"  
  type = list(string)
  default = ["sg-0ade73fdb498a6b47"]
}

variable "hostname" {
  description = "name of host"  
  type = string
  default = "hostname"
}

variable "sg_group_rule" {
  description = "Security Group rule"  
  type = map
  default = {
  } 
}

variable "ebs_enabled" {
  description = "Option to enable ebs volume"  
  type = bool
  default = false
}

variable "ebs_volume_size" {
  description = "size of ebs volume"  
  type = number
  default = 1
}

variable "ebs_device_name" {
  description = "Device Name"  
  type = string
  default = "/dev/sdh"
}

variable "subnet_tier" {
  description = "Tier of subnet (Public or Private)"  
  type = string
  default = "public"
}

variable "root_block_device_volume_type" {
  description = "Type of EBS root volume"  
  type = string
  default = "gp2"
}

variable "root_block_device_volume_size" {
  description = "Size of EBS root volume"  
  type = string
  default = "8"
}

variable "root_block_device_delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination"  
  type = bool
  default = true
}

variable "ami_release" {
  description = "AMI release version number"  
  type = string
  default = "v0.2.2"
}
