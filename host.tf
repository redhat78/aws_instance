resource "aws_instance" "mmh" {
  ami = "ami-5026902d"
  instance_type = "t2.large"
  tags {
    Name = "server_ali_test"
  }
  key_name = "key_ali"
  subnet_id = "subnet-0d2bb6e06da744a13"
  user_data = "${file("install_web.txt")}"
}

