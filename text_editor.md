# vim


## cheat-sheet

http://www.smashingmagazine.com/2010/05/03/vi-editor-linux-terminal-cheat-sheet-pdf/


## Mac OS

### MacVim

dobru integraciju sa OS-om ima [MacVim](https://github.com/b4winckler/macvim/wiki)

poziva se sa `mvim`. specifična podešenja mvim-a se rade u `~/.gvimrc`

sve ostale stvari (pluginove i podešenja) mvim uzima iz `~/.vim`,  `~/.vimrc`


### instalacija na desktop

```
cd ~/
# ako vec ima neki vim config skloniti
mv .vim .vim.orig
mv .vimrc .vimrc.orig
mv .gvimrc .gvimrc.orig
git clone git://github.com/knowhow/dotVim.git .vim
cd .vim
./git_update.sh
./command-t_install.sh
./install_rc.sh
```
