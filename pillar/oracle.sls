oracle: true

eloqua_dns_masq_domains:
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

oracle_dns_masq_domains:
  - cpdm.oraclecorp.com
  - test-cpdm.oraclecorp.com

apache_localhost_sites:
  - [{{grains['homedir']}}/Dropbox/Website, 8888]
  - [{{grains['homedir']}}/dev_mlintern/marklintern-com, 8085]
  - [{{grains['homedir']}}/dev_mlintern/Twig Website, 8086]

nginx_sites:

vagrant_version: 2.0.2
