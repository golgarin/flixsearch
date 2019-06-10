#!/bin/bash
#url=https://flixlist.co/?utf8=%E2%9C%93&search%5Btomatometer%5D=0%2C100&search%5Bmpaa_rating%5D=1%2C6&search%5Byear%5D=1920%2C2019&search%5Bcategory_ids%5D=&search%5Bquery%5D=the+jinx&commit=Search
url="https://flixlist.co/?utf8=%E2%9C%93&search%5Btomatometer%5D=0%2C100&search%5Bmpaa_rating%5D=1%2C6&search%5Byear%5D=1920%2C2019&search%5Bcategory_ids%5D=&search%5Bquery%5D="

input="wishlist"
while IFS= read -r line
do
  echo "search $line"
  title=`curl -s "$url${line//\ /+}&commit=Search"|grep -A2 "<div class='row titles'"|grep -v "div"|grep href`
  if [ "$?" = 0 ]; then
    echo "netflix available in countries"
    href=`echo $title| sed -e 's/.*href="//g' -e 's/">//g'`
    curl -s https://flixlist.co$href | tidy -q 2>&1| grep -v Warning:| xmllint --html --xpath '//table/tbody/tr/td//img[not(@class)]' - \
         | sed -e 's/<img title="SE" [^>]*>/ 🇸🇪/g' \
         | sed -e 's/<img title="DK" [^>]*>/ 🇩🇰/g' \
         | sed -e 's/<img title="FI" [^>]*>/ 🇫🇮/g' \
         | sed -e 's/<img title="NO" [^>]*>/ 🇳🇴/g' \
         | sed -e 's/<img title="CA" [^>]*>/ 🇨🇦/g' \
         | sed -e 's/<img title="NZ" [^>]*>/ 🇳🇿/g' \
         | sed -e 's/<img title="AU" [^>]*>/ 🇦🇺/g' \
         | sed -e 's/<img title="US" [^>]*>/ 🇺🇸/g' \
         | sed -e 's/<img title="FR" [^>]*>/ 🇫🇷/g' \
         | sed -e 's/<img title="BR" [^>]*>/ 🇧🇷/g' \
         | sed -e 's/<img title="AT" [^>]*>/ 🇦🇹/g' \
         | sed -e 's/<img title="UK" [^>]*>/ 🇬🇧/g'
  fi
done < "$input"
