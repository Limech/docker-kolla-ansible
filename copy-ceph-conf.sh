#!/bin/bash

cp /data/shared/ceph/ceph.conf kolla/config/glance/
cp /data/shared/ceph/ceph.client.glance.keyring kolla/config/glance/
cp /data/shared/ceph/ceph.conf kolla/config/cinder/
mkdir -p kolla/config/cinder/cinder-backup
mkdir -p kolla/config/cinder/cinder-volume
cp /data/shared/ceph/ceph.client.cinder.keyring kolla/config/cinder/cinder-backup/
cp /data/shared/ceph/ceph.client.cinder-backup.keyring kolla/config/cinder/cinder-backup/
cp /data/shared/ceph/ceph.client.cinder.keyring kolla/config/cinder/cinder-volume/
cp /data/shared/ceph/ceph.conf kolla/config/nova/
cp /data/shared/ceph/ceph.client.cinder.keyring kolla/config/nova/
cp kolla/config/nova/ceph.client.cinder.keyring kolla/config/nova/ceph.client.nova.keyring

