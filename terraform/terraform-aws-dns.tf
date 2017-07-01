# Application DNS

resource "aws_route53_record" "bastion01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "bastion01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.bastion01.private_ip}"]
}

resource "aws_route53_record" "bastion_public_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "bastion-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_eip.mngt.public_ip}"]
}

resource "aws_route53_record" "consul01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "consul01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.consul01.private_ip}"]
}

resource "aws_route53_record" "consul_public_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "consul-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_eip.mngt.public_ip}"]
}

resource "aws_route53_record" "lbs_public_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "lbs-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_eip.mngt.public_ip}"]
}


resource "aws_route53_record" "consulweb01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "consulweb01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.consulweb01.private_ip}"]
}

resource "aws_route53_record" "lbcc01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "lbcc01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.lbcc01.private_ip}"]
}

resource "aws_route53_record" "lbbus01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "lbbus01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.lbbus01.private_ip}"]
}


resource "aws_route53_record" "lbdb01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "lbdb01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.lbdb01.private_ip}"]
}

resource "aws_route53_record" "db01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "db01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.db01.private_ip}"]
}

resource "aws_route53_record" "db_public_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "db-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_eip.mngt.public_ip}"]
}

resource "aws_route53_record" "lbmain_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "lbmain01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.lbmain01.private_ip}"]
}


resource "aws_route53_record" "lbmain_public_main_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "main-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_eip.dmz.public_ip}"]

				provisioner "local-exec" {
				command = "cp terraform-aws.tmpl terraform-aws.${var.aws_namespace}"
				}
				provisioner "local-exec" {
				command = "chmod 600 files/*"
				}
				provisioner "local-exec" {
				command = "sed -i s/HOSTIP/${aws_eip.mngt.public_ip}/g terraform-aws.${var.aws_namespace}"
				}
				provisioner "local-exec" {
				command = "sed -i s/MAINDOMAIN/${var.aws_domain}/g terraform-aws.${var.aws_namespace}"
				}
				provisioner "local-exec" {
				command = "sed -i s/NAMESPACE/${var.aws_namespace}/g terraform-aws.${var.aws_namespace}"
				}
				provisioner "local-exec" {
				command = "ansible-playbook -i terraform-aws.${var.aws_namespace} cloudinit.yml -v"
				}

}
