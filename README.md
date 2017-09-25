# keepalived CentOS RPM builder

[![Build Status](https://travis-ci.org/yoramvandevelde/keepalived-centos-rpm.svg?branch=master)](https://travis-ci.org/yoramvandevelde/keepalived-centos-rpm)

---
Build and run it:
```
for v in 6 7; do 
    docker build -t keepalived-centos$v-rpm:latest CentOS$v/
    docker run -ti --rm \
        -v $PWD/CentOS$v/data:/data \
        -v $PWD/CentOS$v/assets/config:/config \
        keepalived-centos$v-rpm:latest start.sh
done
```

Find the RPM's in de data folder:
```
$ ls CentOS*/data/ 
keepalived-3.5.1-909.el7.centos.x86_64.rpm  
keepalived-debuginfo-3.5.1-909.el7.centos.x86_64.rpm
```
