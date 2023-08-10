FROM ruby:3.2.2

# RUN apt-get update && apt-get install -y \
#         libvips \
#         imagemagick

WORKDIR /bbs

COPY Gemfile Gemfile.lock ./
RUN bundle
COPY . .

ENTRYPOINT ["bash", "/bbs/entrypoint.sh"]

CMD ["rails", "s", "-b", "0.0.0.0"]
