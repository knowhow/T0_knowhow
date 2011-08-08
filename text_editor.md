# Tekst editori za bring.out developera, sysaadmina, podršku

Primarni tekst editor je vim.


## Mac OS X

### MacVim

dobru integraciju sa OS-om ima [MacVim](https://github.com/b4winckler/macvim/wiki)

poziva se sa `mvim`. specifična podešenja mvim-a se rade u `~/.gvimrc`

sve ostale stvari (pluginove i podešenja) mvim uzima iz `~/.vim`,  `~/.vimrc`


### vim, instalacija pluginova i postavki (mac, linux)

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

## Ubuntu/Linux

- vim
- vim-gtk


## Windows

Instalirati i podesiti gvim.

instalacija slična kao za unix, uz razlike navedene u ovom gistu:

https://gist.github.com/1008292

