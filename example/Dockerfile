FROM slydeveloper/alpine:latest

ADD entrypoint.sh /
ADD test.html /
ADD mail.txt /
ADD ssmtp.conf /etc/ssmtp/ssmtp.conf
ADD revaliases /etc/ssmtp/revaliases

RUN apk update && apk add --no-cache ssmtp

ENTRYPOINT ["sh", "./entrypoint.sh"]