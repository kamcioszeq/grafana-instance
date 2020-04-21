resource "aws_security_group" "instance" {
        name = var.security_group_instance_name
        description = "Security group for grafana and influx instance"
	egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
        }
}

resource "aws_security_group_rule" "grafana" {
	type = "ingress"
	from_port = var.grafana_port 
	to_port = var.grafana_port
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = aws_security_group.instance.id
}
resource "aws_security_group_rule" "influxdb" {
	type = "ingress"
	from_port = var.influx_port
	to_port = var.influx_port
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = aws_security_group.instance.id
}
resource "aws_security_group_rule" "ssh_ec2" {
	type = "ingress"
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = aws_security_group.instance.id
}
resource "aws_security_group_rule" "icmp_ec2" {
	type = "ingress"
	from_port = 8
	to_port = 0
	protocol = "icmp"
	cidr_blocks = ["0.0.0.0/0"]
	security_group_id = aws_security_group.instance.id
}
