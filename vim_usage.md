# vim usage

Korisne komande

## command mode

`:noh` - no higlight - prekid highglight prikaza 

`:set wrap/nowrap` - automatsko prelamanje dugih linija da/ne

`:cd` - set tekući direktoriji - npr `:cd ~/github`

`:pwd`  - prikaži tekući direktorij

## normal mode

`<c-W> lijeva / desna / gore / dole strelica` -  pomjeranje prozora u fokusu


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


