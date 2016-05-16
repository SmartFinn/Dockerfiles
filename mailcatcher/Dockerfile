FROM smartfinn/ruby:alpine
MAINTAINER Sergei Eremenko <http://github.com/SmartFinn>

RUN apk --no-cache add sqlite-libs \
 && apk --no-cache add --virtual .build-deps build-base ruby-dev sqlite-dev \
 && gem install --no-rdoc --no-ri mailcatcher \
 && apk --no-cache del .build-deps

EXPOSE 1025 1080

CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
