
# Jenkins on Alpine
![GitHub last commit](https://img.shields.io/github/last-commit/edubasilio/docker-jenkins-alpine?style=plastic)
![Docker Automated build](https://img.shields.io/docker/automated/basiliocode/jenkins-alpine?style=plastic)
![MicroBadger Layers](https://img.shields.io/microbadger/layers/basiliocode/jenkins-alpine?style=plastic)
![MicroBadger Size](https://img.shields.io/microbadger/image-size/basiliocode/jenkins-alpine?style=plastic)

[Docker Hub Page](https://hub.docker.com/repository/docker/basiliocode/jenkins-alpine)

Jenkins on Alpine Docker Image Base with:
* openjdk-11
* git
* and jenkins plugins:
* pipeline-github-lib:1.0
* pipeline-build-step:2.11
* script-security:1.70
* workflow-step-api:2.22
* gradle:1.36
* workflow-durable-task-step:2.35
* pipeline-model-api:1.5.1
* branch-api:2.5.5
* build-timeout:1.19.1
* docker-workflow:1.21
* ldap:1.21
* pipeline-stage-step:2.3
* pipeline-model-declarative-agent:1.1.1
* workflow-cps:2.80
* jackson2-api:2.10.2
* plain-credentials:1.7
* scm-api:2.6.3
* ant:1.11
* pam-auth:1.6
* credentials:2.3.1
* handlebars:1.1.1
* credentials-binding:1.21
* github:1.29.5
* trilead-api:1.0.5
* mailer:1.30
* pipeline-stage-view:2.13
* ssh:2.6.1
* github-branch-source:2.6.0
* pipeline-model-definition:1.5.1
* apache-httpcomponents-client-4-api:4.5.10-2.0
* git-client:3.1.1
* workflow-support:3.4
* workflow-basic-steps:2.19
* pipeline-milestone-step:1.3.1
* junit:1.28
* cloudbees-folder:6.11.1
* bouncycastle-api:2.18
* workflow-scm-step:2.10
* ace-editor:1.1
* antisamy-markup-formatter:1.8
* github-api:1.106
* pipeline-model-extensions:1.5.1
* jsch:0.1.55.2
* matrix-project:1.14
* pipeline-graph-analysis:1.10
* git-server:1.9
* jaxb:2.3.0.1
* ssh-slaves:1.31.1
* docker-commons:1.16
* lockable-resources:2.7
* pipeline-rest-api:2.13
* structs:1.20
* locale:1.4
* email-ext:2.68
* pipeline-stage-tags-metadata:1.5.1
* token-macro:2.11
* resource-disposer:0.14
* git:4.1.1
* workflow-cps-global-lib:2.15
* display-url-api:2.3.2
* thinBackup:1.9
* command-launcher:1.4
* momentjs:1.1.1
* timestamper:1.11
* ws-cleanup:0.38
* workflow-api:2.39
* authentication-tokens:1.3
* durable-task:1.33
* jquery-detached:1.2.1
* matrix-auth:2.5
* workflow-job:2.36
* pipeline-input-step:2.11
* workflow-aggregator:2.6
* jdk-tool:1.4
* ssh-credentials:1.18.1
* workflow-multibranch:2.21
* gitlab-plugin:1.5.13


### Volumes
#### jenkins_home
In _host machine_, create a directory called `jenkins_home`. This directory will use as docker volume linked to `/var/jenkins_home` in container docker.

#### backup
In _host machine_, create a directory called `backup`. The _thinBackup_ jenkins plugin use this directory to keep backup files.

### Create Container
```sh
docker create --name container_name -p 8080:8080 -v /path/to/jenkins_home:/var/jenkins_home -v /path/to/backup:/srv/backup basiliocode/jenkins-alpine
```

### Initial Config
Copy `initial_config` content directory to `/var/jenkins_home` and restart docker container. This config in jenkins:
* open jdk 11
* thinBackup plugin
```sh
docker cp container_name:/var/tmp/initial_config/. /path/to/jenkins_home/
```
* `/path/to/jenkins_home/` in _host machine_

### Restore backup
Copy backup content in `path/to/backup` volume to `/path/to/jenkins_home` volume and start docker container. The _thinBackup_ jenkins plugin is backup manager.
```sh
cp -r /path/to/backup/* /path/to/jenkins_home/
```

### Start Container
```sh
docker start container_name
```

### Access Jenkins
On browser access `host:8080`
* Login: `admin`
* password: `admin` (warning: change this password)

### Generate Jenkins Plugins list:
With `admin` user, access `host:8080/script/` and run the next script:
```groovy
Jenkins.instance.pluginManager.plugins.each{
  plugin -> println ("${plugin.getShortName()}:${plugin.getVersion()}")
}
```
