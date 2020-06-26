FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y python-dev libffi-dev gcc libssl-dev python-selinux python-setuptools openssh-client vim

RUN apt-get install -y python-pip
#RUN apt-get install -y ansible
RUN pip install ansible==2.9.10
RUN pip install kolla-ansible==9.1.0

RUN mkdir -p /etc/kolla

RUN mkdir -p /etc/ansible && echo "[defaults]\nhost_key_checking=False\npipelining=True\nforks=100\n" > /etc/ansible/ansible.cfg

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

WORKDIR /opt/inventory/

ENTRYPOINT ["/docker-entrypoint.sh"]
