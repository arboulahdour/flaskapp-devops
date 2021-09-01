# Flask App For DevOps Using Docker 

The purpose of this lab is to show you how to get a Python-Flask application into a Docker container. 
We will build a Docker image of a simple web application in Python, then we will deploy it as container from the created image on developement server.

## Prerequisites
- 01 server (ubuntu/centos)

## Install Docker Engine

Docker Engine is available on a variety of Linux platforms, macOS and Windows 10 through Docker Desktop, and as a static binary installation. Please follow the Docker [official document](https://docs.docker.com/engine/install/)  for Docker Installation.

## Building the Docker image

I have already developed the Dockerfile and python app and it is provided below,

### python app

~~~sh
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
  return '<body style="background: #0b131f; color: white; font-size: 30px; margin: 100px; letter-spacing: 2.5px;"><h1><center>--- Flask Application For DevOps Lab ---</center></h1></body>'

app.run(host='0.0.0.0', port=5000)
~~~

### Dockerfile

~~~sh
FROM  alpine:3.8
RUN   mkdir  /var/flaskapp
COPY  .  /var/flaskapp
WORKDIR  /var/flaskapp
RUN apk add python3
RUN  pip3 install  -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]
~~~

Please perform the steps below to clone the github repository;

~~~sh
apt install git -y
git clone https://github.com/Arboulahdour/flaskapp-devops.git
~~~ 

Go to the directory that has the Dockerfile and run the following command to build the Docker image. The -t flag lets you tag your image so it's easier to find later using the docker images command:
~~~sh
cd flaskapp-devops/
docker build -t <your username>/flaskapp:1> . 
~~~

Your image will now be listed by Docker by the command:
~~~sh
docker image ls
~~~

Now run the container from the Image created:
~~~sh
docker container run --name flaskapp -p 80:5000 -d arboulahdour/flaskapp:1
~~~

To test your app, get the port of your app that Docker mapped:
~~~sh
docker container ls
~~~

In the example above, Docker mapped the 3000 port inside of the container to the port 80 on your machine.

Now you can test your app using curl or access the server IP through web browser
~~~sh
curl -I http://SERVER-IP:80
curl -L http://SERVER-IP:80
~~~

You can also push this image to Docker Hub repositories

[Docker Hub repositories](https://docs.docker.com/docker-hub/repos/) allow you to share container images with your team, customers, or the Docker community at large.

I have uploaded this Container Image to docker hub and you can download the image by

~~~sh
docker pull arboulahdour/flaskapp:1
~~~

## Author
Created by @Arboulahdour

<a href="mailto:ar.boulahdour@outlook.com">E-mail me !</a>
