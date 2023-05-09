resource "aws_ebs_volume" "volume1" {
  count             = 1
  availability_zone = element(aws_instance.my_ec2.*.availability_zone, count.index)
  size              = 10
  tags = {
    Name = "my_volume1"
  }
  depends_on = [aws_instance.my_ec2]
}
resource "aws_volume_attachment" "ebs_attach" {
  count       = 1
  device_name = "/dev/sdh"
  volume_id   = element(aws_ebs_volume.volume1.*.id, count.index)
  instance_id = element(aws_instance.my_ec2.*.id, count.index)

  depends_on = [aws_ebs_volume.volume1]
}
