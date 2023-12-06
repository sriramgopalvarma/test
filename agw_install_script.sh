#!/bin/bash

echo "Checking if magma has been installed"
MAGMA_INSTALLED=$(apt-cache show magma >  /dev/null 2>&1 echo "$SUCCESS_MESSAGE")
if [ "$MAGMA_INSTALLED" != "$SUCCESS_MESSAGE" ]; then
  echo "Magma not installed, processing installation"
  apt-get -y install curl make virtualenv zip rsync git software-properties-common python3-pip python-dev apt-transport-https

  alias python=python3
  pip3 install ansible==5.10.0

  git clone "${GIT_URL}" /home/$MAGMA_USER/magma
  cd /home/$MAGMA_USER/magma || exit
  git checkout "$MAGMA_VERSION"

  echo "Generating localhost hostfile for Ansible"
  echo "[magma_deploy]
  127.0.0.1 ansible_connection=local" > $DEPLOY_PATH/agw_hosts

  # install magma and its dependencies including OVS.
  su - $MAGMA_USER -c "ansible-playbook -e \"MAGMA_ROOT='/home/$MAGMA_USER/magma' OUTPUT_DIR='/tmp'\" -i $DEPLOY_PATH/agw_hosts $DEPLOY_PATH/magma_deploy.yml -vv"
  sleep 10

  echo "AGW installation is done, Run agw_post_install_ubuntu.sh install script after reboot to finish installation"
  wget https://raw.githubusercontent.com/magma/magma/"$MAGMA_VERSION"/lte/gateway/deploy/agw_post_install_ubuntu.sh -P /root/

  echo "Cleanup temp files"
  su - $MAGMA_USER -c "ansible-playbook -e \"MAGMA_ROOT='/home/$MAGMA_USER/magma' OUTPUT_DIR='/tmp'\" -i $DEPLOY_PATH/agw_hosts $DEPLOY_PATH/magma_deploy.yml -vv"
  cd /root || exit
  rm -rf $AGW_INSTALL_CONFIG
  rm -rf /home/$MAGMA_USER/build
  
#  reboot
else
  echo "Magma already installed, skipping.."
fi
