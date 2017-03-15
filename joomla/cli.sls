# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import joomla with context %}

install_joomlatools:
  cmd.run:
    - name: '/usr/local/bin/composer global require joomlatools/console'
    - env: 
      - COMPOSER_HOME: "{{ salt['pillar.get']('joomla:composer_home') }}"

/usr/local/bin/.composer/vendor/bin/joomla:
  file.symlink:
    - target: /usr/local/bin/joomla
    - makedirs: False
