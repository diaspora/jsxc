#! /bin/bash

DROOT=$1;
JROOT=$PWD;

if [ "$DROOT" == "" ];
then
  echo "$0 <absolute-diaspora-directory>";
  exit 1;
fi

echo "Please run the script from the jsxc root-directory!
(hit CTRL+C to abort) "; read;
echo "Please make sure that you provided an absolute path
to the diaspora installation!
(hit CTRL+C to abort) "; read;

cd $JROOT && \
  npm install && \
  node_modules/.bin/grunt build:prerelease

# "main": [
#   "build/lib/jsxc.dep.js",
#   "build/jsxc.min.js",
#   "build/css/jsxc.css",
#   "build/css/jsxc.webrtc.css"
# ],

GPATH=$(bash -lc "cd $DROOT; bundle show rails-assets-diaspora_jsxc");
JSPATH="${GPATH}/app/assets/javascripts/diaspora_jsxc";
CSPATH="${GPATH}/app/assets/stylesheets/diaspora_jsxc";

echo -e "\nCopying files to installation directory:";

cd $JROOT && \
  cp -vf build/lib/jsxc.dep.js ${JSPATH}/lib/jsxc.dep.js && \
  cp -vf build/jsxc.min.js ${JSPATH}/jsxc.min.js && \
  cp -vf build/css/jsxc.css ${CSPATH}/jsxc.scss && \
  cp -vf build/css/jsxc.webrtc.css ${CSPATH}/jsxc.webrtc.scss

echo -e "\nDone";

exit 0;
