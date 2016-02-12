[![No Maintenance
Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

vim-hugefile
------------

Vim always loads entire files. Therefore loading huge files (logfiles?) is
pretty slow. And having the usual options set makes loading even slower.

This plugin reduces the impact of the latter heavily by disabling these options
for all huge files:

* FileType autocmds
* syntax highlighting
* folding
* swapfile
* MatchParen

This happens automatically for all files that are bigger or equal to 2 MiB. You
can change this value by setting `g:hugefile_trigger_size` (in MiB) in your
vimrc.

Before the options for handling huge files are set, your old settings get saved.
`:HugefileToggle` toggles the current state.

Alternatives?
-------------

Yes, there's also
[LargeFile](http://www.vim.org/scripts/script.php?script_id=1506), but my eyes
felt the strong urge to die in a raging fire when they saw the code. Moreover..
vimball, enough said.

It just doesn't look like modern VimL.

Real alternatives?
------------------

Honestly, don't use Vim for big files. Or use filters to read only certain
parts:

```
$ vim <(tail hugelogfile)
```
