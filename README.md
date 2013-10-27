vim-hugefile
------------

Vim always loads entire files. Therefore loading huge files is slow. And having
the usual options set makes loading even slower.

For all huge files this plugin disables:

* FileType autocmds (syntax highlighting)
* folding

This happens automatically for all files that are bigger or equal to 2 MiB. You
can change this value by setting `g:hugefile_trigger_size` (in MiB) in your
vimrc.

Before the options for handling huge files are set, your old settings get saved.
If you feel the strong urge to experience the normal behaviour even for huge
files, you can always toggle the state via `:HugefileToggle`.
