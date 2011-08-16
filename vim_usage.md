# vim usage

Korisne komande

## command mode

`:noh` - no higlight - prekid highglight prikaza 

`:set wrap/nowrap` - automatsko prelamanje dugih linija da/ne

`:cd` - set tekući direktoriji - npr `:cd ~/github`

`:pwd`  - prikaži tekući direktorij

## normal mode

`<c-W> lijeva / desna / gore / dole strelica` -  pomjeranje prozora u fokusu

`ZZ` - snimi i izađi

`dd` - briši cijelu liniju

`/` - traži pojam `n` - pomjeri se na slijedeći pojam

`<c-f>` - stranica naprijed

`<c-b>` - stranica nazad

`<c-a>` - select all, mapirati "ggVG"

<pre>
~/.vimrc
------------
" select all
nmap <c-a> ggVG
</pre>

## INSERT mode

### CTRL-R

`<C+r>` - (:help i_CTRL-R) - kada smo u insert modu kucamo ctrl+r. Pojavi nam se `"` što je znak da vim čeka naš sljedeći znak:

- `%` - naziv tekućeg fajla
- `=` - mini kalkulator - unesite ctrl+r pa nakon toga =3*2.2
- `+` - clipboard sadržaj


## selection mode

### indent bloka (više linija) teksta

http://stackoverflow.com/questions/235839/how-do-i-indent-multiple-lines-quickly-in-vi

- odaberemo linije koje želimo pomjeriti
- kucamo `>` 

## Tabs

http://www.catswhocode.com/blog/100-vim-commands-every-programmer-should-know

- `:tabnew` - new tab
- `gt` - show next tab
- `:tabdo %s/foo/bar/g - execute find-replace komandu u svim tabovima
- `:tab bal - stavi sve otvorene fajlove u tabove


## NERDTree

C - change root pozicionoiramo se na dir za koji želimo da bude novi "root" direktorij u prikazu

O - expand sve 

F - prikazuj / ne prikazuj fajlove

? - help on/off

cd - setuje se da je tekući direktorij onaj na kome smo pozicionirani

## vimgrep

`:vimgrep /only_if/ **/*.rb` - nađi sve fajlove unutar poddirektorija u odnosu na tekući direktorij (pogledaj `cd` NERDTree, `:pwd`)  

nakon toga se sa `:cn` - naprijed /  `:cp` - nazad prelazi na novi fajl u kome je nađen traženi izraz

validni vimgrep izrazi:

- `/not_if\|only_if/` - nađi sve fajlove koji sadrže ili `not_if` ili `only_if`

## tabular plugin
 
http://vimcasts.org/episodes/aligning-text-with-tabular-vim/


Ukucaj i označi ovaj tekst:

<pre>
var video = {
    metadata: {
        title: "Aligning assignments"
        h264Src: "/media/alignment.mov",
        oggSrc: "/media/alignment.ogv"
        posterSrc: "/media/alignment.png"
        duration: 320,
    }
}
</pre>

kucaj `:Tabular/:`

slično ukucaj

<pre>
one = 1
two = 2
three = 3
four = 4
</pre>

kucaj `:Tabular/=`


## Mapiranje funkcijskih tipki

Želim da sa F1 otvorim NERDTree prozor, i da me vrati na fajl, tačnije buffer koji trenutno editujem.

Zatim želim da sa F3 otvorim tag na poziciji kursora, a da se sa F2 vratim na predhodni tag. Na taj način sa F2/F3 imam riješenu navigaciju u vim help fajlovima.

```
map <F1> :NERDTree<CR>:wincmd p<CR>
map <F3> <C-]>
map <F2> <C-O>

```

Napomena: 
- na Mac-u kucamo ```<fn> + <Funkcijska tipka>``` da bi dobili efekat pritiska funkcijske tipke. 
- na Mac-u sa ```<Ctrl> + Đ``` dobijamo efekat ```<Ctrl> + ]``` ali na ubuntu konzoli ovo zna biti problem, pa je najbolje ovo mapirati

## vim bufferi

Dobar primjer korištenja buffer-a je kucanje ovog seta komandi:

```
:ed fajl_1.txt
:ed fajl_2.txt
:ed fajl_3.txt
```

nakon toga sa ```ls``` pogledamo listu buffer-a. Dobijamo rezultat sličan ovom:

<pre>
  1  h   "~/.vimrc"                     line 171
  4  h   "gitorious-cookbooks/passenger_apache2/metadata.json" line 32
  6 %a   "~/github/T0_knowhow/vim_usage.md" line 72
  7  h   "fajl_1.txt"                   line 1
  8  h   "fajl_2.txt"                   line 1
  9 #h   "fajl_3.txt"                   line 1   
 </pre>

Na željeni buffer se lociramo kucanjem b+broj buffer-a. Znači sa ```b8``` lociraćemo se na buffer fajl_2.txt. Komanda ```:fi``` nam daje ime fajla tekućeg buffera. Međutim, tu treba znati da prije upisivanja ```:w``` fajlovi fajl_1.txt, fajl_2.txt, fajl_3.txt ne postoje na fajl sistemu.

## reload .vimrc

Ako promijenimo nešto u ```.vimrc``` onda sa ```:source ~/.vimrc``` nove komande stavljamo u funkciju bez potrebe izađi/uđi ponovo u vim.

Na ovom [blogu](http://dailyvim.blogspot.com/2008/11/reload-vimrc.html Daily vim) sam našao dobru foru da uopšte ne trebam ni source komandu:

```
au! BufWritePost .vimrc source % 
```

Efekat je znači da se automatski po upisivanju buffera koji se zove ```.vimrc``` pokreće source komanda.

Ukoliko napravim neku grešku u vimrc, odmah po snimanju imaću poruku o grešci.


## Eksterni resursi

### cheat-sheet

http://www.smashingmagazine.com/2010/05/03/vi-editor-linux-terminal-cheat-sheet-pdf/

### arstechnica

tag-list plugin, omnicompletion system, minibufi explorer

http://arstechnica.com/open-source/guides/2009/05/vim-made-easy-how-to-get-your-favorite-ide-features-in-vim.ars

### stackoverflow

http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/

### tagbar, ctags

ctags, jsctags

https://gist.github.com/1132098

