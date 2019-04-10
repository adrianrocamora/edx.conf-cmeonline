# written by: lawrence mcdaniel
#             https://lawrencemcdaniel.com
#             https://blog.lawrencemcdaniel.com
#
# date:       feb-2018
#
# usage:      1. install open edx lms + cms config files
#             2. nginx custom configurations
#             3. ansible customizations
#             4. install custom theme.
#             5. django LMS/CMS configuration overrides
#             6. admin scripts
#---------------------------------------------------------

rm -rf /home/ubuntu/edx.conf-cmeonline
git clone https://github.com/cmeonline/edx.conf-cmeonline.git

echo 1. open edx LMS + CMS configuration
sudo cp /home/ubuntu/edx.conf-cmeonline/edx/app/edxapp/*.json /edx/app/edxapp/
sudo chown edxapp /edx/app/edxapp/*.json
sudo chgrp www-data /edx/app/edxapp/*.json

echo 2. Nginx custom configurations
# these contain lets encrypt ssl certificate and https redirection
sudo cp /home/ubuntu/edx.conf-cmeonline/edx/app/nginx/sites-available/lms /edx/app/nginx/sites-available/
sudo cp /home/ubuntu/edx.conf-cmeonline/edx/app/nginx/sites-available/cms /edx/app/nginx/sites-available/
sudo service nginx restart

echo 3. Ansible customizations
# copy server-vars and any other mods to ansible-related work flows
sudo cp /home/ubuntu/edx.conf-cmeonline/edx/app/edx_ansible/*.* /edx/app/edx_ansible/

echo 4. install custom theme
sudo rm -r /edx/app/edxapp/edx-platform/themes/cmeonline-theme
sudo cp -R /home/ubuntu/edx.conf-cmeonline/themes/cmeonline-theme /edx/app/edxapp/edx-platform/themes/
sudo chown -R edxapp /edx/app/edxapp/edx-platform/themes/
sudo chgrp -R edxapp /edx/app/edxapp/edx-platform/themes/

echo 5. django configuration files
sudo cp -R /home/ubuntu/edx.conf-cmeonline/edx/app/edxapp/edx-platform/lms/envs/*.* /edx/app/edxapp/edx-platform/lms/envs/

#echo 6. admin scripts
#sudo cp -R /home/ubuntu/edx.conf-cmeonline/home/ubuntu/* /home/ubuntu/
