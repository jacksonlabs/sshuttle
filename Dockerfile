FROM alpine:3

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

ENV TARGET_USER root
ENV TARGET_ID /root/.ssh/id_rsa
ENV TARGET_HOST localhost
ENV TARGET_PORT 22

ENV REMOTE_ADDRESS '[::]'
ENV REMOTE_PORT 22

ENV LOCAL_ADDRESS localhost
ENV LOCAL_PORT 2020

ENV HOST_KEY_CHECK no

CMD /usr/bin/ssh \
    -N \
    -T \
    -o ServerAliveInterval=10 \
    -o ServerAliveCountMax=3 \
    -o StrictHostKeyChecking=${HOST_KEY_CHECK} \
    -i ${TARGET_ID} \
    -o ExitOnForwardFailure=yes \
    -p ${TARGET_PORT} \
    -R "${REMOTE_ADDRESS}:${REMOTE_PORT}:${LOCAL_ADDRESS}:${LOCAL_PORT}" \
    ${TARGET_USER}@${TARGET_HOST}
