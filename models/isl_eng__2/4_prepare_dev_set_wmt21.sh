PATH_WMT21="/home/wran/data"

cd $PATH_WMT21
# wget http://data.statmt.org/wmt21/translation-task/dev.tgz 

tar -xvzf dev.tgz

python3.7 "${PATH_WMT21}/dev/xml/extract.py" "${PATH_WMT21}/dev/xml/newsdev2021.is-en.xml"