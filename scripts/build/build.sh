echo "EchoPlay AWS build"

PACKAGE_NAME=$(cat package.json \
  | grep name \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')
PACKAGE_VERSION=$(npm version patch)
PACKAGE_VERSION=$(echo $PACKAGE_VERSION | cut -c 2-)
echo $PACKAGE_NAME $PACKAGE_VERSION

BUILD_DIR=$(pwd)"/build"
TMP_DIR=$BUILD_DIR"/echoplay-aws"
ZIP_FILE=$PACKAGE_NAME"_"$PACKAGE_VERSION".zip"
echo $ZIP_FILE
mkdir -p $TMP_DIR
scripts/git-archive-all/git-archive-all.sh --format zip -s $TMP_DIR
cd $TMP_DIR
unzip echoplay-aws.zip
unzip echoplay-server.zip
unzip scripts.git-archive-all.zip
rm echoplay-aws.zip echoplay-server.zip scripts.git-archive-all.zip
zip -r $ZIP_FILE ./*
mv ./$ZIP_FILE $BUILD_DIR
rm -rf $TMP_DIR
