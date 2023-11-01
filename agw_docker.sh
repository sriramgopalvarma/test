sed -i 's/enp1s0/eth0/g; s/enp2s0/eth1/g' /etc/netplan/50-cloud-init.yaml

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
