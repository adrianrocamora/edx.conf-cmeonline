#!/bin/bash
#---------------------------------------------------------
# written by: lawrence mcdaniel
#             https://lawrencemcdaniel.com
#             https://blog.lawrencemcdaniel.com
#
# date:       feb-2018
#
# usage:      1. install open edx lms + cms config files
#             2. nginx custom configurations
#             3. ansible customizations
#             4. admin scripts
#---------------------------------------------------------

rm -rf /home/ubuntu/edx.conf-cmeonline
git clone https://github.com/cmeonline/edx.conf-cmeonline.git

# 1. open edx LMS + CMS configuration
sudo cp /home/ubuntu/edx.conf-cmeonline/edx/app/edxapp/*.json /edx/app/edxapp/
sudo chown edxapp /edx/app/edxapp/*.json
sudo chgrp www-data /edx/app/edxapp/*.json

# 2. Nginx custom configurations
# these contain lets encrypt ssl certificate and https redirection
sudo cp /home/ubuntu/edx.conf-cmeonline/edx/app/nginx/sites-available/lms /edx/app/nginx/sites-available/
sudo cp /home/ubuntu/edx.conf-cmeonline/edx/app/nginx/sites-available/cms /edx/app/nginx/sites-available/
sudo service nginx restart

# 3. Ansible customizations
# copy server-vars and any other mods to ansible-related work flows
sudo cp /home/ubuntu/edx.conf-cmeonline/edx/app/edx_ansible/*.* /edx/app/edx_ansible/

# 4. admin scripts
sudo cp /home/ubuntu/edx.conf-cmeonline/home/ubuntu/* /home/ubuntu/
