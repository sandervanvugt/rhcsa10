FROM registry.redhat.io/rhel10-beta/rhel-bootc:latest

ADD etc /etc

RUN dnf -y install httpd mod_ssl && dnf clean all
RUN systemctl enable httpd && firewall-cmd --add-service=https

COPY ./index.html /var/www/html/index.html
