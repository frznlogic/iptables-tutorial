Last updated 2024 december 19

1. Introduction
2. Build using Docker
3. Build requirements
4. Installation notes

Introduction
------------
The Iptables-tutorial needs to be built into viewable documents from the
DocBook SGML source files before reading. This README will mainly describe how to
build the different viewable document types. The Makefile has support for
building HTML, PDF and PS formats, as well as the source tar ball.

The build process is not trivial, however, it has been successfully run recently on
current releases of CentOS 9 Stream and Debian 12.  Please see below.

Build using Docker
------------------
Running these commands should allow you to build the iptables-tutorial inside that docker environment:

```
make dockerimage
docker run -v ${CWD}:/tutorial -it iptables-tutorial:latest /bin/bash
```

Inside the docker container, build the iptables-tutorial like this:

```
cd /tutorial
make all
```

Build requirements
------------------
The generated files were successfully built on the following systems with
the indicated installed packages which are used within the Makefile.

CentOS 9 Stream steps:
1. Install repo containing imagemagick 
   ```
   dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm`
   ```
2. Install packages:
   ```
   dnf install netpbm netpbm-progs GraphicsMagick ImageMagick docbook-style-dsssl \
   docbook-utils texlive-jadetex texlive-latex-recommendedpackages texlive-epstopdf`
   ```

Debian 12 steps:
1. Install packages:
   ```
   apt install netpbm imagemagick docbook docbook-dsssl docbook-website docbook-xml \
   docbook-utils texlive-font-utils rsync make bash
   ```
2. the imagemagick policy.xml file in /etc/ImageMagick-6/ needed to be adjusted
   to get around an error message
   ```
   sed -i 's/domain=\"coder\" rights=\"none\"/domain=\"coder\" rights=\"read\|write\"/g' \
    /etc/ImageMagick-6/policy.xml
    ```
   See https://en.linuxportal.info/tutorials/troubleshooting/how-to-fix-errors-from-imagemagick-imagick-conversion-system-security-policy

With these installed, issuing the make command (as a regular user) creates the 
desired documentation files.

Installation notes
------------------
If you have all the above installed, you should be ok by doing the 
following:

```
make all
```
This should build the PDF, PS, HTML and SRC targets.


If you want to build the portuguese or spanish translation, do the following:

```
make portuguese
```
or

```
make spanish
```

The documents are then built and saved in the iptables-tutorial/portuguese/ 
or iptables-tutorial/spanish/ directories. If you want to build _everything_
you could do:

$ make site

This builds everything (including portuguese and spanish translations) and puts them in
the iptables-tutorial/html/ directory. 

If you have trouble with the build procedure, avoid contacting me unless
you have a real good explanation for using the sources instead of the
prebuilt versions at http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html :).

Enjoy!
