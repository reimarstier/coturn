FROM alpine

# Docs
# https://nextcloud-talk.readthedocs.io/en/latest/TURN/
ENV TURN_PORT 3478
ENV TURN_PORT_START 10000
ENV TURN_PORT_END 20000
ENV TURN_SERVER_NAME coturn
ENV TURN_REALM myrealm
ENV TURN_SECRET none
ENV TURN_LOG_FILE /dev/null

RUN apk add --no-cache coturn tini
ADD start_coturn.sh /start_coturn.sh
RUN chmod +x /start_coturn.sh

EXPOSE 3478

ENTRYPOINT ["tini", "--"]
CMD ["/start_coturn.sh"]

