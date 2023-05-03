#!/bin/bash
#!/bin/bash
#!/bin/bash
#!/bin/bash
file=compile.txt
name=$(cat "$file")
file=$name
sed -i '/\/#!\/bin\//d' $file
sed -i '1 i\#!\/bin\/bash' $file
shc -f $file -o $file.x.sh -r
bash

