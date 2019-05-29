# build-singularity-rpms-in-singularity

## singularity version

By default the script queries the [singularity releases page](https://github.com/sylabs/singularity/releases) to build the latest version.

If you want to build an older version edit [singularity_rpms.def](https://github.com/pescobar/build-singularity-rpms-in-singularity/blob/master/singularity_rpms.def#L17) to define which singularity version to build. e.g. `export SINGULARITY_VERSION="v3.1.1"`

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
