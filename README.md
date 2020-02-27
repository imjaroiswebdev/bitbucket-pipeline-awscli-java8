# bitbucket-pipeline-awscli-java8

[![Docker Automated build](https://img.shields.io/docker/automated/imjarois/bitbucket-pipeline-awscli-java8?style=flat-square)](https://hub.docker.com/r/imjarois/bitbucket-pipeline-awscli-java8/)

## Overview

Docker image based on atlassian/default-imageV2 that includes AWS cli and is targeted for use in Bitbucket Pipelines build environment.

</br>

## Default environment

platform: ubuntu 16.04 wget xvfb curl ssh git: 2.7.4 mercurial: 3.7.3 java: Open-JDK 1.8u151 maven: 3.3.9 node: 12.16.1 npm: 6.13.7 nvm: 0.33.8 python: 2.7.12 gcc: 5.4.0 ant: 1.9.6

</br>

## Usage

To make use of AWS cli the following environment variables must be set through Bitbucket's Pipeline settings...

```bash
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION
```

</br>

## Support

PR to repository are welcome. Use at your own will, discretion, ends and risk... 💪🏽
