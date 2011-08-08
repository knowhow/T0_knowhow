# Tekst editor

Primarni tekst editor za bring.out developera/sysadmina/servisera je vim.

On se obavezno instalira i podešava u skladu sa donjim uputama na sopstvenim radnim stanicama i serverima.

Kad god je pogodno, instalira se i na radnim stanicama korisnika.

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

