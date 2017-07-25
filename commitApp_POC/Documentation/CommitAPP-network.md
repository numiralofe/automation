Network structure:
Each server have roles now, and these roles dictate what it does.

We have 5 important network tiers/groups:

DMZ Tier
In this tier we have all services that have public information and do not require any type of authentication to access them.
 - A reverse proxy host that re-routes/filter internal traffic out
 - a small cdn server to serve static content

Services Tier
In this Tier we have services that provides end user and 3rd parties access to our products.
s
API Tier
In this Tier we have internal services that deal with critical data, processing of that data and requests, make it available in the form of internal API's data for other services or the end user to consume.

DATA Tier
In this Tier we have internal database and in memory databases.

Management Tier
In this Tier we have internal services that we use to manage our infrastructure.
- bastion server
- logs
- monitoring

![Diagram - Simple Overview]](Diagram-simpleView.png)

![Diagram - Expanded Overview] (https://github.com/numiralofe/automation/blob/master/commitApp_POC/Documentation/Diagram-expandedView.png)
