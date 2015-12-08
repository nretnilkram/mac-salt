# MAC SALT

## Installation


### Install Homebrew

see: http://brew.sh/

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


### Get mac-salt

```
mkdir -p ~/dev
git clone git@github.com:nretnilkram/mac_salt.git ~/dev/mac-salt
cd ~/dev/mac-salt
./bootstrap.sh
```


## Running mac-salt

### Run the Full Suite

```
bin/mac_salt state.highstate
```


### Run Single SLS

```
bin/mac_salt state.sls tools.ruby
```
or

```
bin/mac_salt state.sls services.dns
```



#### Trouble Shooting
- If ruby fails due to readline extension make sure you have the correct os version. May need to uninstall and reinstall if upgraded from previous version of osx.