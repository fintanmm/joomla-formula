# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import template with context %}

{% set cmd_install = "-L {{ salt['pillar.get']('joomla:db:username') }} -H {{ salt['pillar.get']('joomla:db:host') }} -P {{ salt['pillar.get']('joomla:db:port') }} -db {{ salt['pillar.get']('joomla:db:name') }}" %}
install_joomla:
 cmd.run:
  - name: 'joomla site:configure {{cmd_install}} --overwrite {{ salt['pillar.get']('joomla:site') }}'
