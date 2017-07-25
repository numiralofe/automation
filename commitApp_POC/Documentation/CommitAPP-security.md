# Security Concerns.


We have 5 important security considerations:

* **All traffic is encrypted**

On all tiers communication between services is always over https.

* **All outbound traffic is routed through a proxy server**

A reverse proxy host that re-routes/filter outbound traffic.

```yaml
resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.commitApp-dev.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.web.id}"
}
```

* **Network Traffic Segregation**

Internal Traffic is segregated according to its origin as destination.

```yaml
resource "aws_route_table_association" "public_subnet_dmz_association" {
    subnet_id = "${aws_subnet.dmz.id}"
    route_table_id = "${aws_vpc.commitApp-dev.main_route_table_id}"
}

resource "aws_route_table_association" "private_db_association" {
    subnet_id = "${aws_subnet.db.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}

resource "aws_route_table_association" "private_api_association" {
    subnet_id = "${aws_subnet.api.id}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}
```

* **Network rules can be changed at the automation level**

```yaml
resource "aws_security_group" "int_app" {
	name = "api app"
	description = "Allow traffic into internal servers"

	ingress {
		from_port = 4000
		to_port = 9002
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
```

* **Ephemeral SSH Service**

Access is restricted for a single use case, ssh certs are short lived.

* **All servers are running ssh guard**

This provides the ability to whitelist / blacklist access from specific network ranges.
