FROM node:14.15.3-alpine
MAINTAINER Iyad Marzouka <iyad.marzouka@gmail.com>

ENV FIREBASE_TOOLS_VERSION 9.0.1
ENV HUGO_VERSION 0.79.0
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit

# Install Firebase tools
RUN npm install -g firebase-tools@${FIREBASE_TOOLS_VERSION}

# Install Hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /tmp/hugo.tar.gz
RUN mkdir /usr/local/hugo \
	&& tar xzf /tmp/hugo.tar.gz -C /usr/local/hugo/ \
	&& ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
	&& rm /tmp/hugo.tar.gz