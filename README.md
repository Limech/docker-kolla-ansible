## Introduction

This repository contains the scripts and Dockerfile necessary to build a Docker image that contains Kolla-Ansible.

The intended usage is that all Ansible, Kolla-ansible or other commands are run by running a container instance, passing in the command.
The container is destroyed after the command has finished executing.

The files that are expected to be provided are to be provided to the container using host volume mounts.

This is already taken care of by the script `kolla-ansible.sh`.

## To build the image

```
  docker build --rm -t kolla:latest .
```

## Typical commands

All commands are run as the current user or as root is the following commands are preceeded with `sudo`.

### Ansible

To run an ansible command:

```
  ./kolla-ansible.sh "ansible -i multinode all -m ping"
```

This runs the module `ping` on the inventory file `multinode` which must be on the host in the folder `inventory`.

### Kolla-ansible

To run a kolla-ansible command:

```
  ./kolla-ansible.sh "kolla-ansible -i multinode prechecks"
```

### Generating passwords

This will populate the `kolla/passwords.yml` file with passwords.  

```
   ./kolla-ansible.sh kolla-genpwd
```
An empty `kolla/passwords-empty.yml` is made available in case you need to reset all password.
Use it to override the `passwords.yml` file.  You should NOT store this file with production passwords under version control.


