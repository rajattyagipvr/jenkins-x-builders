FROM 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-base:0.0.93

ENV PYTHONVERSION 3.7.1

RUN yum -y install gcc openssl-devel bzip2-devel libffi-devel libsqlite3x-devel && yum clean all

RUN cd /usr/src && \
    wget https://www.python.org/ftp/python/${PYTHONVERSION}/Python-${PYTHONVERSION}.tgz && \
    tar xzf Python-${PYTHONVERSION}.tgz && \
    cd Python-${PYTHONVERSION} && \
    ./configure --enable-optimizations --enable-loadable-sqlite-extensions && \
    make altinstall && \
    rm /usr/src/Python-${PYTHONVERSION}.tgz && \
    cd ../ && \
    rm -rf /usr/src/Python-${PYTHONVERSION} && \
    ln -fs /usr/local/bin/python3.7 /usr/bin/python3 && \
    yum -y remove gcc openssl-devel bzip2-devel libsqlite3x-devel && \
    yum clean all && \
    easy_install-3.7 pip && \
    pip install --upgrade pip && \
    pip install --upgrade awscli && \
    pip install --upgrade awscli-local


# jx
ENV JX_VERSION 2.1.112
RUN curl -f -L https://github.com/rajattyagipvr/jx/releases/download/v${JX_VERSION}/jx-linux-amd64.tar.gz | tar xzv && \
  mv jx /usr/bin/

CMD ["python3", "--version"]
