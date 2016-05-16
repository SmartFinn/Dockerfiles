FROM smartfinn/ruby:alpine

RUN gem install --no-rdoc --no-ri sass

WORKDIR /tmp

USER nobody

VOLUME /src

ENTRYPOINT ["sass", "--watch", "/src"]
