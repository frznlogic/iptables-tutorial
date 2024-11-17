all: ps pdf html src chunky chunkytgz htmltgz

chapters= $(wildcard chapters/*.sgml)
appendices= $(wildcard appendices/*.sgml)
scripts= $(wildcard scripts/*.txt)
license= $(wildcard licensing/*.sgml)
mains= $(wildcard *.sgml)

images_eps= $(patsubst %.gif,%.eps,$(wildcard images/*.gif))
images_jpg= $(patsubst %.gif,%.jpg,$(wildcard images/*.gif))
images_png= $(patsubst %.gif,%.png,$(wildcard images/*.gif))

OUTPATH=../homepage/output/documentation/tutorials/blueflux

.PHONY: site
site: all spanish portuguese
	-@echo "Making site..."
	-mkdir html
	-mkdir html/images
	-mkdir html/other
	-mkdir html/scripts
	-cp iptables-tutorial.ps.gz iptables-tutorial.html html/
	-cp iptables-tutorial.src.tgz iptables-tutorial.chunky.tgz html/
	-cp iptables-tutorial.html.tgz html/
	-cp -r other/* html/other/
	-cp -r images/*.gif html/images/
	-cp -r images/*.jpg html/images/
	-cp -r scripts/* html/scripts/
	-rm -rf html/scripts/CVS html/other/CVS
	-cp TODO ChangeLog html/
	-cp -r chunkyhtml html/
#	-cp mirrors.html index.php html/
	-cp -r portuguese/html html/portuguese
	-cp -r spanish/html html/spanish
	-@echo "Done."

.PHONY: portuguese
portuguese: 
	@echo "*** Making portuguese translation ***"
	cd portuguese; make site

.PHONY: spanish
spanish:
	@echo "*** Making spanish translation ***"
	cd spanish; make site

.PHONY: src
src: iptables-tutorial.src.tgz

.PHONY: ps
ps:  $(images_eps) index iptables-tutorial.ps.gz

.PHONY: pdf
pdf : $(images_png) index iptables-tutorial.pdf.gz

.PHONY: html
html: $(images_jpg) index iptables-tutorial.html

.PHONY: chunky
chunky: $(images_jpg) index chunkyhtml

.PHONY: chunkytgz
chunkytgz: index iptables-tutorial.chunky.tgz

.PHONY: htmltgz
htmltgz: index iptables-tutorial.html.tgz

.PHONY: index
index: $(images_jpg) iptables-tutorial-index.sgml

.PHONY: images
images: $(images_jpg) $(images_eps) $(images_png)

%-index.sgml: $(images_jpg) $(chapters) $(appendices) $(scripts) \
 $(license) $(mains)
	collateindex.pl -N -o $*-index.sgml
	mkdir -p index/images
	cp -R styles/ chapters/ appendices/ other/ licensing/ scripts/ *.sgml \
	 index
	cp -R images/*.jpg index/images
	cd index; jw --backend html -V html-index -V nochunks \
	 iptables-tutorial.sgml >> iptables-tutorial.html; collateindex.pl \
	 -g -s Symbols -p -o index.sgml HTML.index; cd ..
	cp index/index.sgml ./$*-index.sgml
	rm -rf index

%.chunky.tgz: $(images_jpg) $(chapters) $(appendices) $(scripts) \
 $(license) chunky
	@echo "Building chunky tgz version..."
	cp -r chunkyhtml chunkytgz
	cp changes.sh chunkytgz
	cd chunkytgz; sh ./changes.sh
	tar -cf $*.chunky.tar chunkyhtml 
	gzip -f $*.chunky.tar
	mv $*.chunky.tar.gz $*.chunky.tgz
	rm -rf chunkytgz
	@echo "Done."

%.html.tgz: $(images_jpg) $(chapters) $(appendices) $(scripts) \
 $(license) html
	@echo "Building HTML tgz version..."
	-mkdir $*
	-mkdir $*/images
	cp -r $*.html scripts other $*/
	cp -r images/*.gif images/*.jpg $*/images/
	cat $*/$*.html | sed -e 's/http:\/\/iptables-tutorial.frozentux.net\/scripts\//scripts\//g' > \
	 $*/$*2.html
	cat $*/$*2.html | sed -e 's/http:\/\/iptables-tutorial.frozentux.net\/other\//other\//g' > \
	 $*/$*.html
	rm -f $*/$*2.html
	tar -cf $*.html.tar $*
	gzip -f $*.html.tar
	mv $*.html.tar.gz $*.html.tgz
	rm -rf $*
	@echo "Done."

%.src.tgz: %.sgml
	@echo "Building source ball"
	tar -cf temp.tar iptables-tutorial.sgml scripts/* TODO \
	 ChangeLog Makefile spanish/* portuguese/* images/*.gif images/templates/* styles/* \
	 addons/* other/* licensing/* chapters/* \
	 appendices/* addons/* other/* bookinfo.sgml changes.sh README \
	 > /dev/null
	gzip -f temp.tar
	mv temp.tar.gz $*.src.tgz
	@echo "Done."

%.html: $(images_jpg) $(chapters) $(appendices) $(scripts) \
 $(license) %.sgml
	@echo "Building HTML version..."
	mkdir tmphtml; rsync -a . --exclude=tmphtml/ tmphtml;
	$(foreach file, $(chapters) $(appendices), sed '/colwidth=".*"/d' $(file) > tmphtml/$(file);)
	jw -d styles/html.dsl --backend html --nochunks tmphtml/$*.sgml
	rm -rf tmphtml
	@echo "Done."

chunkyhtml: $(images_jpg) $(chapters) $(appendices) $(scripts) \
 $(license)
	@echo "Building Chunky HTML version..."
	rm -rf chunkyhtml
	mkdir chunkyhtml
	mkdir chunkyhtml/images
	jw --backend html --output chunkyhtml -d styles/html.dsl \
	 iptables-tutorial.sgml
	cp -r images/*.gif chunkyhtml/images/
	cp -r images/*.jpg chunkyhtml/images/
	cp -r other chunkyhtml/other
	cp -r scripts chunkyhtml/scripts
	@echo "Done."

%.pdf.gz : $(images_eps) $(chapters) $(appendices) $(scripts) \
 $(license) %.sgml
	@echo "Building PDF version..."
	mkdir -p pdf/images; cp -R licensing scripts appendices \
	 chapters styles *.sgml pdf; cp -R images/*.eps pdf/images/; cd pdf; \
	 jw --backend pdf -d styles/print.dsl $*.sgml; cd ..
	mv pdf/$*.pdf ./
	rm -rf pdf
	gzip -f $*.pdf

%.ps.gz : $(images_eps) $(chapters) $(appendices) $(scripts) \
 $(license) %.sgml
	@echo "Building PS version..."
	mkdir -p ps/images; cp -R licensing scripts appendices chapters \
	 styles *.sgml ps; cp -R images/*.eps ps/images/; cd ps; jw \
	 --backend ps -d styles/print.dsl $*.sgml; cd ..
	mv ps/$*.ps ./
	rm -rf ps
	gzip -f $*.ps

%.tex : %.sgml
	jw --backend tex $*.sgml

images/%.jpg : images/%.gif
	convert -resize 50% images/$*.gif images/$*.jpg

images/%.eps : images/%.gif
	giftopnm images/$*.gif | pnmtopng -size "11811 11811 1" | convert - images/$*.eps

images/%.png : images/%.gif
	giftopnm images/$*.gif | pnmtopng -size "11811 11811 1" > images/$*.png

.PHONY: dockerimage
dockerimage:
	echo "User ${USER} userid $(id -u) groupid $(id -g)"
	docker build --build-arg USERNAME=${USER} \
				 --build-arg USERID=$(shell id -u) \
				 --build-arg GROUPID=$(shell id -g) \
				 -t iptables-tutorial:latest build-env/


.PHONY: clean
clean:
	rm -rf iptables-tutorial.html iptables-tutorial.ps.gz \
	 iptables-tutorial.pdf.gz iptables-tutorial.src.tgz *~ \
	 iptables-tutorial.html.tgz iptables-tutorial.chunky.tgz \
	 iptables-tutorial-index.sgml
	rm -rf pdf/ chunkyhtml/
	rm -rf images/*.jpg images/*.png images/*~ images/*.eps *.log *.aux \
	*.out *.tex
	rm -rf html/
	cd portuguese; make clean
	cd spanish; make clean

distrib: ps html
	cp -a mirrors.html index.php iptables-tutorial.ps.gz \
	 iptables-tutorial.html $(OUTPATH)
	cp -a scripts $(OUTPATH)
	cp -a other $(OUTPATH)
	cp -a images $(OUTPATH)
