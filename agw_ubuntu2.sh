#!/bin/bash
set -x

addr1="$1"
gw_addr="$2"
INTERFACE_DIR="/etc/network/interfaces.d"
CLOUD_INSTALL="cloud"
echo "Need to check if both interfaces are named eth0 and eth1"
INTERFACES=$(ip -br a)
if [[ $1 != "$CLOUD_INSTALL" ]] && ( [[ ! $INTERFACES == *'eth0'*  ]] || [[ ! $INTERFACES == *'eth1'* ]] || ! grep -q 'GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"' /etc/default/grub); then
  # changing intefaces name
  sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/g' /etc/default/grub
  sed -i 's/enp1s0/eth0/g' /etc/netplan/50-cloud-init.yaml
  # changing interface name
  grub-mkconfig -o /boot/grub/grub.cfg

  # name server config
  ln -sf /var/run/systemd/resolve/resolv.conf /etc/resolv.conf
  sed -i 's/#DNS=/DNS=8.8.8.8 208.67.222.222/' /etc/systemd/resolved.conf
  service systemd-resolved restart

  # interface config
  apt install -y ifupdown net-tools ipcalc
  mkdir -p "$INTERFACE_DIR"
  echo "source-directory $INTERFACE_DIR" > /etc/network/interfaces

  # configuring eth1
  echo "auto eth1
  iface eth1 inet static
  address 10.0.2.1
  netmask 255.255.255.0" > "$INTERFACE_DIR"/eth1

  systemctl unmask networking
  systemctl enable networking

  reboot
else
  echo "Interfaces name are correct, let's check if network and DNS are up"
fi
