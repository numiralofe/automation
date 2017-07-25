# App Scalability.

* **Application nodes auto-scaling**

Terraform will creates the CloudWatch metric alarms. The first one triggers the scale up policy when the group’s overall memory utilization is >= 80% for 2 5 minute intervals.

The second one triggers the scale down policy when the group’s overall memory utilization is <= 40%.

* **Persistent data services**

For persistent data we will be using an SQL DB Cluster that is load balanced using haproxy.

* **Ephemeral data services**

For ephmeral data, is created per region a redis cache cluster that can acomodate non persistent data.
