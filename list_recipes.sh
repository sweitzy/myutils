#!/bin/bash

# $Id: list_recipes.sh,v 1.5 2025/08/21 09:05:57 scott Exp scott $

# list_recipes -- use UNIX filesystem commands to create CSV files
# like what I used to do with Awesome Table before the API stopped
# being free.  Now that I have Google Drive mounted as a UNIX
# filesystem, this is trivial!

RECIPES_DIR="$HOME/Google Drive/My Drive/Recipes"
STAGING_DIR="$RECIPES_DIR/_Staging"
RECIPES_CSV="$STAGING_DIR/MyRecipes.csv"

if [ ! -d  "$RECIPES_DIR" ]; then
    echo Recipes dir $RECIPES_DIR does not exist.
    exit 1
fi

cd "$RECIPES_DIR"

# Create a staging area, and only leave gsheets.
mkdir -p "$STAGING_DIR"

# Save current csv so we can compare new one for new recipes.
cp "$RECIPES_CSV" "$RECIPES_CSV.prev"

echo "Generating CSV $RECIPES_CSV." >&2
echo

# we have a few recipes names with commas in them, so use tabs instead of commas.
#echo Title,Folder
#find . -name \*.gdoc | sort | awk -F/ '{print $3 "," $2}'

NUM_RECIPES=$(find . -type f -name \*.gdoc | grep -v "Recipe Template" | wc -l | sed 's/ //g')
NUM_SHORTCUTS=$(find . -type l -name \*.gdoc | grep -v "Recipe Template" | wc -l | sed 's/ //g')

# https://stackoverflow.com/questions/525872/echo-tab-characters-in-bash-script
echo -e Title'\t'Folder > "$RECIPES_CSV"
find . -name \*.gdoc | grep -v "Recipe Template" | sed s/\\.gdoc// | sort | awk -F/ '{print $2 "\t" $3}' >> "$RECIPES_CSV"

# Print counts.
echo "There are $NUM_RECIPES recipes."  >&2 
echo "There are $NUM_SHORTCUTS shortcuts." >&2 
echo
echo "New Recipes:"
diff "$RECIPES_CSV" "$RECIPES_CSV.prev"
echo

# Print next steps to stderr.
echo "1. Open $RECIPES_CSV in Numbers on Mac."  >&2 
echo "2. Export as Excel file."  >&2
echo "3. Open MyRecipes.xlsx in Sheets."  >&2
echo "4. Select all cells. Change font to 9 point."  >&2
echo "5. Select all rows. Right click and Resize Rows to Fit Data."  >&2
echo "6. Optional: Select first column.  Reset background color."  >&2
#echo "7. Delete $RECIPES_CSV."  >&2
# What does saving as a sheet buy me?  Gets rid of Excel!
echo "7. Save xlsx as a Google Sheet in Recipes dir."  >&2
#echo "8. Delete xlsx file."  >&2

exit 0
