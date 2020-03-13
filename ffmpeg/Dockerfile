FROM ubuntu:latest
RUN apt update
RUN apt -y upgrade
RUN apt install -y ffmpeg
COPY ./ffmpeg/bebas.ttf .
COPY ./ffmpeg/start.sh .
COPY ./ffmpeg/${VIDEO} .
CMD ["sh", "./start.sh"]