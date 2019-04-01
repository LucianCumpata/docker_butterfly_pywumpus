FROM garland/butterfly

RUN apt-get update \
 && apt-get install -y -q git

RUN apt-get install -y -q software-properties-common \
 && add-apt-repository ppa:deadsnakes/ppa

RUN apt-get update \
 && apt-get install -y -q python3.6

WORKDIR /games-repo

RUN git clone https://github.com/LucianCumpata/pywumpus.git

WORKDIR /opt/app

EXPOSE 57575

CMD ["butterfly.server.py", "--unsecure", "--host=0.0.0.0"]
ENTRYPOINT ["docker/run.sh"]


