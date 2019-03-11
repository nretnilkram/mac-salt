oracle: true

eloqua_dnsmasq_domains:
  - elqdev19.com
  - appcloudqa.eloqua.com
  - dev.eloquacorp.com
  - dev.eloqua.com
  - dev19p01.eloquaeditors.com
  - elqdev08.com
  - dev08p01.eloquapreview.com
  - dev08p01.eloquaeditors.com
  - devsecure.eloquacorp.com
  - devlogin.eloquacorp.com
  - eloquatesting.com

oracle_dnsmasq_domains:
  - cpdm.oraclecorp.com
  - test-cpdm.oraclecorp.com

vagrant_version: 2.2.4

apache_localhost_sites:
  - [{{grains['homedir']}}/Dropbox/Website, 8880]
  - [{{grains['homedir']}}/Dropbox/Website/dev/avatar, 8881]
  - [{{grains['homedir']}}/dev_mlintern/lintern-us, 8882]
  - [{{grains['homedir']}}/dev_mlintern/nretnil-com, 8883]
  - [{{grains['homedir']}}/dev_mlintern/sandybox, 8884]
  - [{{grains['homedir']}}/dev_mlintern/marklintern-com, 8885]
  - [{{grains['homedir']}}/dev_mlintern/Twig-Website, 8886]

nginx_sites:
