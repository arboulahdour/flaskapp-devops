FROM  alpine:3.8
    
RUN   mkdir  /var/flasksite

COPY  .  /var/flasksite/

WORKDIR  /var/flasksite/

RUN apk add python3 

RUN  pip3 install  -r requirements.txt 

EXPOSE 5000

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
