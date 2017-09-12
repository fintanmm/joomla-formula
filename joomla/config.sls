# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import joomla with context %}

{% for name, site in pillar['joomla']['sites'].items() %}
{% set cmd_config = "-L {{ site.dbuser }} -H {{ site.dbhost }} -P {{ site.dbport }} -db {{ site.database }} " %}
configure_{{ name }}:
 cmd.run:
  - name: '/usr/local/bin/joomla site:configure {{cmd_config}} --overwrite {{ name }}'
  - cwd: {{ docroot }}/{{ name }}
  - user: {{ www_user }}

{% endfor %}
