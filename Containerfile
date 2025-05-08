FROM registry.access.redhat.com/ubi8/ubi:latest
RUN dnf install vim-enhanced -y
CMD ["/usr/bin/sleep", "30"]
