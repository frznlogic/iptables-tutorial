#!/bin/bash
#
# changes.sh - used for iptables-tutorial mirroring
#
# Copyright (C) 2001  Oskar Andreasson &lt;blueflux@koffein.net&gt;
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program or from the site that you downloaded it
# from; if not, write to the Free Software Foundation, Inc., 59 Temple
# Place, Suite 330, Boston, MA  02111-1307   USA
#

for file in ./*.html ; do
	cat ${file} | sed -e 's/http:\/\/iptables-tutorial.frozentux.net\/scripts\//scripts\//g' > ${file}2
	cat ${file}2 | sed -e 's/http:\/\/iptables-tutorial.frozentux.net\/other\//other\//g' > ${file}
	rm -f ${file}2
done
											   
