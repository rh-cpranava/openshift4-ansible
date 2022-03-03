#Pre-installation for bastion
mkdir -p  /mnt/rhel
mount -o loop /dev/sr0 /mnt/rhel
cp /mnt/rhel/media.repo /etc/yum.repos.d/media.repo
chmod 644 /etc/yum.repos.d/media.repo
cat <<EOT >> /etc/yum.repos.d/media.repo

#Edit the new repo file to reflect the dvd content mounted.
[dvd-BaseOS]
name=DVD for RHEL8 - BaseOS
baseurl=file:///mnt/rhel/BaseOS
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release

[dvd-AppStream]
name=DVD for RHEL8 - AppStream
baseurl=file:///mnt/rhel/AppStream
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
EOT

#Verify if ISO is mounted properly
yum clean all
yum repolist enabled

#Download oc tar file
curl https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz -o oc.tar.gz
tar -xvf oc.tar.gz
chmod +x oc 
mv oc /usr/bin

#Download openshift-install tar file
curl https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest/openshift-client-linux.tar.gz -o openshift-install.tar.gz
tar -xvf openshift-install.tar.gz
chmod +x openshift-install 
mv openshift-install /usr/bin

#Download and install webserver
yum install -y httpd
systemctl enable httpd
systemctl start httpd
mkdir -p /var/www/html/ocp/ignition
chmod 755 /var/www/html/ocp/ignition/*

#Download and install webserver
yum install -y jq tmux skopeo ansible
