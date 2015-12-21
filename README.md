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


### Update Bash Profile

mac_salt will add the files to your home directory, but you will need to tell your bash_profile to source the files.

```
if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
fi

if [ -f ~/.profile ]; then
	source ~/.profile
fi
```


#### Trouble Shooting
- If ruby fails due to readline extension make sure you have the correct os version. May need to uninstall and reinstall if upgraded from previous version of osx.