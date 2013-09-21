#!/usr/bin/env bash

# Created by WD-rpw 09-25-2009 when finding out that git had nothing like svn cat
# Based on information from: <http://buildmonkey.wordpress.com/2009/05/14/git-cat-contd/>

# This software is provided "as is" without express or implied warranties.

# Permission is granted to use, copy, modify and distribute this software,
# provided this disclaimer and copyright are preserved on all copies. This
# software may not, however, be sold or distributed for profit, or included
# with other software which is sold or distributed for profit, without the
# permission of the author.

# Usage:
USAGE="git-cat filename [--options]\n
OPTIONS:\n
--relative-list : print out the SHA1s for each commit this file was involved with\n
  (useful for picking out a certain commit to CAT )\n
--no-log: skip printing out the commit information if you passed in a SHA1\n
SHA1: print out the file as it was in commit SHA1, instead of as it was in HEAD\n\n

THIS COMMAND IN ACTION:\n
  $ git-cat file.txt\n
      # prints out the HEAD revision of this file\n\n
  $ git-cat file.txt --relative-list\n
      # prints out all commits that this file has been included in\n\n
  $ git-cat file SHA1\n
      # prints out the file as it was in commit SHA1, including some log information\n\n
  $ git-cat file SHA1 --no-log\n
      # prints out the file as it was in commit SHA1\n
"


#echo "1 is $1"
#echo "2 is $2"
FILE=$1

if [[ ! $1 ]]; then
    echo "need a filename"
    stop="yes"
#else
    #if [[ ! $2 ]]; then
    #    echo "no SHA1 specified, assuming HEAD"
    #fi
fi

if [[ $1 == "--help" ]]; then
    echo $USAGE
    stop="yes"
fi

if [[ $stop ]]; then
    exit 0
fi

if [[ $2 = "--relative-list" ]]; then
    echo "doing: git rev-list HEAD --pretty=oneline -- $FILE"
    git rev-list HEAD --pretty=oneline -- $FILE
    exit 0
fi

if [[ $2 ]]; then
    REV=$2
    if [[ !($3 == "--no-log") ]]; then
        echo "REV is: $REV"
        git cat-file commit $REV
    fi
else
    REV="HEAD"
fi

git show --pretty=medium $REV:`git rev-parse --show-prefix`$FILE | cat
