ARG VERSION
FROM batix/rundeck-ansible:$VERSION
USER root
RUN pip3 install --ignore-installed \
	hvac \
	ansible==2.9.0 \
	netaddr
