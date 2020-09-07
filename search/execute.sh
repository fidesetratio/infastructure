#~/bin/bash

echo "Searching"


for f in $(cat data.txt)
 do
	 

	
	 d=$(ls /mnt/storage/spaj_temp/$f/Spaj | grep FT_SPAJ_) 
	 echo "$f=$?"

  done
 
