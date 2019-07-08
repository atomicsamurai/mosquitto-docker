FROM eclipse-mosquitto

ENV TIMEZONE=America/Edmonton

RUN apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo ${TIMEZONE} > /etc/timezone

VOLUME ["/mosquitto/data", "/mosquitto/log"]

# Set up the entry point script and default command
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]