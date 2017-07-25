# SUMMARY

This base application has several endpoints: adding a project, list commits and also a JSON list of the commits. These commits and projects have to be persisted and also drawn in a UI.

We also want to expose an API for our users to consume.

Consider the case where the application needs to scale every service, and possibly all the implications that it may have in the system.

# Problems we are trying to solve

* We want to avoid the management problems and the uncertain of the upgrade consistency of our infrastructures and applications using classic provisioning.

* We have to manage high available stateful services (databases etc…) that needs to be upgraded without downtime.

* Manage independent blocks of infrastructure and applications handling the dependencies between them.

# INDEX

[App Flow] (https://github.com/numiralofe/automation/blob/master/commitApp_POC/Documentation/CommitAPP-flow.md)
[Networking] (https://github.com/numiralofe/automation/blob/master/commitApp_POC/Documentation/CommitAPP-network.md)
[Security] (https://github.com/numiralofe/automation/blob/master/commitApp_POC/Documentation/CommitAPP-security.md)

#  Used tools

The tools involved in the process are:

* Terraform
* Ansible
* Git

# Workflow

1. user creates the correspondent branch for the required repositories on git.
2. terraform will fetch information from the created repo and based on that bootstraps the required infrastructure on aws.
3. ansible is triggered to perform initial configurations on the created infrastructure.
4. user commits updates on the  correspondent branch with the creation status/info.


# Repositories

The code available on git repos will represents the state of infrastructure and applications, at a glance, we can tell what’s currently deployed and how it’s configured, without having to worry about history or timing. This also makes it easy to create reusable code, as you don’t have to manually account for the current state, instead, we should just focus on describing desired state, and the process gets us from one state to the other automatically.
