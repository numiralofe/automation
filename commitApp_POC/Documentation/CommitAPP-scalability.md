# App Scalability.

* **Application nodes auto-scaling**

Terraform will creates the CloudWatch metric alarms. The first one triggers the scale up policy when the group’s overall memory utilization is >= 80% for 2 5 minute intervals.

The second one triggers the scale down policy when the group’s overall memory utilization is <= 40%.

```yaml
resource "aws_cloudwatch_metric_alarm" "memory-high" {
    alarm_name = "mem-util-high-agents"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "MemoryUtilization"
    namespace = "System/Linux"
    period = "300"
    statistic = "Average"
    threshold = "80"
    alarm_description = "This metric monitors ec2 memory for high utilization on agent hosts"
    alarm_actions = [
        "${aws_autoscaling_policy.agents-scale-up.arn}"
    ]
    dimensions {
        AutoScalingGroupName = "${aws_autoscaling_group.agents.name}"
    }
}
```

* **Persistent data services**

For persistent data we will be using an SQL DB Cluster that is load balanced using haproxy.

* **Ephemeral data services**

For ephemeral data, its created per region a redis cache cluster that can accommodate non persistent data.
