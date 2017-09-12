# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import template with context %}

{% for name, site in pillar['joomla']['sites'].items() %}
{% set cmd_install = "-L {{ site.dbuser }} -H {{ site.dbhost }} -P {{ site.dbport }} -db {{ site.database }} " %}
install_{{ name }}:
 cmd.run:
  - name: '/usr/local/bin/joomla site:create {{cmd_install}} --overwrite {{ name }}'
  - cwd: {{ map.docroot }}/{{ name }}
  - user: {{ map.www_user }}

{% endfor %}