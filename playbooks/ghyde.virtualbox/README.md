# VirtualBox

Install VirtualBox on Fedora ([reference][ref]).

## Role Variables

### defaults/main.yml

| name                    | description                     | type   | default                                      |
| ----------------------- | ------------------------------- | ------ | -------------------------------------------- |
| virtualbox_dependencies | List of VirtualBox dependencies | List   | (See [defaults/main.yml](defaults/main.yml)) |
| virtualbox_package_name | Name of VirtualBox package      | String | VirtualBox-6.0                               |

### vars/main.yml

| name                | description                                 | type | default                                                               |
| ------------------- | ------------------------------------------- | ---- | --------------------------------------------------------------------- |
| virtualbox_key_url  | URL for VirtualBox key                      | URL  | https://www.virtualbox.org/download/oracle_vbox.asc                   |
| virtualbox_repo_url | URL for VirtualBox repository configuration | URL  | https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo |

## Example Playbook

```yaml
- hosts: workstations
  tasks:
  - import_role:
      name: virtualbox
```

## License

MIT

[ref]: https://www.cyberciti.biz/faq/how-to-install-virtualbox-on-fedora-linux/
