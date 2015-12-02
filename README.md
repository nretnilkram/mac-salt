# MAC SALT

# Installation


### Install Homebrew

see: http://brew.sh/


```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

(if that hangs check your proxy settings)


### Get MAC_SALT

```
mkdir -p ~/dev
git clone git@github.com:nretnilkram/mac_salt.git ~/dev/mac-salt
~/dev/mac-salt/bootstrap.sh
```


# Running mac-salt

I'll clean this up as I add some better profile support

```
~/dev/mac_salt/bin/mac_salt state.highstate
```