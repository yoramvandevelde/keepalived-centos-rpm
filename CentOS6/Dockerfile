FROM centos:centos6
LABEL version="1.0.0" \
      maintainer="Yoram van de Velde <yoram@provider.nl>"

USER root

# Copy the build script
COPY /assets/bin/start.sh /bin/start.sh

# 1. Update repos and install needed packages
# 2. Make rpmbuild directory structure
# 3. Make /bin/start.sh executable
RUN yum -y update && \
    yum clean all && \
    yum -y install openssl-devel libnl3-devel \
                   net-snmp-devel libnfnetlink-devel \
                   gcc make wget rpm-build && \
    /bin/mkdir -pv /root/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}/ \
                   /data \
                   /config && \
    /bin/chmod +x /bin/start.sh
