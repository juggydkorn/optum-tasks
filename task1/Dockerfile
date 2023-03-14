FROM jenkins/jenkins:latest
USER root
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
# RUN apt-get update -y  && \     
#  apt-get install -y net-tools && \
#  apt install -y iproute2
# RUN ifconfig eth0 | awk '/ether/ {print $2}'
# RUN mac=(Get-NetAdapter -name "vEthernet (Default Switch)").macaddress
# RUN echo $mac
# RUN ipconfig /all |find 'Physical Address'| Select -First 2| Select -Last 1
RUN apt-get update && apt-get install -y \
    curl \
    gnupg-agent \
    software-properties-common \
    docker.io
# RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io
COPY casc.yaml /var/jenkins_home/casc.yaml
EXPOSE 8080