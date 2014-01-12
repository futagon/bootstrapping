# Futagon Infrasturcture Bootstrapping

_Description: build docker image, install ruby-2.1.0(use rbenv), node-11.10(use nvm)._

## How to use
### _use dockerimage_
```
$ docker run -i -t username
```
or
### _build dockerimage_
```
$ git clone git@github.com:futagon/bootstrapping
$ cd bootstrapping && docker build username/bootstrapping .
$ docker run -i -t username/bootstrapping
```
