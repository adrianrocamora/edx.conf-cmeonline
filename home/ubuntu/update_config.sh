sudo -H -u edxapp bash << EOF
source /edx/app/edxapp/edxapp_env

mv /edx/app/edxapp/lms.env.json /edx/app/edxapp/lms.env.json.old
cp /home/ubuntu/edx.conf-cmeonline/cfg/lms.env.json /edx/app/edxapp/lms.env.json

mv /edx/app/edxapp/cms.env.json /edx/app/edxapp/cms.env.json.old
cp /home/ubuntu/edx.conf-cmeonline/cfg/cms.env.json /edx/app/edxapp/cms.env.json

EOF

/edx/bin/supervisorctl status
/edx/bin/supervisorctl restart lms
/edx/bin/supervisorctl restart cms
/edx/bin/supervisorctl restart edxapp_worker:
/edx/bin/supervisorctl status
