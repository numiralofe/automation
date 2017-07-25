# Security Concerns.


We have 5 important security considerations:

* **All traffic is encrypted**

On all tiers communication between services is always over https.

* **All outbound traffis is routed through a proxy server**

A reverse proxy host that re-routes/filter outbound traffic.

* **Network Traffic Segregation**

Internal Traffic is segregated according to its origin as destination.

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
