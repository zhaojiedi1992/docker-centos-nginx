######################################################################
#name: zhaojiedi1992
#created: 2018-04-07
#github:  https//github.com/zhaojiedi1992/nginx
######################################################################
FROM centos:latest

LABEL maintainer="LinuxPanda <zhaojiedi1992@outlook.com>"
ADD  http://download2.linuxpanda.tech/yum/epel-7.repo /etc/yum.repos.d/epel-7.repo 
ADD  http://download2.linuxpanda.tech/yum/ali-7.repo  /etc/yum.repos.d/ali-7.repo

RUN     mkdir "/etc/yum.repos.d/bak" \
	&& mv /etc/yum.repos.d/Cent*.repo /etc/yum.repos.d/bak/ \
	&& yum  clean all \
#	&& rm -rf /var/cache/yum \
	&& yum install nginx  -y -q \
	&& echo "daemon off;" >> /etc/nginx/nginx.conf 

#VOLUME [ "/var/www/html"]
ADD     entrypoint.sh   /bin/enterpoint.sh
ENTRYPOINT [ "/bin/enterpoint.sh" ]
CMD ["nginx"]

EXPOSE 80
#EXPOSE 443/tcp 

HEALTHCHECK --interval=10s --timeout=20s  --retries=3 CMD kill -0 nginx && exit 0 || exit 1

