sudo -H -u edxapp bash << EOF
source /edx/app/edxapp/edxapp_env
rm -rf /edx/app/edxapp/edx-platform/themes/cmeonline-theme
mkdir /edx/app/edxapp/edx-platform/themes/cmeonline-theme
cp -r /home/ubuntu/edx.conf-cmeonline/themes/cmeonline-theme/* /edx/app/edxapp/edx-platform/themes/cmeonline-theme
EOF

/edx/bin/supervisorctl status
/edx/bin/supervisorctl restart lms
/edx/bin/supervisorctl restart cms
/edx/bin/supervisorctl restart edxapp_worker:
/edx/bin/supervisorctl status
