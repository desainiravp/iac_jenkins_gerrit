variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "key_name" {
  description = "Your AWS EC2 key pair name"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu 22.04 LTS AMI ID"
  type        = string
}

variable "jenkins_name" {
  default = "jenkins-server"
}

variable "gerrit_name" {
  default = "gerrit-server"
}
