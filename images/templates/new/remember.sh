#!/bin/bash
file=index.sgml
rm $file
sgmlfiles=`ls *.sgml`

# create sgml files from txt files.
#for fil in ./*.txt; do
#FIXME
#done

# create all over sgml file.
echo "<!DOCTYPE book PUBLIC \"-//OASIS//DTD DocBook V4.1//EN\" [" >> $file
for fil in $sgmlfiles; do
	entity=`basename $fil .sgml`
	echo "<!ENTITY $entity SYSTEM \"$fil\">" >> $file
done
echo "]><book><toc></toc><chapter><title>Headers</title>" >> $file
for fil in $sgmlfiles; do
	entity=`basename $fil .sgml`
	echo "&${entity};" >> $file
done
echo "</chapter></book>" >> $file

# Translate to html
jw -b html --nochunks -d html.dsl $file
htmlfile=`basename $file .sgml`.html
htmltemp=${htmlfile}.temp
tidy -o $htmltemp $htmlfile

# Make html tags better suited for css style-sheets
cat $htmltemp |sed \
	-e 's/<th align=\"left\">0<\/th>/<th class=firsttr>0<\/th>/g' \
	-e 's/<th align=\"left\">\([123]\)<\/th>/<th class=firsttr0>\1<\/th>/g' \
	-e 's/<th>&nbsp;<\/th>/<th class=firsttr>\&nbsp;<\/th>/g' \
	-e 's/<th>0<\/th>/<th class=secondtr0>0<\/th>/g' \
	-e 's/<th align=\"left\">&nbsp;<\/th>/<th class=firsttr>\&nbsp;<\/th>/g' \
	-e 's/<th>\([1-9]\)<\/th>/<th class=secondtr>\1<\/th>/g' | \
	sed -e '/<tr>[ \t]*$/{ 
N
}
s/<tr>\n<th class=secondtr0>0<\/th>/<tr>\n<th class=secondtrstartth>0<\/th>/g' \
	> $htmlfile

rm $htmltemp
