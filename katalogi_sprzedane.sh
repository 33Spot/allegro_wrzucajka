#!/bin/sh
#cd $(pwd)
sed -e "/^x/!d" -e "/^#/d" -e 's/\(.\{1\}\)//' <katalogi_ciuchy.txt>lista_katalogi_ciuchy_sprzedane.txt
sed -e "s/\+/_plus_/g" -e "s/-/_-_/g" -e "s/ /_/g" -e "s/D\&G/Dolce_and_Gabanna/g" <lista_katalogi_ciuchy_sprzedane.txt>lista_katalogi_ciuchy_sprzedane_kat.txt
#-e "s/__/_/g"
cp @@lista.txt @@lista_sprzedane.txt
while read ciuszek; do
#ciuszek=BURBURRY_body
sed -i -e "/=/i \
end_section" @@lista_sprzedane.txt
sed -i -e '1!b' -i -e '/end_section/d' @@lista_sprzedane.txt
echo 'end_section' >>@@lista_sprzedane.txt
sed -i -e "/^\s*$/d" -i -e "/=$ciuszek/,/end_section/{//!d}" @@lista_sprzedane.txt
sed -i -e "/=$ciuszek/d" @@lista_sprzedane.txt
sed -i -e "$!N; /^\(.*\)\n\1$/!P; D" @@lista_sprzedane.txt
sed -i -e "/end_section/d" @@lista_sprzedane.txt
done <lista_katalogi_ciuchy_sprzedane_kat.txt

mkdir -p /home/danuta/Pulpit/ALLEGRO/"STARE KOPIE"/"@@@@@allegro sprzedane__2"
while read katalogi; do
#mv -f $katalogi/ --target-directory=/home/danuta/Pulpit/ALLEGRO/"@@@@@allegro sprzedane__2"/$katalogi/
mv -f $katalogi/ --target-directory=/home/danuta/Pulpit/ALLEGRO/"@@@@@allegro sprzedane__2"/
rm -f -d -r $katalogi/
done <lista_katalogi_ciuchy_sprzedane_kat.txt


