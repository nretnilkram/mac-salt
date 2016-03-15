redis:
  pkg.installed

redis_plist:
  file.copy:
    - name: {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.redis.plist
    - source: /usr/local/opt/redis/homebrew.mxcl.redis.plist
    - user: {{grains['user']}}
    - force: true
    - require:
      - pkg: redis

redis_setup_service:
  cmd.run:
    - name: launchctl unload -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.redis.plist; launchctl load -w {{grains['homedir']}}/Library/LaunchAgents/homebrew.mxcl.redis.plist
    - user: {{grains['user']}}
    - require:
      - file: redis_plist