#! /bin/sh
# tags default ruby and associated gems

SRC="${rvm_path}/rubies/${RUBY_VERSION}"

ctags \
  --exclude=.git \
  --exclude=tags \
  --exclude=logs \
  --exclude=doc \
  --exclude=*.js \
  -R -f ./tags $SRC .

echo "Tags Generated Bitch"
