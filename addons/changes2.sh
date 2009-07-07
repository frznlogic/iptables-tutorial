#!/bin/bash

cat tmp8.sgml | sed 's/ ICQ / <systemitem>ICQ<\/systemitem> /g' > tmp9.sgml
cat tmp9.sgml | sed 's/ ICQ, / <systemitem>ICQ<\/systemitem>, /g' > tmp10.sgml
cat tmp10.sgml | sed 's/ ICQ. / <systemitem>ICQ<\/systemitem>. /g' > tmp11.sgml
cat tmp11.sgml | sed 's/ DCC / <systemitem>DCC<\/systemitem> /g' > tmp12.sgml
cat tmp12.sgml | sed 's/ DCC, / <systemitem>DCC<\/systemitem, /g' > tmp13.sgml
cat tmp13.sgml | sed 's/ DCC. / <systemitem>DCC<\/systemitem>. /g' > tmp14.sgml
cat tmp14.sgml | sed 's/ FTP / <systemitem>FTP<\/systemitem> /g' > tmp15.sgml
cat tmp15.sgml | sed 's/ FTP, / <systemitem>FTP<\/systemitem>, /g' > tmp16.sgml
cat tmp16.sgml | sed 's/ FTP. / <systemitem>FTP<\/systemitem>. /g' > tmp17.sgml
