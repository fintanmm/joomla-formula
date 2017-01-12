# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import joomla with context %}

check_composer_path:
  cmd.run:
    - name: 'ls /usr/bin/ /usr/sbin/'

install_joomlatools:
  cmd.run:
    - name: '/usr/local/bin/composer global require joomlatools/console' 