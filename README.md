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


### Test Local Web Servers

```
mac-salt test
```


### Update Bash Profile

MAC SALT will add the files to your home directory, but you will need to tell your bash_profile to source .mac_salt, which sources all the others.

```
if [ -f ~/.mac_salt/bash_config ]; then
	source ~/.mac_salt/bash_config
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


### SSH Config and Proxy Functions

You will want to put your * host with the ProxyCommand at the Bottom and separate the actual ProxyCommand with a comment like what you see below.

```
Host *
	KeepAlive yes
	ServerAliveInterval 30
###### Do not place anything below this line.  It will be updated frequently by the proxy update functions.
	ProxyCommand /usr/local/bin/corkscrew 127.0.0.1 8840 %h %p
```


#### Trouble Shooting
* If ruby fails due to readline extension make sure you have the correct os version. May need to uninstall and reinstall if upgraded from previous version of osx.
* If you have issues with mysql there could be permission issues with the working dir. I have not found a perfect solution for all environments, but these have worked on some.  Try one at a time.
```
sudo chown -R ${whoami}:admin /usr/local/var/mysql
sudo chmod -R o+rwx /usr/local/var/mysql
```

* if you are running into issue installing php56 for the nginx configuration try:
```
xcode-select --install
```

npm behind a proxy:
```
npm config set proxy http://www-proxy.us.oracle.com:80
npm config set https-proxy http://www-proxy.us.oracle.com:80
export npm_config_proxy http://www-proxy.us.oracle.com:80
export npm_config_https_proxy http://www-proxy.us.oracle.com:80
```

### Web Server Details

#### APACHE
* config: `/etc/apache2/httpd.conf`
* urls: http://localhost (php), http://foo.bar.com (html)

#### H20
* config: `/usr/local/etc/h2o/h2o.conf`
* url: http://localhost:8080 (html)

#### NGINX
* config: `/usr/local/etc/nginx/nginx.conf`
* urls: http://localhost:8081 (php), http://localhost:8082 (php), http://localhost:8083 (html/php)
