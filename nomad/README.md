# nomad - snips

Nomad is a tool for managing a cluster of machines and running applications on them. Nomad abstracts away machines and the location of applications, and instead enables users to declare what they want to run and Nomad handles where they should run and how to run them.


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
https://www.nomadproject.io
