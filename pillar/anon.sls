html_web_dirs:
  - one
  - two
  - four
  - five

php_web_dirs:
  - three
  - six
  - seven
  - eight
  - nine

apache_localhost_sites:
  - [{{grains['homedir']}}/web/one, 80]
  - [{{grains['homedir']}}/web/two, 8085]
  - [{{grains['homedir']}}/web/three, 8086]

apache_nretnil_local_dir: {{grains['homedir']}}/web/four

h2o_localhost_8080_dir: {{grains['homedir']}}/web/five

nginx_sites:
  - [{{grains['homedir']}}/web/six, 8081]
  - [{{grains['homedir']}}/web/seven, 8082]
  - [{{grains['homedir']}}/web/eight, 8083]
  - [{{grains['homedir']}}/web/nine, 8084]
