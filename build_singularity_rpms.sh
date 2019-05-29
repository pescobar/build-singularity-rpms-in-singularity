#!/bin/bash

sudo yum -y install epel-release
sudo yum -y install git
sudo yum -y install singularity
git clone https://github.com/pescobar/build-singularity-rpms-in-singularity.git
cd build-singularity-rpms-in-singularity
sudo singularity build /tmp/singularity_rpms.simg singularity_rpms.def
rsync -av /tmp/rpmbuild /vagrant/

echo "You can find the RPMs in folder rpmbuild"
