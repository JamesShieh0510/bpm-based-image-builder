FROM debian
# set the base image

# author
MAINTAINER James Shieh <p96044168@student.ncku.edu.tw>

# extra metadata
LABEL version="1.0.0"
LABEL description="Container Based Image For BPM Modules"


# install app runtimes and modules
RUN apt-get update
RUN apt-get install -y r-base
RUN apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs
RUN apt-get install -y npm

RUN mkdir /app
ADD ./application-source-code/ /app

EXPOSE 8054
COPY ./start-bpm-service.sh /app/start-bpm-service.sh
ENTRYPOINT ["sh","/app/start-bpm-service.sh"]
