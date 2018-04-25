all: ps html chunky chunkytgz htmltgz

chapters= $(wildcard chapters/*.sgml)
appendices= $(wildcard appendices/*.sgml)
scripts= $(wildcard scripts/*.txt)
license= $(wildcard license/*.sgml)

images_eps= $(patsubst %.gif,%.eps,$(wildcard images/*.gif))
images_jpg= $(patsubst %.gif,%.jpg,$(wildcard images/*.gif))
images_png= $(patsubst %.gif,%.png,$(wildcard images/*.gif))

.PHONY: site
site: all
	@echo "Making site..."
	-@mkdir html
	-@mkdir html/images
	-@mkdir html/other
	-@mkdir html/scripts
	-@mkdir html/chunkyhtml
	-@cp iptables-tutorial.ps.gz iptables-tutorial.html html/
	-@cp iptables-tutorial.chunky.tgz iptables-tutorial.html.tgz html/
	-@cp -r other/* html/other/
	-@cp images/*.jpg html/images/
	-@cp -r scripts/* html/scripts/
	-@cp -r chunkyhtml/* html/chunkyhtml/
	-@cp TODO ChangeLog html/
	-@cp index.html html/
	-@echo "Done."

.PHONY: ps
ps: $(images_eps) $(chapters) $(appendices) $(scripts) $(license) iptables-tutorial.ps.gz

.PHONY: pdf
pdf : $(images_png) $(chapters) $(appendices) $(scripts) $(license) iptables-tutorial.pdf.gz

.PHONY: html
html: $(images_jpg) $(chapters) $(appendices) $(scripts) $(license) iptables-tutorial.html

.PHONY: chunky
chunky: $(images_jpg) $(chapters) $(appendices) $(scripts) \
 $(license) chunkyhtml

.PHONY: chunkytgz
chunkytgz: $(images_jpg) $(chapters) $(appendices) $(scripts) \
 $(license) iptables-tutorial.chunky.tgz

.PHONY: htmltgz
htmltgz: $(images_jpg) $(chapters) $(appendices) $(scripts) \
 $(license) iptables-tutorial.html.tgz


%.chunky.tgz: chunky
	@echo "Building chunky tgz version..."
	@cp -r chunkyhtml chunkytgz
	@tar -cf $*.chunky.tar chunkyhtml 
	@gzip $*.chunky.tar
	@mv $*.chunky.tar.gz $*.chunky.tgz
	@rm -rf chunkytgz
	@echo "Done."

%.html.tgz: html
	@echo "Building HTML tgz version..."
	-@mkdir $*
	-@mkdir $*/images
	@cp -r $*.html scripts other $*/
	@cp -r images/*.gif images/*.jpg $*/images/
	@cat $*/$*.html | sed -e 's/http:\/\/iptables-tutorial.frozentux.net\/scripts\//scripts\//g' > \
	 $*/$*2.html
	@cat $*/$*2.html | sed -e 's/http:\/\/iptables-tutorial.frozentux.net\/other\//other\//g' > \
	 $*/$*.html
	@rm -f $*/$*2.html
	@tar -cf $*.html.tar $*
	@gzip $*.html.tar
	@mv $*.html.tar.gz $*.html.tgz
	@rm -rf $*
	@echo "Done."

%.html: %.sgml
	@echo "Building HTML version..."
	@jw --backend html -d ../styles/html.dsl \
	--nochunks iptables-tutorial.sgml
	@echo "Done."

chunkyhtml:
	@echo "Building Chunky HTML version..."
	@rm -rf chunkyhtml
	@mkdir chunkyhtml
	@mkdir chunkyhtml/images
	@jw --backend html -d ../styles/html.dsl --output chunkyhtml \
	 iptables-tutorial.sgml
	@cp -r images/*.gif chunkyhtml/images/
	@cp -r images/*.jpg chunkyhtml/images/
	@cp -r other chunkyhtml/other
	@cp -r scripts chunkyhtml/scripts
	@echo "Done."


%.pdf.gz : %.sgml
	@echo "Building PDF version..."
	@mkdir -p pdf; cp -R images licensing scripts appendices \
	 chapters styles *.sgml pdf; cd pdf; jw -b \
	 pdf -d ../../styles/print.dsl $*.sgml; \
	 cd ..
	@mv pdf/$*.pdf ./
	@rm -rf pdf
	@gzip $*.pdf

%.ps.gz : %.sgml
	@echo "Building PS version..."
	@mkdir -p ps; cp -R images licensing scripts appendices \
	 chapters *.sgml ps; cd ps; jw \
	 --backend ps -d ../../styles/print.dsl $*.sgml; cd ..
	@mv ps/$*.ps ./
	@rm -rf ps
	@gzip $*.ps

%.tex : %.sgml
	jw --backend tex -d ../../styles/print.dsl $*.sgml

images/%.jpg : images/%.gif
	convert images/$*.gif images/$*.jpg

images/%.eps : images/%.gif
	convert -geometry 70% images/$*.gif images/$*.eps

images/%.png : images/%.gif
	convert -geometry 70% images/$*.gif images/$*.png

.PHONY: clean
clean:
	rm -rf iptables-tutorial.html iptables-tutorial.ps.gz \
	 iptables-tutorial.pdf.gz iptables-tutorial.src.tgz *~
	rm -rf pdf/
	rm -rf images/*.jpg images/*.png images/*~ images/*.eps *.log *.aux \
	*.out *.tex
	rm -rf html/ chunkyhtml/ iptables-tutorial.chunky.tgz iptables-tutorial.html.tgz
