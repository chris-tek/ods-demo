# ### web ###
resource "aws_security_group" "web" {
  name          = "ods_sre_web_server_sg"
  description   = "Security group for the web server"
  vpc_id        = "${var.vpc_id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

#   ingress { # add ping
#     from_port   = 8
#     to_port     = 0
#     protocol    = "icmp"
#     cidr_blocks = ["10.0.0.0/8"]
#   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  tags = var.global_tags
}

# ### app ###

resource "aws_security_group" "app" {
  name          = "ods_sre_app_server_sg"
  description   = "Security group for the app server"
  vpc_id        = "${var.vpc_id}"

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

#   ingress { # add ping
#     from_port   = 8
#     to_port     = 0
#     protocol    = "icmp"
#     cidr_blocks = ["10.0.0.0/8"]
#   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  tags = var.global_tags
}


# ### db ###

resource "aws_security_group" "db" {
  name          = "ods_sre_db_server_sg"
  description   = "Security group for the db server"
  vpc_id        = "${var.vpc_id}"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

#   ingress { # add ping
#     from_port   = 8
#     to_port     = 0
#     protocol    = "icmp"
#     cidr_blocks = ["10.0.0.0/8"]
#   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.vpc_cidr_block}"]
  }

  tags = var.global_tags
}