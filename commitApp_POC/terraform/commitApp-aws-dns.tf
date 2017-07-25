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

resource "aws_route53_record" "redis01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "redis01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.redis01.private_ip}"]
}

resource "aws_route53_record" "redis02_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "redis02-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.redis02.private_ip}"]
}

resource "aws_route53_record" "lbredis01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "lbredis01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.lbredis01.private_ip}"]
}

resource "aws_route53_record" "api01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "checkout01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.api01.private_ip}"]
}

resource "aws_route53_record" "api02_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "core01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.api02.private_ip}"]
}


resource "aws_route53_record" "service01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "boweb01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.service01.private_ip}"]
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

resource "aws_route53_record" "static01_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "static01-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_instance.static01.private_ip}"]
}

resource "aws_route53_record" "lbmain_public_cdn_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "cdn-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_eip.dmz.public_ip}"]
}

resource "aws_route53_record" "lbmain_public_api_dns" {
        zone_id = "${var.aws_domain_id}"
        type = "A"
        ttl = "300"
        name = "api-${var.aws_namespace}.${var.aws_domain}"
        records = ["${aws_eip.dmz.public_ip}"]

				provisioner "local-exec" {
				command = "cp commitApp-aws.tmpl commitApp-aws.${var.aws_namespace}"
				}
				provisioner "local-exec" {
				command = "ansible-playbook -i commitApp-aws.${var.aws_namespace} cloudinit.yml -v"
				}

}
