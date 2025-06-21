FROM node:18-alpine

VOLUME /artillery
WORKDIR /artillery

ADD petclinic.yml /artillery/petclinic.yml
ADD docker-entrypoint.sh /artillery/docker-entrypoint.sh

RUN npm install -g artillery@v2.0.23 --unsafe-perm=true --allow-root && \
    apk add --no-cache curl && \
    chmod +x /artillery/docker-entrypoint.sh

ENTRYPOINT ["/artillery/docker-entrypoint.sh"]
CMD ["run", "petclinic.yml"]
