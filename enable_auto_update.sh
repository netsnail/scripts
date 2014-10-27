#!/bin/bash

apt-get install -y unattended-upgrades

. /etc/os-release

# enable update on debian
if [ "${ID}" == "debian" ]; then
  sed -i 's|//      "o=Debian,a=stable";|        "o=Debian,a=stable";|g' /etc/apt/apt.conf.d/50unattended-upgrades
  sed -i 's|//      "o=Debian,a=stable-updates";|        "o=Debian,a=stable-updates";|g' /etc/apt/apt.conf.d/50unattended-upgrades
fi

# enable update on ubuntu
if [ "${ID}" == "ubuntu" ]; then
  sed -i '4s|//| |g' /etc/apt/apt.conf.d/50unattended-upgrades
fi

# reconfigure
sed -i 's|APT::Periodic::Unattended-Upgrade "0";|APT::Periodic::Unattended-Upgrade "1";|g' /etc/apt/apt.conf.d/10periodic
sed -i 's|APT::Periodic::Update-Package-Lists "0";|APT::Periodic::Update-Package-Lists "1";|g' /etc/apt/apt.conf.d/10periodic
sed -i 's|APT::Periodic::Download-Upgradeable-Packages "0";|APT::Periodic::Download-Upgradeable-Packages "1";|g' /etc/apt/apt.conf.d/10periodic
sed -i 's|APT::Periodic::AutocleanInterval "0";|APT::Periodic::AutocleanInterval "1";|g' /etc/apt/apt.conf.d/10periodic

# enable email notification when mailx is installed
$(dpkg-query -l mailx > /dev/null 2>&1)
if [ $? -eq 0 ]; then
  sed -i 's|//Unattended-Upgrade::Mail|Unattended-Upgrade::Mail|g' /etc/apt/apt.conf.d/50unattended-upgrades
fi

sed -i 's|//Unattended-Upgrade::MinimalSteps "true";|Unattended-Upgrade::MinimalSteps "true";|g' /etc/apt/apt.conf.d/50unattended-upgrades
