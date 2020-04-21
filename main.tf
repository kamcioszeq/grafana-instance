provider "aws" {
	region = var.aws_region
}

resource "aws_instance" "graphana-influxdb" {
	ami = var.ami_id
	instance_type = var.instance_type
	vpc_security_group_ids = [aws_security_group.instance.id]
	user_data = data.template_file.user_data.rendered
	key_name = "ec2-user-frankfurt"
	
	tags = {
    		Name = "ec2_instance"
  	}
	
	root_block_device {
		volume_size = var.ebs_volume_system_size
		delete_on_termination = var.delete_on_termination
	}
	ebs_block_device {
		device_name = var.ebs_device_name
		volume_size = var.ebs_volume_data_size
		delete_on_termination = false
	}	
}	




