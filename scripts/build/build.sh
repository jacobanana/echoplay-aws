echo "EchoPlay AWS play build"
BUILD_DIR=$(pwd)"/build"
TMP_DIR=$BUILD_DIR"/echoplay-aws"
ZIP_FILE="echoplay-aws.zip"
mkdir -p $TMP_DIR
scripts/git-archive-all/git-archive-all.sh --format zip -s $TMP_DIR
cd $TMP_DIR
unzip echoplay-aws.zip
unzip echoplay-server.zip
rm echoplay-aws.zip echoplay-server.zip scripts.git-archive-all.zip
zip -r $ZIP_FILE ./*
mv ./$ZIP_FILE $BUILD_DIR
rm -rf $TMP_DIR
