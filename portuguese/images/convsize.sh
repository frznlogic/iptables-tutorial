#!/bin/bash

for [$afile in 'ls']; then
 $tmpfile='basename $afile .gif'+2.gif

 convert -geometry 80% $afile $tmpfile
 rm -f $afile
 mv $tmpfile $afile
done