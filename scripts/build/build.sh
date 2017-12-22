echo "EchoPlay AWS play build"
TMP_DIR="build/echoplay-aws"
mkdir -p $TMP_DIR
scripts/git-archive-all/git-archive-all.sh --format zip -s $TMP_DIR
cd $TMP_DIR
unzip echoplay-aws.zip
unzip echoplay-server.zip
rm echoplay-aws.zip echoplay-server.zip scripts.git-archive-all.zip
cd ..
zip -r echoplay-aws{.zip,}
rm -rf echoplay-aws
