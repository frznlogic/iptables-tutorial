#!/bin/bash

cat tmp17.sgml | sed 's/ SYN / <systemitem>SYN<\/systemitem> /g' > tmp18.sgml
cat tmp18.sgml | sed 's/ SYN, / <systemitem>SYN<\/systemitem>, /g' > tmp19.sgml
cat tmp19.sgml | sed 's/ SYN. / <systemitem>SYN<\/systemitem>. /g' > tmp20.sgml
cat tmp20.sgml | sed 's/ SYN) / <systemitem>SYN<\/systemitem>) /g' > tmp21.sgml
cat tmp21.sgml | sed 's/ SYN\/ACK / <systemitem>SYN\/ACK<\/systemitem /g' > tmp22.sgml
cat tmp22.sgml | sed 's/ SYN\/ACK. / <systemitem>SYN\/ACK<\/systemitem>. /g' > tmp23.sgml
cat tmp23.sgml | sed 's/ SYN\/ACK) / <systemitem>SYN\/ACK<\/systemitem>) /g' > tmp24.sgml
cat tmp24.sgml | sed 's/ SYN\/ACK, / <systemitem>SYN\/ACK<\/systemitem>, /g' > tmp25.sgml
cat tmp25.sgml | sed 's/ ACK / <systemitem>ACK<\/systemitem> /g' > tmp26.sgml
cat tmp26.sgml | sed 's/ ACK, / <systemitem>ACK<\/systemitem>, /g' > tmp27.sgml
cat tmp27.sgml | sed 's/ ACK. / <systemitem>ACK<\/systemitem>. /g' > tmp28.sgml
cat tmp28.sgml | sed 's/ ACK) / <systemitem>ACK<\/systemitem>) /g' > tmp29.sgml