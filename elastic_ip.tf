resource "aws_eip" "lb" {
  instance = "${aws_instance.mmh.id}"
  vpc      = true
}
