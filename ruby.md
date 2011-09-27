# ruby programski jezik


## Mac

već ima preinstaliran 1.8.7


## RVM ruby version manager

[RVM](https://rvm.beginrescueend.com/) je de-facto postao standard za ruby korisnike, posebno za development.

instalacija:

```
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
```

nakon toga u `~/.bash_profile` treba biti linija:

```
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
```

Ako je nema, dodajte je.

restart shella bi trebao da nam obezbjedi novu ```rvm``` komandu.

sada instaliramo ruby-je koje ćemo koristiti:

```
rvm install 1.8.7
rvm install 1.9.2
rvm install jruby
```

kada želimo koristiti određeni ruby koristimo:
```
rvm use 1.9.2
```

ako dobijamo grešku ```openssl (LoadError)``` [openssl fix](http://redmine.bring.out.ba/issues/24567)
