provider "aws" {
  region = "us-west-1"
}

resource "aws_launch_template" "foo" {
  name_prefix   = "foo"
  image_id = "ami-0a16c82eb0cc3aad8"
  instance_type = "t2.medium"
  key_name = "aws-test-west"
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 20
    }
  }
}

resource "aws_autoscaling_group" "lt_id" {
  availability_zones = ["us-west-1a"]
  desired_capacity   = 3
  max_size           = 5
  min_size           = 1

  launch_template {
    id      = "${aws_launch_template.foo.id}"
    version = "$Latest"
  }
}
