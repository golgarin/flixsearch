# flixsearch
command line based script to search netflix (getting data from https://flixlist.co/)

# (1) create a wishlist file, e.g.

$ echo "batman begins nolan
lonesome dove
the jinx
leaving neverland
the zen diaries of garry shandling
the untold history of the united states
Rocket Man Fletcher
booksmart Olivia Wilde" > wishlist

# NOTE: Use specific searches, e.g. movie title and director name.

# (2) start script and wait

$ bash flixsearch.sh

# OUTPUT should be
search Batman Begins nolan
netflix available in countries
 🇩🇰 🇫🇮 🇳🇿
search lonesome dove
netflix available in countries
 🇺🇸
search the jinx
search leaving neverland
search the zen diaries of garry shandling
search the untold history of the united states
search Rocket Man Fletcher
search booksmart Olivia Wilde
