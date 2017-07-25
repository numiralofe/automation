# Security Concerns.


We have 5 important security considerations:

* **All traffic is encrypted**

On all tiers communication between services is always over https.

* **All outbound traffis is routed through a proxy server**

A reverse proxy host that re-routes/filter outbound traffic.

* **Network Traffic Segregation**

Internal Traffic is segregated according to its origin as destination.

* **Ephemeral SSH Service**

Access is restricted for a single use case, ssh certs are short lived.

* **All servers are running ssh guard**

This provides the ability to whitelist / blacklist access from specific network ranges.
