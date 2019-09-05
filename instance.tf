resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public ssh key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  }

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
}

output "ip" {
  value = "${aws_instance.example.public_ip}"
}
