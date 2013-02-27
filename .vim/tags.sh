#! /bin/sh
# tags default ruby and associated gems

SRC="${rvm_path}/rubies/${RUBY_VERSION}"

GEMS=`rvm gemdir`/gems

ctags \
  --exclude=.git \
  --exclude=tags \
  --exclude=logs \
  --exclude=doc \
  --exclude=*.js \
  -R -f ./tags $SRC $GEMS

echo "Tags Generated Bitch"
