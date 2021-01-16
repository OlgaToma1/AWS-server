provider "aws" {}

resource "aws_instance" "My_webserver" {
  ami                    = "ami-01b65a06ec09db85c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.My_webserver.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Olga",
    l_name = "Toma"
  })


}

resource "aws_security_group" "My_webserver" {
  name        = "WebServer Security group"
  description = "My First SGroup"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
