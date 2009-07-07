#!/bin/bash

cat statemachine.sgml | sed 's/ TCP / <systemitem>TCP<\/systemitem> /g' > tmp.sgml
cat tmp.sgml | sed 's/ TCP, / <systemitem>TCP<\/systemitem>, /g' > tmp1.sgml
cat tmp1.sgml | sed 's/ TCP. / <systemitem>TCP<\/systemitem>. /g' > tmp2.sgml
cat tmp2.sgml | sed 's/ UDP / <systemitem>UDP<\/systemitem> /g' > tmp3.sgml
cat tmp3.sgml | sed 's/ UDP, / <systemitem>UDP<\/systemitem, /g' > tmp4.sgml
cat tmp4.sgml | sed 's/ UDP. / <systemitem>UDP<\/systemitem>. /g' > tmp5.sgml
cat tmp5.sgml | sed 's/ ICMP / <systemitem>ICMP<\/systemitem> /g' > tmp6.sgml
cat tmp6.sgml | sed 's/ ICMP, / <systemitem>ICMP<\/systemitem>, /g' > tmp7.sgml
cat tmp7.sgml | sed 's/ ICMP. / <systemitem>ICMP<\/systemitem>. /g' > tmp8.sgml
