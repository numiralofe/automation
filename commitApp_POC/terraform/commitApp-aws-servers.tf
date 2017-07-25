# Application Servers

resource "aws_instance" "bastion01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "bastion01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.mngt.id}"
}

resource "aws_instance" "redis01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "redis01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.int_app.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.intsrv.id}"
}

resource "aws_instance" "redis02" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "redis02-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.int_app.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.intsrv.id}"
}

resource "aws_instance" "lbredis01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "lbredis01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.int_app.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.intsrv.id}"
}

resource "aws_instance" "lbcc01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "lbcc01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.int_app.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.cc.id}"
}

resource "aws_instance" "api01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "api01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.int_app.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.cc.id}"
}

resource "aws_instance" "api02" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "api02-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.int_app.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.cc.id}"
}


resource "aws_instance" "lbbus01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "lbbus01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.int_app.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.bus.id}"
}

resource "aws_instance" "service01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "service01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.int_app.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.bus.id}"
}

resource "aws_instance" "lbdb01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "lbdb01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.web_db.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.db.id}"
}

resource "aws_instance" "db01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "db01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.web_db.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.db.id}"
}

resource "aws_instance" "lbmain01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "lbmain01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.int_app.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.dmz.id}"
}

resource "aws_instance" "static01" {
	ami = "${var.aws_ubuntu_ami}"
	availability_zone = "${var.aws_default_region}"
	instance_type = "${var.aws_default_instance}"
	tags = { "Name" = "static01-${var.aws_namespace}" }
	security_groups = ["${aws_security_group.int_app.id}","${aws_security_group.managment.id}"]
	key_name = "${var.aws_keypair}"
	subnet_id = "${aws_subnet.bus.id}"
}
