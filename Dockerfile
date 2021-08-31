FROM  alpine:3.8
    
RUN   mkdir  /var/flaskapp

COPY  .  /var/flaskapp/

WORKDIR  /var/flaskapp/

RUN apk add python3 

RUN  pip3 install  -r requirements.txt 

EXPOSE 5000

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]
