html_web_dirs:
  - one
  - two
  - three

php_web_dirs:
  - four

apache_localhost_sites:
  - [{{grains['homedir']}}/Dropbox/Website, 80]
  - [{{grains['homedir']}}/web/one, 8881]
  - [{{grains['homedir']}}/web/two, 8882]

apache_nretnil_local_dir: {{grains['homedir']}}/Dropbox/var-www-html

h2o_sites:
  - {{grains['homedir']}}/web/three, 8883]

nginx_sites:
  - [{{grains['homedir']}}/web/four, 8884]
