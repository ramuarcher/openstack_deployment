#!/bin/bash

export controller=192.168.122.238

su -s /bin/bash keystone -c "keystone-manage db_sync"

keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone

keystone-manage credential_setup --keystone-user keystone --keystone-group keystone

keystone-manage bootstrap --bootstrap-password adminpassword --bootstrap-admin-url http://$controller:35357/v3/ --bootstrap-internal-url http://$controller:35357/v3/ --bootstrap-public-url http://$controller:5000/v3/ --bootstrap-region-id RegionOne
