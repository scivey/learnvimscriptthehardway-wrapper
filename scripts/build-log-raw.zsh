mkdir tmp/venvs
mkdir tmp/venvs -p
virtualenv -p python2.7 tmp/venvs/bmdown
./tmp/venvs/bmdown/bin/pip version
./tmp/venvs/bmdown/bin/pip --version
. ./tmp/venvs/bmdown/bin/activate
echo $PATH
l
which python
which python2.7
cd external/sjl/bookmarkdown
l
ll bookmarkdown
less bookmarkdown/bookmarkdown
wc -l bookmarkdown/bookmarkdown
nvim bookmarkdown/bookmarkdown
k
l
VBIN='../../../tmp/venvs/bmdown/bin'
echo ${VBIN:A}
VBIN=${VBIN:A}
echo $VBIN
$VBIN/pip --version
less setup.py
less requirements.txt
$VBIN/pip install requirements.txt
$VBIN/pip install -r requirements.txt
$VBIN/pip install -e .
ll $VBIN
ll
ll bookmarkdown
gs
cd ../
gs
cd learnvimscriptthehardway
l
cat build.sh
$VBIN/python ../bookmarkdown/bookmarkdown/bookmarkdown --help
$VBIN/python ../bookmarkdown/bookmarkdown/bookmarkdown html
l
gs
l build
l build/html
cd ../
cd ../../
l

