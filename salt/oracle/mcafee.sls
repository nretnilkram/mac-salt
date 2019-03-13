stop_mcafee_firewall:
  cron.present:
    - name: /usr/local/McAfee/StatefulFirewall/bin/StatefullFirewallControl stop >> /dev/null 2>&1
    - identifier: McAfeeFirewallControl
    - user: root
    - minute: '*/9'

stop_mcafee_on_access_scan:
  cron.present:
    - name: /usr/local/McAfee/AntiMalware/VSControl stopoas >> /dev/null 2>&1
    - identifier: McAfeeOnAccessScanControl
    - user: root
    - hour: '12'
