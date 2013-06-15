COUNTRIES_LIST_FILE_NAME=countries-list
SVG_DIR_NAME=svg

mkdir  $SVG_DIR_NAME
countries=`cat $COUNTRIES_LIST_FILE_NAME`
for country in $countries; do
    if [ -e svg/$country.svg ]; then 
        echo "File : $country.svg already exists"
    else    
        wget "https://en.wikipedia.org/wiki/File:$country%5F(orthographic_projection).svg" -O svg/$country.svg
    fi
done

