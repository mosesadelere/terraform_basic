resource "aws_security_group" "sg" {
  name        = "terraform-example-sg"
  description = "Security group for Terraform example"
  vpc_id      = "vpc-0511db04da8c0e469"

  dynamic "ingress" {
    for_each = var.ingress-ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Terraform Example SG"
  }
}

resource "aws_instance" "web" {
  ami             = "ami-0d13e2317a7e75c95"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.sg.name]
  key_name        = "tf-provisioning-remote"

  tags = {
    Name = "Terraform Example"
  }

  provisioner "file" {
    source      = "/home/madelere/terraform_basic/tf-file/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2",
      "sudo chmod 777 /var/www/html",
      "sudo cp /tmp/index.html /var/www/html/index.html",
      "sudo chown www-data:www-data /var/www/html/index.html"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/madelere/terraform_basic/tf-file/tf-provisioning-remote.pem")
    host        = self.public_ip
  }
}
