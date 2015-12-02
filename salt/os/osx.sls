
git:
  pkg.installed

python-pip:
  cmd.run:
    - name: easy_install pip

plist:
  pip.installed:
    - require:
      - cmd: python-pip
