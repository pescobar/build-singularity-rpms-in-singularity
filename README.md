# build-singularity-rpms-in-singularity

If you have a linux machine with [Singularity](https://www.sylabs.io/) and root/sudo access just run this command:

```
$> sudo singularity build /tmp/singularity_rpms.simg singularity_rpms.def
```

If you don't have Singularity you can build the rpms in a Vagrant VM like this:

```
$> mkdir centos7_vm
$> cd centos7_vm
$> vagrant init centos/7
$> vagrant up
$> vagrant ssh
vagrant$> sudo yum -y install git
vagrant$> sudo yum -y install epel-release
vagrant$> sudo yum -y install singularity
vagrant$> git clone https://github.com/pescobar/build-singularity-rpms-in-singularity.git
vagrant$> cd build-singularity-rpms-in-singularity
vagrant$> sudo singularity build /tmp/singularity_rpms.simg singularity_rpms.def
vagrant$> cp -r /tmp/rpmbuild /vagrant
```

You can re-use the container with:
```
singularity exec -B `pwd` /tmp/singularity_rpms.simg rpmbuild -tb singularity-${VERSION}.tar.bz2
```

You will get the rpms and build logs in `/tmp/rpmbuild`
