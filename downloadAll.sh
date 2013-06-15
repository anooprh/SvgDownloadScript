COUNTRIES_LIST_FILE_NAME=countries-list
SVG_DIR_NAME=svg

mkdir  $SVG_DIR_NAME
countries=`cat $COUNTRIES_LIST_FILE_NAME`
for country in $countries; do
    if [ -e svg/$country.svg ]; then 
        echo "File : $country.svg already exists"
    else    
        curl -o svg/$country.svg  "https://en.wikipedia.org/wiki/File:$country%5F(orthographic_projection).svg" 
    fi
done

