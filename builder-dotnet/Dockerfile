FROM 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-base:0.0.93

RUN rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm \
    && yum -y update \
    && yum -y install dotnet-sdk-3.0 \
    && yum clean all

RUN dotnet new --install "Microsoft.DotNet.Web.ProjectTemplates.2.2"

# jx
ENV JX_VERSION 2.1.112
RUN curl -f -L https://github.com/rajattyagipvr/jx/releases/download/v${JX_VERSION}/jx-linux-amd64.tar.gz | tar xzv && \
  mv jx /usr/bin/
