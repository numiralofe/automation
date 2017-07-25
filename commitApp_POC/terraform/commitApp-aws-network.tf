# Network Stack

# Web tier
resource "aws_internet_gateway" "web" {
	vpc_id = "${aws_vpc.commitApp-dev.id}"
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.commitApp-dev.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.web.id}"
}

resource "aws_nat_gateway" "nat" {
    allocation_id = "${var.aws_default_outbound_ip}"
    subnet_id = "${aws_subnet.dmz.id}"
    depends_on = ["aws_internet_gateway.web"]
}

resource "aws_route_table" "private_route_table" {
    vpc_id = "${aws_vpc.commitApp-dev.id}"
}

resource "aws_route" "private_route" {
	route_table_id  = "${aws_route_table.private_route_table.id}"
	destination_cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.nat.id}"
}

resource "aws_route_table_association" "public_subnet_dmz_association" {
    subnet_id = "${aws_subnet.dmz.id}"
    route_table_id = "${aws_vpc.commitApp-dev.main_route_table_id}"
}

resource "aws_route_table_association" "private_db_association" {
    subnet_id = "${aws_subnet.db.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "private_cc_association" {
    subnet_id = "${aws_subnet.cc.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "private_bus_association" {
    subnet_id = "${aws_subnet.bus.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "private_intsrv_association" {
    subnet_id = "${aws_subnet.intsrv.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_subnet" "mngt" {
	vpc_id = "${aws_vpc.commitApp-dev.id}"
	cidr_block = "10.10.1.0/24"
	availability_zone = "${var.aws_default_region}"
}

resource "aws_subnet" "cc" {
	vpc_id = "${aws_vpc.commitApp-dev.id}"
	cidr_block = "10.10.2.0/24"
	availability_zone = "${var.aws_default_region}"
}

resource "aws_subnet" "bus" {
	vpc_id = "${aws_vpc.commitApp-dev.id}"
	cidr_block = "10.10.3.0/24"
	availability_zone = "${var.aws_default_region}"
}

resource "aws_subnet" "db" {
	vpc_id = "${aws_vpc.commitApp-dev.id}"
	cidr_block = "10.10.4.0/24"
	availability_zone = "${var.aws_default_region}"
}

resource "aws_subnet" "dmz" {
	vpc_id = "${aws_vpc.commitApp-dev.id}"
	cidr_block = "10.10.5.0/24"
	availability_zone = "${var.aws_default_region}"
	map_public_ip_on_launch = true
}

resource "aws_subnet" "intsrv" {
	vpc_id = "${aws_vpc.commitApp-dev.id}"
	cidr_block = "10.10.6.0/24"
	availability_zone = "${var.aws_default_region}"
}


resource "aws_eip" "dmz" {
	instance = "${aws_instance.lbmain01.id}"
	vpc = true
}

resource "aws_eip" "mngt" {
	instance = "${aws_instance.bastion01.id}"
	vpc = false
}

resource "aws_security_group" "managment" {
	name = "managment"
	description = "Allow http internet traffic into managment bastion"

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	vpc_id = "${aws_vpc.commitApp-dev.id}"
}

resource "aws_security_group" "int_app" {
	name = "web app"
	description = "Allow traffic into internal servers"

	ingress {
		from_port = 4000
		to_port = 9002
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	vpc_id = "${aws_vpc.commitApp-dev.id}"
}

resource "aws_security_group" "web_db" {
	name = "web db"
	description = "Allow http internet traffic into elb"

	ingress {
		from_port = 3306
		to_port = 3306
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 8080
		to_port = 8080
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	vpc_id = "${aws_vpc.commitApp-dev.id}"
}
