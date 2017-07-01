# consul - snips

Consul has multiple components, but as a whole, it is a tool for discovering and configuring services in your infrastructure.


### What is this repository for? ###

This repository is just a collection of code snips that i used and that might be helpful.


### Tips ###

Once the server members come up you can check their status:

```
#!bash
ubuntu@nomad-server:~$ nomad server-members -address http://172.17.5.126:4646
```


Once the clients startup you can check their status:
```
#!bash
ubuntu@nomad-server:~$ nomad node-status -address http://172.17.5.126:4646
```

Once the job is added to the cluster, it looks like this:
```
#!bash
ubuntu@nomad-server:~$ nomad status -address http://172.17.5.126:4646 deploy-app
```


You can learn more about consul on hashicorp terraform project web site:
https://www.consul.io
