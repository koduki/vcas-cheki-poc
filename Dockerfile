FROM ruby

RUN apt-get install -y imagemagick libmagickwand-dev
RUN gem install rest-client rmagick