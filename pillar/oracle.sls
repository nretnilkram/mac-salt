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

vagrant_version: 2.0.2

apache_localhost_sites:
  - [{{grains['homedir']}}/Dropbox/Website/dev/avatar, 8081]
  - [{{grains['homedir']}}/dev_mlintern/lintern-us, 8082]
  - [{{grains['homedir']}}/dev_mlintern/nretnil-com, 8083]
  - [{{grains['homedir']}}/dev_mlintern/sandybox, 8084]
  - [{{grains['homedir']}}/dev_mlintern/marklintern-com, 8085]
  - [{{grains['homedir']}}/dev_mlintern/Twig-Website, 8086]
  - [{{grains['homedir']}}/Dropbox/Website, 8888]
