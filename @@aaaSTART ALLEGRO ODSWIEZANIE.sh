#!/bin/sh
#sh '$(pwd)/'
sh 'katalogi sprzedane.sh'

cp @@lista.txt @@lista_backup.txt
cp -f @@lista_sprzedane.txt @@lista.txt
#=============================================================
cp -f @@lista.txt @@listacp.txt
sed -i -e "/^=/!d" -e "s/=//g" -e "s/\+/_plus_/g" -e "s/-/_-_/g" -e "s/ /_/g" -e "s/D\&G/Dolce_and_Gabanna/g" @@listacp.txt
#rm -R `ls -1 -d */`
while read katalogi; do
rm -f -d -r $katalogi/
done <@@listacp.txt
#=============================================================
#bash

for i in $(ls -d */); do echo ${i%%/}; done >katalogi_ciuchy.txt
cp katalogi_ciuchy.txt katalogi_ciuchy_lista.txt
sed -i -e "s/_plus_/\+/g" -i -e "s/_-_/-/g" -i -e "s/_/ /g" -i -e "s/Dolce_and_Gabanna/D\&G/g" katalogi_ciuchy.txt
sed -e "s/\+/_plus_/g" -e "s/-/_-_/g" -e "s/ /_/g" -e "s/D\&G/Dolce_and_Gabanna/g" -e "/=/! s/^/cp\ IMG_/" -e "/=/! s/$/\.JPG\ \$pwd \$folder/" -e "/=/ s/^/folder/" -e "/=/ s/$/\nmkdir\ \$folder/" <@@lista.txt>@@lista3.txt
#sed -f allegro_wrzucajka.sed <@@lista.txt>@@lista3.txt
chmod +X @@lista3.txt
sh ./@@lista3.txt


