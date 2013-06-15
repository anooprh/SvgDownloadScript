mkdir svg
countries=( Canada Somalia)
for country in "${countries[@]}" 
do
    echo $country
wget -q "https://en.wikipedia.org/wiki/File:$country%5F(orthographic_projection).svg" -O svg/$country.svg
done

