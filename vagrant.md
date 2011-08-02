# vagrant

## Predhodna podešeja

Prije instalacije vagranta moramo imati instalirane:

- virtualbox (ver 4.0.12)
- rvm

## install

``
rvm use 1.9.2
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

dodajmo box lucid-desktop

vagrant box add 'lucid-desktop' ~/Downloads/lucid-desktop.box
```
[vagrant] Downloading with Vagrant::Downloaders::File...
[vagrant] Copying box to temporary location...
[vagrant] Extracting box...
```

u `~/.vagrant/boxes/` vidimo instalirate boxove.

isto dobijamo i sa box list komandom - `vagrant box list`


