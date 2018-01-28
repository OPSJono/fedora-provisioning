master: [![Build Status](https://travis-ci.org/avnes/ansible-role-slack.png?branch=master)](https://travis-ci.org/avnes/ansible-role-slack) develop: [![Build Status](https://travis-ci.org/avnes/ansible-role-slack.png?branch=develop)](https://travis-ci.org/avnes/ansible-role-slack)
# ansible-role-slack

Downloads and installs the latest version of Slack for Linux.

## Requirements

None

## Role Variables

defaults/main.yml
```
slack_tmp_dir: /tmp
```

vars/main.yml
```
slack_base_url: https://slack.com/downloads/instructions/
slack_os: "{{ ansible_system | lower }}"
slack_download_url: "{{ slack_base_url }}{{ slack_distro }}?os={{ slack_os }}"

slack_html_src: "{{ slack_tmp_dir }}/slack-{{ slack_distro }}.html"

slack_package: "{{ slack_tmp_dir }}/slack-{{ slack_distro }}.{{ slack_package_format }}"
```

vars/Ubuntu.yml
```
slack_distro: ubuntu
slack_package_format: deb
```

vars/RedHat.yml
```
slack_distro: fedora
slack_package_format: rpm
```

## Dependencies

None

## Example Playbook

```
---
- hosts: localhost
  become: yes
  roles:
     - { role: avnes.ansible-role-slack, slack_tmp_dir: /tmp }
```

## License

MIT except for list_urls.sed from <https://github.com/aureliojargas/sed.sf.net>
that is not registered with a license.

## Author Information

<https://github.com/avnes>

## Credits

The script list_urls.sed was obtained from <https://github.com/aureliojargas/sed.sf.net>
