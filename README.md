# Nomad

This generates an apt package for Hashicorp's [nomad](https://www.nomadproject.io). It does not configure it.

It is available to apt-install from [gemfury](https://fury.io):
```
$ echo "deb [trusted=yes] https://apt.fury.io/jamesearl/ /" | sudo tee -a /etc/apt/sources.list.d/fury.list
$ sudo apt update
$ sudo apt install nomad
```


## Development

> Be sure to update the VERSION variable in the [./Makefile](Makefile) as you go.

### Prereqs
Install FPM

`$> gem install fpm` or `$> bundle install`

### Working
From repo root:

`$> make dev`

> This will clean and build.

### Publish
From repo root:

`$> make publish-gemfury`

> You need to be logged into gemfury to do this.
