# MAC SALT

Sets up and configures tools and services such as bash, mysql, node, dnsmasq, ruby, vagrant, and git.

## Installation


### Install Homebrew

see: http://brew.sh/

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


### Install MAC SALT

```
git clone git@github.com:nretnilkram/mac_salt.git ~/mac-salt
cd ~/mac-salt
./bootstrap.sh
```


## Running MAC SALT

### Run the Full Suite

```
cd ~/mac-salt
bin/mac_salt state.highstate
```


### Run Single SLS

```
cd ~/mac-salt
bin/mac_salt state.sls tools.ruby
```
or

```
cd ~/mac-salt
bin/mac_salt state.sls services.dns
```


### Update Bash Profile

MAC SALT will add the files to your home directory, but you will need to tell your bash_profile to source .mac_salt, which sources all the others.

```
if [ -f ~/.mac_salt/.bash_config ]; then
	source ~/.mac_salt/.bash_config
fi
```


### Aliased commands for running the MAC SALT stack (all added in .aliases):
mac_salt, mac-salt, macsalt, ms, salt-local, or bin/mac_salt (from the mac-salt directory)

```
ms state.highstate
```
or
```
salt-local state.sls config.git
```


### Update MAC SALT

```
ms update
```
or with the additional module
```
mac-salt do.update
```


#### Trouble Shooting
- If ruby fails due to readline extension make sure you have the correct os version. May need to uninstall and reinstall if upgraded from previous version of osx.

