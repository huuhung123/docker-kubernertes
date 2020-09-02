FROM centos:latest

RUN yum update -y
RUN yum install httpd httpd-tools -y
RUN yum install vim -y
RUN yum install epel-release -y
RUN yum update -y
RUN yum install htop -y

# Thư mục làm việc mặc định của image
WORKDIR /var/www/html
EXPOSE 80

ADD ./test.html /var/www/html/

ENTRYPOINT ["httpd"]
CMD ["-D", "FOREGROUND"]

# docker build -t myimage:v1 -f Dockerfile .