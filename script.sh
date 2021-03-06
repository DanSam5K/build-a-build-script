#!/bin/bash
echo "🔥🔥🔥Beginning build!! 🔥🔥🔥"
firstline=$(head -n1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version" $version
echo 'Do you want to continue? (enter "1" for yes, "0" for no)'
read versioncontinue
if [ $versioncontinue -eq 1 ] 
then
  echo "OK"
else
  echo "Please come Back when you are ready"
fi
for filename in source/*
do
  echo $filename
done
if [ "$filename" == "source/secretinfo.md" ]
then
  echo "Not copying" $filename
else
  echo "Copying" $filename
  cp $filename build/.
fi
cd build/
echo "Build version $version contains:"
ls