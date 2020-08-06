ARG VERSION
FROM rundeck/rundeck:$VERSION
USER root
RUN apt-get update && apt-get install -y \
	dnsutils \
	less \
	net-tools \
	netcat \
	psmisc \
	python3 \
	python3-pip \
	telnet \
	tree \
	vim \
	&& echo Finished installing apt packages. \
	&& pip3 install --upgrade \
		ansible \
		hvac \
		netaddr \
		&& echo Finished installing pip packages.
USER rundeck
ENV PATH=${PATH}:${RDECK_BASE}/tools/bin
ADD https://github.com/Batix/rundeck-ansible-plugin/releases/download/3.1.1/ansible-plugin-3.1.1.jar /home/rundeck/libext/
COPY remco/resources.d/* /etc/remco/resources.d/
COPY remco/templates/* /etc/remco/templates/
