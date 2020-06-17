FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y python-dev libffi-dev gcc libssl-dev python-selinux python-setuptools

RUN apt-get install -y python-pip
RUN apt-get install -y ansible
RUN pip install kolla-ansible

RUN mkdir -p /etc/kolla
#RUN chown $USER:$USER /etc/kolla

RUN sed -i "s/#host_key_checking/host_key_checking/g" /etc/ansible/ansible.cfg 
RUN sed -i "s/#pipelining = False/pipelining = True/g" /etc/ansible/ansible.cfg
RUN sed -i "s/#forks          = 5/forks = 100/g" /etc/ansible/ansible.cfg

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

WORKDIR /opt/inventory/

ENTRYPOINT ["/docker-entrypoint.sh"]