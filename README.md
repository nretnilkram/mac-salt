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
~/dev/mac-salt/bootstrap.sh
```


## Running mac-salt

I'll clean this up as I add some better profile support

```
~/dev/mac_salt/bin/mac_salt state.highstate
```



#### Trouble Shooting
- If ruby fails due to readline extension make sure you have the correct os version. 
- - May need to uninstall and reinstall if upgraded from previous version of osx.