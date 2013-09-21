Why it exists
===============================

Git, it seems, has nothing like svn cat. Svn cat is a great tool that displays a file as it existed in a particular revision of the source tree.

I needed to see a previous version of a file, because git diff wouldn't have provided enough context, so I needed this tool.

Installation
=============================

It's probably easiest to clone this repository somewhere then create a symlink on your path with the proper naming convention.

    $ git clone https://github.com/rwilcox/git-cat.git
    $ ln -s `pwd`/git-cat/git-cat ~/bin/git-cat

Assuming of course that you have `~/bin/` in your $PATH this will allow a workflow like:

    $ git cat README.markdown 1cba2d72 

I suggest a symlink under the assumption that you have `~/bin` under some kind of version control already, and/or don't want to put the git-cat repository directly on your $PATH.


On the shoulders of giants
===============================

Before I built this tool I did some Google searching. Some of this searching found good information, some found... stuff that didn't work.

  * [http://buildmonkey.wordpress.com/2009/05/14/git-cat-contd/](http://buildmonkey.wordpress.com/2009/05/14/git-cat-contd/)  
    Got me 25% of the way there. But, of course, I wanted to be able to specify arbitrary commits too
    
  * [http://book.git-scm.com/3_reviewing_history_-_git_log.html](http://book.git-scm.com/3_reviewing_history_-_git_log.html)  
    Made me realize that what I wanted to do wasn't built into git
  
  * [http://www.gitready.com/advanced/2009/01/20/bend-logs-to-your-will.html](http://www.gitready.com/advanced/2009/01/20/bend-logs-to-your-will.html)  
    Useful information on git log, although I didn't end up using much of this info
  
  * [http://stackoverflow.com/questions/610208/how-to-retrieve-a-single-file-from-specific-revision-in-git](http://stackoverflow.com/questions/610208/how-to-retrieve-a-single-file-from-specific-revision-in-git)  
    Seems to solve the problem, but gives me an odd error I couldn't figure out how to fix on Git 1.6.2. Stupid git.

TODO
=============================

If you want to help here are some things I'd like to do but lack time:

  1. Extract help documentation from the `git-cat` file and make it something that can be translated into a manpage.
  2. Installation script to install a `git-cat` symbolic link to somewhere nice on $PATH, and also install said manpage.

Authors
===============================
* Ryan Wilcox, Wilcox Development Solutions. [http://www.wilcoxd.com](http://www.wilcoxd.com)
