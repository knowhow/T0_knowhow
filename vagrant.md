# vagrant

## Predhodna podešenja

Prije instalacije vagranta moramo imati instalirane:

- virtualbox (ver 4.1.0)
  -  hostonly interfejse vboxnet0, vboxnet1 (pogledati na virtualbox File/Preference/Network)
- [rvm] (https://github.com/hernad/T0_knowhow/blob/master/ruby.md)

## install

```
rvm use 1.9.2
# vagrant ver 0.7.x imaju podrsku za 4.0.x virtualbox, 0.8 za 4.1.x virtualbox
gem install vagrant
cd ~
mkdir vagrant
```

napraviti `~/vagrant/.rvmrc` koji sadrži:

```
rvm use 1.9.2
```

kada prvi put budele ulazili u vagrant rvm pita da li prihvatate ovaj rcfajl, odgovorite da.

## instalacija vagrant boxova

U download sekciji u vagrant nalaze se vagrant box template-ovi:

```
/zvijer/Downloads/vagrant/*.box
```

Prebacimo u Downloads direktorij boxove koje želimo koristiti.

dodajmo box lucid-desktop:

```
vagrant box add 'lucid-desktop' ~/Downloads/lucid-desktop.box

  [vagrant] Downloading with Vagrant::Downloaders::File...
  [vagrant] Copying box to temporary location...
  [vagrant] Extracting box...
```

u `~/.vagrant/boxes/` vidimo instalirate boxove.

isto dobijamo i sa box list komandom - `vagrant box list`

### box template-ovi

- vagrant box add base lucid64_vim73ruby_bout.box
- vagrant box add lucid-desktop lucid-desktop.box



## kreiranje vagrant sesije 

```
mkdir desk-lucid-1
cd desk-lucid-1
## ako ne navedemo base koristiće se base.box
vagrant init lucid-desktop
```

dobijamo `Vagrantfile` koji je ruby program u kome imamo mogućnost zadavati chef ili puppet provision komande.
Mi ćemo, kada nam to treba, koristiti chef.

Ako ništa ne navedemo, dobijamo sesiju koja je identičan klon baznog box-a.

```
hernad@macan:~/vagrant/desk-lucid-1$ vagrant up

  [default] Importing base box 'lucid-desktop'...
  ...
```

Najbitnije komande:

- vagrant ssh - ssh pristup sesiji
- vagrant halt - zaustavljamo sesiju
- vagrant destroy - brisemo sesiju (brisemo sve podatke !)

## Bilješke

- [Vagrant basebox-ovi](https://gist.github.com/1004430)
- [recreate ubuntu udev persistent network rules - udevadm trigger](https://gist.github.com/1004326)
- [veewee](https://gist.github.com/1000452)
- [ubuntu konzola sa bosanskim znakovima](https://gist.github.com/1004162)
