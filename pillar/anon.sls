html_web_dirs:
  - one
  - two
  - four
  - five
  - ten
  - eleven

php_web_dirs:
  - three
  - six
  - seven
  - eight
  - nine

apache_localhost_sites:
  - [{{grains['homedir']}}/web/one, 80]
  - [{{grains['homedir']}}/web/two, 8885]
  - [{{grains['homedir']}}/web/three, 8886]
  - [{{grains['homedir']}}/web/eleven, 8890]

apache_nretnil_local_dir: {{grains['homedir']}}/web/four

h2o_sites:
  - {{grains['homedir']}}/web/five, 8888]
  - {{grains['homedir']}}/web/ten, 8889]

nginx_sites:
  - [{{grains['homedir']}}/web/six, 8881]
  - [{{grains['homedir']}}/web/seven, 8882]
  - [{{grains['homedir']}}/web/eight, 8883]
  - [{{grains['homedir']}}/web/nine, 8884]
