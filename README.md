# Docker Image with simple Python-Flask Application

The goal of this example is to show you how to get a Python-Flask application into a Docker container. The guide is intended for development, and not for production deployment. The guide assumes you have a basic understanding of how a Python application is structured.
We will create a simple web application in Python, then we will build a Docker image for that application, and lastly, we will instantiate a container from that image.

## Prerequisites
- SSH root access to VPS/Dedicated Server

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
  return '<h1><center>This Sample Flask Application</center></h1>'

app.run(host='0.0.0.0', port=5000)
~~~

### Dockerfile

~~~sh
FROM  alpine:3.8
RUN   mkdir  /var/flasksite
COPY  .  /var/flasksite/
WORKDIR  /var/flasksite/
RUN apk add python3
RUN  pip3 install  -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]
~~~

Please perform the steps below to clone the github repository;

~~~sh
apt install git -y
git clone https://github.com/sebinxavi/Docker-Image-Of-Simple-Python-Flask-Application
~~~ 

<p align="left">
  <img width="600" height="250" src="https://i.ibb.co/7CjLtGw/1.png">
</p>

Go to the directory that has the Dockerfile and run the following command to build the Docker image. The -t flag lets you tag your image so it's easier to find later using the docker images command:
~~~sh
cd Docker-Image-Of-Simple-Python-Flask-Application/
docker build -t <your username>/python-web-app:1> . 
~~~

<p align="left">
  <img width="600" height="250" src="https://i.ibb.co/WDvj4p8/2.png">
</p>


Your image will now be listed by Docker by the command:
~~~sh
docker image ls
~~~

Now run the container from the Image created:
~~~sh
docker container run --name pythonapp -p 80:5000 -d sebinxavi/python-web-app:1
~~~

<p align="left">
  <img width="600" height="250" src="https://i.ibb.co/MDhqMVX/3.png">
</p>

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

![alt text](https://i.ibb.co/7JSjkpG/4.png)

You can also push this image to Docker Hub repositories

[Docker Hub repositories](https://docs.docker.com/docker-hub/repos/) allow you to share container images with your team, customers, or the Docker community at large.

I have uploaded this Container Image to docker hub and you can download the image by

~~~sh
docker pull sebinxavi/python-web-app:1
~~~

<p align="left">
  <img width="600" height="250" src="https://i.ibb.co/YRxpzGg/5.png">
</p>

![alt text](https://i.ibb.co/D55Bzbn/6.png)


## Author
Created by [@sebinxavi](https://www.linkedin.com/in/sebinxavi/) - feel free to contact me and advise as necessary!

<a href="mailto:sebin.xavi1@gmail.com"><img src="https://img.shields.io/badge/-sebin.xavi1@gmail.com-D14836?style=flat&logo=Gmail&logoColor=white"/></a>
<a href="https://www.linkedin.com/in/sebinxavi"><img src="https://img.shields.io/badge/-Linkedin-blue"/></a>
