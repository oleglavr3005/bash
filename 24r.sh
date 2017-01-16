while [[ ! ( ( "$p" == "c" ) || ( "$p" == "m") ) ]]
do
  read -p "Enter c to copy, m to move : " p
done

while [ ! $source ]
do
      read -p "Enter source directory " source
done
while [ ! $target ]
do
read -p "Enter target directory " target
done
if [ ! -d $source ]; then 
	echo "Source directory not found" 
	exit 1
fi
if [ ! -d $target ]; then 
	echo "Target directory not found"
	exit 1
fi
aster="*"
mapfile -t names< ~/regex.txt

    for element in "${names[@]}"; 
    do
	mask=$aster$element
        if [ "$p" == "m" ]; then 
        command="mv"
        fi
	if [ "$p" == "c" ]; then
	command="cp"		
	fi
	find $source -type f -regex "$element" -exec $command -t  $target {} +
	if [ $? -ne 0 ]; then
		echo FAIL
		exit 1
	fi
    done
    count=$(find $source -type f -name "$mask" | wc -l)
    echo $target "after files were moved"
    ls $target -al
