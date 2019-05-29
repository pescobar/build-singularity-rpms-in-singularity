# build-singularity-rpms-in-singularity

## define the singularity version to build
Edit [singularity_rpms.def](https://github.com/pescobar/build-singularity-rpms-in-singularity/blob/master/singularity_rpms.def#L15) to define which singularity version to build. You can find the complete list in the [singularity repository](https://github.com/sylabs/singularity/releases)

## build in a linux machine with Singularity already installed and root/sudo permissions

If you have a linux machine with [Singularity](https://www.sylabs.io/) and root/sudo access just run these commands:

```
$> git clone https://github.com/pescobar/build-singularity-rpms-in-singularity.git
$> cd build-singularity-rpms-in-singularity
$> sudo singularity build /tmp/singularity_rpms.simg singularity_rpms.def
```

You will get the rpms and build logs in `/tmp/rpmbuild`

## build in a Vagrant VM 

If you don't have Singularity you can build the rpms in a Vagrant VM like this:

```
$> mkdir centos7_vm
$> cd centos7_vm
$> vagrant init bento/centos-7
$> vagrant up
$> vagrant ssh
vagrant$> git clone https://github.com/pescobar/build-singularity-rpms-in-singularity.git
vagrant$> cd build-singularity-rpms-in-singularity
vagrant$> ./build_singularity_rpms.sh
```

## use the provided Vagrantfile to do a fully automated build

```
$> git clone https://github.com/pescobar/build-singularity-rpms-in-singularity.git
$> cd build-singularity-rpms-in-singularity
$> vagrant up
$> ls ./rpmbuild/
$> vagrant destroy
```


Once the container is built for the first time you can re-use like this:
```
singularity exec -B `pwd` /tmp/singularity_rpms.simg rpmbuild -tb singularity-${VERSION}.tar.gz
```
