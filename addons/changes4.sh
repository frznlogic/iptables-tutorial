#!/bin/bash

cat tmp45.sgml | sed 's/ NAT / <systemitem>NAT<\/systemitem> /g' > tmp46.sgml
cat tmp46.sgml | sed 's/ NAT, / <systemitem>NAT<\/systemitem>, /g' > tmp47.sgml
cat tmp47.sgml | sed 's/ NAT. / <systemitem>NAT<\/systemitem>. /g' > tmp48.sgml
cat tmp48.sgml | sed 's/ NAT / <systemitem>NAT<\/systemitem> /g' > tmp49.sgml
cat tmp49.sgml | sed 's/ HTTP / <systemitem>HTTP<\/systemitem> /g' > tmp50.sgml
cat tmp50.sgml | sed 's/ patch-o-matic / <systemitem>patch-o-matic<\/systemitem> /g' > tmp51.sgml
cat tmp51.sgml | sed 's/ ntalk / <systemitem>ntalk<\/systemitem> /g' > tmp52.sgml
cat tmp52.sgml | sed 's/ H.323 / <systemitem>H.323<\/systemitem> /g' > tmp53.sgml
cat tmp53.sgml | sed 's/ IRC / <systemitem>IRC<\/systemitem> /g' > tmp54.sgml
