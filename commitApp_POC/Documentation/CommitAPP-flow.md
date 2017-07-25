# App flow.

Public https request come in through one of the listed domain names.

public SSL offload is done at main proxy (HAProxy) then it passes the request to API or Services tier over HTTPS or to the static content servers.

If those servers need to make requests to other servers on an different tier then they will make a https request through the internal VIPs (api load balancer / services load balancer)

If a database connection is required they will then make a request through the internal database VIP.

All servers do not have external direct connectivity, as so, any requests made to external parties will be rerouted to a reverse proxy that is on the DMZ tier and handles those requests.

![Flow Diagram](https://github.com/numiralofe/automation/blob/master/commitApp_POC/Documentation/Network-Services.png)
