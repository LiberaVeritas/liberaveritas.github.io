#!/bin/bash

# 1. converts index.md to index.html with pandoc in root
# 2. loops through first level directories and recursively convert .md to .html
# 3. calls linkchecker
#
# each directory has its own nav.yaml and landing page
# all conversions use the same template.html in root
# all markdown files are in a markdown directory
# converted html files go into parent directory (without /markdown)

shopt -s globstar   # shell option set globstar; allows ** recursive wildcard

red=`tput setaf 1`  # set ANSI foreground
reset=`tput sgr0`   # reset text format to default

root=$(pwd)  # working directory

# common args for pandoc
args="--template ${root}/template.html \
-f markdown\
+tex_math_single_backslash\
+backtick_code_blocks\
+fenced_code_attributes \
--mathjax"

# convert index.md
echo ${red}converting${reset}
echo index.md
pandoc index.md --metadata-file nav.yaml -s -o index.html ${args}

# loop through directories
for dir in */; do
    # recurse and convert
    for file in ${dir}**/*.md; do
        echo $file
        basename=${file%.md}    # removes .md extension
        htmlname=${basename/"/markdown"/""} # removes "/markdown" from filename

        pandoc $file --metadata-file ${dir}nav.yaml -s \
        -o ${htmlname}.html ${args}
    done
done

# call linkchecker
echo ${red}checking links
linkchecker index.html
