FROM 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-base:0.0.93

RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
  yum install -y yum-utils && \
  yum-config-manager --enable remi-php72 && \
  yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo && \
  yum clean all

# jx
ENV JX_VERSION 2.1.112
RUN curl -f -L https://github.com/rajattyagipvr/jx/releases/download/v${JX_VERSION}/jx-linux-amd64.tar.gz | tar xzv && \
  mv jx /usr/bin/

CMD ["php", "-v"]
