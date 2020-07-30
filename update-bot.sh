#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

jx step create pr chart --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-ruby --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-swift \
  --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-dlang --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-go --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-go-maven \
  --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-gradle --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-gradle4 --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-gradle5 \
  --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-jx --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-maven --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-maven-32 \
  --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-maven-java11 --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-maven-nodejs --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-newman \
  --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-nodejs --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-nodejs8x --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-nodejs10x \
  --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-nodejs12x --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-php5x --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-php7x \
  --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-python --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-python2 --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-python37 \
  --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-rust --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-scala --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-terraform \
  --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-go-nodejs --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-dotnet --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-maven-java14 \
  --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-nodejs14x --name 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-maven-graalvm-java11 \
  --version ${VERSION} --repo https://github.com/rajattyagipvr/jxboot-helmfile-resources.git

jx step create pr regex --regex "builderTag: (.*)" --version ${VERSION} --files jx-build-templates/values.yaml --repo https://github.com/rajattyagipvr/jx-build-templates.git
jx step create pr regex --regex "(?m)^\s+repository: 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-[\w-_]+\s+tag: (?P<version>.*)$" --version ${VERSION} --files jxboot-helmfile-resources/values.yaml --files values.yaml --repo https://github.com/rajattyagipvr/jxboot-helmfile-resources.git
jx step create pr regex --regex "(?m)^\s+repository: 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-maven\s+tag: (?P<version>.*)" --version ${VERSION} --files prow/values.yaml --files environment-controller/values.yaml --repo https://github.com/rajattyagipvr/prow.git --repo https://github.com/rajattyagipvr/environment-controller.git
jx step create pr regex --regex "(?m)^\s+repository: 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-[\w-_]+\s+tag: (?P<version>.*)$" --version ${VERSION} --files jxboot-helmfile-resources/values.yaml --repo https://github.com/rajattyagipvr/jxboot-helmfile-resources.git
jx step create pr regex --regex "(?m)^\s+image: 702769831180.dkr.ecr.ap-south-1.amazonaws.com/702769831180/builder-[\w-_]+:(?P<version>.*)$" --version ${VERSION} --files jxboot-helmfile-resources/values.yaml --repo https://github.com/rajattyagipvr/jxboot-helmfile-resources.git

JX_VERSION=$(echo $VERSION|cut -d'-' -f1)
jx step create pr chart --name jx --version $JX_VERSION  --repo https://github.com/rajattyagipvr/jenkins-x-platform.git --src-repo https://github.com/rajattyagipvr/jx.git
jx step create pr regex --regex "\s*jxTag:\s*(.*)" --version $JX_VERSION --files prow/values.yaml --repo https://github.com/rajattyagipvr/prow.git --src-repo https://github.com/rajattyagipvr/jx.git

