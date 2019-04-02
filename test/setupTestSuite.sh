# Logan Wilson
# this script hopefully will work, and you'll be able to run tests then!

# 1st - get node js
echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc
. ~/.bashrc
mkdir ~/local
mkdir ~/node-latest-install
cd ~/node-latest-install
curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
./configure --prefix=~/local
make install # ok, fine, this step probably takes more than 30 seconds...
curl https://www.npmjs.org/install.sh | sh

# 2nd install testcafe
npm install -g testcafe

# 3rd set up git hook to run tests on commit
FILE="../.git/hooks/post-commit"
/bin/cat <<EOM >$FILE

#!/bin/sh
# Logan Wilson
# this script was created by tests/setupTestSuite.sh
# run the test scripts after every commit
echo
echo Running test scripts. If tests fail, consider revising before pushing to branch
echo
cd test
./runTest.sh

EOM
chmod 777 $FILE


