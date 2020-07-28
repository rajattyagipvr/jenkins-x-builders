FROM 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-base:0.0.93

ENV \
    DMD_PATH=/opt/dlang

RUN yum install -y gcc openssl-devel \
    && yum clean all

RUN curl -fsS https://dlang.org/install.sh | bash -s dmd install -p /opt \
    && export DMD_VERSION=$(ls /opt | grep dmd) \
    && mv /opt/${DMD_VERSION} ${DMD_PATH}

ENV \
  PATH=${DMD_PATH}/linux/bin64:${PATH} \
  LD_LIBRARY_PATH=${DMD_PATH}/linux/lib64 \
  LIBRARY_PATH=${DMD_PATH}/linux/lib64 \
  PS1="(dmd}) \\u@\\h:\\w\$"

# jx
ENV JX_VERSION 2.1.112
RUN curl -f -L https://github.com/rajattyagipvr/jx/releases/download/v${JX_VERSION}/jx-linux-amd64.tar.gz | tar xzv && \
  mv jx /usr/bin/

CMD ["dmd"]
