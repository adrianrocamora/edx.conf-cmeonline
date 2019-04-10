#!/bin/bash
#---------------------------------------------------------
# written by: Jim Van Riper
#             jim@querium.com
#
#             Lawrence McDaniel
#             lpm0073@gmail.com
#
# date:       Oct-2018
#
# usage:      install or reinstall openstax oauth backend
#
#
# reference:  https://github.com/QueriumCorp/openstax-oauth-backend
#---------------------------------------------------------

sudo rm -r /edx/app/edxapp/edx-platform/xblocks/openstax-oauth-backend

sudo -H -u edxapp bash << EOF
source /edx/app/edxapp/edxapp_env
cd /edx/app/edxapp/venvs/edxapp/.ssh
/edx/bin/pip.edxapp uninstall -y openstax-oauth-backend

git clone git@github-openstaxoauth:QueriumCorp/openstax-oauth-backend.git /edx/app/edxapp/edx-platform/xblocks/openstax-oauth-backend
/edx/bin/pip.edxapp install -e /edx/app/edxapp/edx-platform/xblocks/openstax-oauth-backend/

EOF
