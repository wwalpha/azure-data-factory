locals {
  user_data = <<EOT
#!/bin/bash
wget https://raw.githubusercontent.com/sajitsasi/az-ip-fwd/main/ip_fwd.sh
chmod 777 ip_fwd.sh
sudo ./ip_fwd.sh -i eth0 -f 1433 -a ${azurerm_network_interface.database.private_ip_address} -b 1433
EOT
}
