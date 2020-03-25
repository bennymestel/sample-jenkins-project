FROM centos:latest

COPY app.py /opt

RUN "yum install -y python3"

ENTRYPOINT python /opt/app.py
