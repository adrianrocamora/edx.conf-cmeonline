## server-vars.yaml

### For a forked repository
/edx/app/edx_ansible/server-vars.yml
	edx_platform_repo: https://github.com/yourGitHubAccount/edx-platform.git
	edx_platform_version: branchName


### To update platform with new server-vars.yml values
==============
1. sudo /edx/bin/update edx-platform branchName

2.
	source /edx/app/edx_ansible/venvs/edx_ansible/bin/activate
	cd /edx/app/edx_ansible/edx_ansible/playbooks/edx-east
	/edx/bin/ansible-playbook -i localhost, -c local edxapp.yml -e 'edx_platform_version=master'

----
From: https://github.com/CDOT-EDX/ProductionStackDocs/wiki/Updating-EDX-using-a-Fork-(Production-Stack). It is expected that as part of software development you would like to make customizations to the EDX application. This can be done using a Fork of the official Edx platform a https://github.com/edx/edx-platform/ . Once you have forked and created changes on a branch, or wish to use another branch that comes with the Fork simply add the following lines to **/edx/app/edx_ansible/server-vars.yml**:

* edx_platform_repo: https://github.com/yourGitHubAccount/edx-platform.git
* edx_platform_version: branchName

To apply the Fork you will also have to remove the existing EDX platform by doing:
* sudo rm -rf /edx/app/edxapp/edx-platform

Next update the edx-platform using the forked repo by doing:
* sudo /edx/bin/update edx-platform branchName

There are other ways of doing updates to the Edx application whether you are updating using the existing EDX application, or whether you are updating using the server-vars.yml found in the /edx/app/edx_ansible/ directory.

The following command set allows you to run ansible manually without the deploy tag which will set-up apparmor correctly. You also have the option to specify which branch of the EDX repository you can update with.

* source /edx/app/edx_ansible/venvs/edx_ansible/bin/activate

* cd /edx/app/edx_ansible/edx_ansible/playbooks/edx-east

* /edx/bin/ansible-playbook -i localhost, -c local edxapp.yml -e 'edx_platform_version=master'

The following command allows you to set-up the EDX application including changes you wish to make in the **server-vars.yml** found in the **/edx/app/edx_ansible/** directory.

* sudo /edx/bin/update configuration release
(Where **release** is an available repository branch)
* cd /edx/app/edx_ansible/edx_ansible/playbooks/edx-east

* sudo /edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook -i localhost, -c local edxapp.yml -vvv -e@/edx/app/edx_ansible/server-vars.yml

If you are not updating the edx-platform using a forked repository do:
* sudo /edx/bin/update edx-platform release (Where **release** is an available repository branch)
Or
* sudo /edx/bin/update edx-platform master (Where **master** is an available repository branch)

The difference between **‘master’** and **‘release’** is that **‘master’** has the latest cutting edge EDX code that is not fully tested, whereas **‘release’** has been fully prepared for public use.
