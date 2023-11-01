# changing intefaces name
  sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/g' /etc/default/grub
  sed -i 's/enp1s0/eth0/g; s/enp2s0/eth1/g' /etc/netplan/50-cloud-init.yaml
  # changing interface name
  update-grub2

  if ! grep -q "eth1" /etc/netplan/50-cloud-init.yaml; then
    cat > /etc/netplan/70-secondary-itf.yaml << EOF
    network:
        ethernets:
            eth1:
                dhcp4: true
                dhcp6: false
                dhcp4-overrides:
                  route-metric: 200
        version: 2
EOF
  fi
  netplan apply
fi
