#!/bin/bash

set -x 
set -e

DISTVERSION=$(curl -s https://api.github.com/repos/acassen/keepalived/tags | grep "name" | head -n 1 | cut -d'"' -f4)
SOURCE="https://github.com/acassen/keepalived/archive/master.zip"

cp -v /config/keepalived-centos7.specs /root/keepalived-build.specs

# Get source 
/usr/bin/wget $SOURCE -O \
              /root/rpmbuild/SOURCES/$DISTVERSION.zip

# Change release number
BUILDVERSION=$(cat /config/buildversion)
/bin/sed -i "s/DISTVERSION/$DISTVERSION/" /root/keepalived-build.specs
/bin/sed -i "s/BUILDVERSION/$BUILDVERSION/" /root/keepalived-build.specs 

# Build the RPM
/usr/bin/rpmbuild -ba /root/keepalived-build.specs

# Move them to mount /data
mv -v /root/rpmbuild/RPMS/x86_64/* /data/

# Install the generated RPM
yum install /data/keepalived-$DISTVERSION-$BUILDVERSION.rpm

# Clean up
#rm -v /root/keepalived-build.specs
