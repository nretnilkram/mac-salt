jsc_symlink:
  file.symlink:
    - name: /usr/local/bin/jsc
    - target: /System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc
    - user: {{grains['user']}}
    - group: wheel
