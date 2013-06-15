COUNTRIES_LIST_FILE_NAME=countries-list
ERROR_FILE_NAME=error.log
SVG_DIR_NAME=svg



echo "\nExecution started at `date`" >> $ERROR_FILE_NAME
mkdir  $SVG_DIR_NAME
countries=`cat $COUNTRIES_LIST_FILE_NAME`
for country in $countries; do
	if [ -e svg/$country.svg ]; then 
    	echo "File : $country.svg already exists"
	else   
  		URL=https://en.wikipedia.org/wiki/File:$country%5F%28orthographic_projection%29.svg
  		OUTPUT_FILE_NAME=svg/$country.svg 

    	RESPONSE_CODE=$(curl -o $OUTPUT_FILE_NAME --write-out %{http_code} --silent  $URL) 
     	
     	if [ $RESPONSE_CODE -eq 200 ]; then
     		echo "Successfully Downloaded to svg/$country.svg"
     	else
     		ERROR_MSG="Please verify name of : $country in wikipedia"
     		echo $ERROR_MSG 
     		echo $ERROR_MSG >> $ERROR_FILE_NAME
     		rm svg/$country.svg
     	fi
	fi
done

