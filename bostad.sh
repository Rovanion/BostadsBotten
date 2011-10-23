#!/bin/bash

curl -s http://www.graflunds.se/vara-lagenheter/lediga-laegenheter/linkoeping >> temp

if cmp temp ingalagenheter ; then
    echo "Inga nya lyor" > /dev/null
else
(
    echo "From: BostadsBotten@rovanion.dyndns.org"
    echo "Subject: Det finns bostad"
    echo "Det finns bostad hos http://www.graflunds.se/vara-lagenheter/lediga-laegenheter/linkoeping"
) | sendmail -t rovanion.luckey@gmail.com
    
    echo LÄGENHET!
fi

rm temp