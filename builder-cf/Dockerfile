FROM 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-base:0.0.93

RUN yum-config-manager --add-repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo \
  && yum install -y cf-cli \
  && yum clean all

# jx
ENV JX_VERSION 2.1.112
RUN curl -f -L https://github.com/rajattyagipvr/jx/releases/download/v${JX_VERSION}/jx-linux-amd64.tar.gz | tar xzv && \
  mv jx /usr/bin/

CMD ["cf","--version"]
