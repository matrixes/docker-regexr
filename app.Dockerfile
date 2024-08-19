FROM node:8.16.1-buster-slim

COPY regexr-3.6.1 /regexr

RUN cd /regexr && npm install

WORKDIR /regexr

ENTRYPOINT "node_modules/gulp/bin/gulp.js"
