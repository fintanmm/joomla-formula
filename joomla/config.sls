# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import joomla with context %}

{% set cmd_config = "-L {{ salt['pillar.get']('joomla:db:username') }} -H {{ salt['pillar.get']('joomla:db:host') }} -P {{ salt['pillar.get']('joomla:db:port') }} -db {{ salt['pillar.get']('joomla:db:name') }}" %}
config_joomla:
 cmd.run:
  - name: 'joomla site:configure {{cmd_config}} --overwrite {{ salt['pillar.get']('joomla:site') }}'