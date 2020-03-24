FROM alpine:latest

COPY app.py /opt

ENTRYPOINT python /opt/app.py
