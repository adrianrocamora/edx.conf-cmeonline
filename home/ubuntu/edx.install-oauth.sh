#!/bin/bash
#---------------------------------------------------------
# written by: Lawrence McDaniel
#             lpm0073@gmail.com
#
# date:       April 2019
#
# usage:      install or reinstall NYSPMA oauth backend
#
#
# reference:  https://github.com/cmeonline/edx-oauth
#---------------------------------------------------------


# install from public repo. force update if its already installed.
sudo -H -u edxapp bash << EOF
source /edx/app/edxapp/edxapp_env

/edx/bin/pip.edxapp install --upgrade git+https://github.com/cmeonline/edx-oauth.git

EOF
