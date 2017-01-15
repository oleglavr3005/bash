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
mapfile -t names< ~/lists.txt
    for element in "${names[@]}"; 
    do
	mask=$aster$element
	find $source -type f -name "$mask" -exec mv -t  $target {} +
	if [ $? -ne 0 ]; then
		echo FAIL
		exit 1
	fi
    done
    echo OK
