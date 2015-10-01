git-ls-files2vimproject
=======================

AWK script to generate [VIM project](http://www.vim.org/scripts/script.php?script_id=69) files from git repositories.

Usage:

	$ git ls-files | awk -f git-ls-files2vimproject.awk > .vimproject
