# --- Get subnet IDs ---
data "aws_subnet_ids" "private" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "*Private*"
  }
}

# --- get the AMI ID ---
data "aws_ami" "ami" {
  most_recent = true
  owners      = "${var.owner_id}"

  filter {
    name   = "name"
    values = ["Centos-7*"]
  }
}