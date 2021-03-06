variable "aws_region" {
	default = "eu-central-1"
}

variable "instance_type" {
	description = "Ami type"
	type = string
	default = "t2.micro" #"t3a.medium"
}

variable "ami_id" {
	description = "Ami used to create"
	type = string
	default = "ami-076431be05aaf8080"
}

variable "delete_on_termination" {
	default = true
}

variable "security_group_instance_name" {
	default  = "grafana_security_group"
}

variable "ebs_volume_system_size" {
	default = 11
	description = "Size of system partition"
}

variable "ebs_volume_data_size" {
	default = 1
	description = "size of data parti"
}

variable "ebs_volume_type" {	
	default = "standard"
}

variable "ebs_enabled" {
	default = true
}

variable "ebs_device_name" {
	default = "/dev/xvdb"
}
variable "influx_port" {
	default = 3000
}
variable "grafana_port" {
	default = 8086
}
