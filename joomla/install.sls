# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import joomla with context %}

{% for name, site in pillar['joomla']['sites'].items() %}
{% set cmd_install = "-L {{ site.dbuser }} -H {{ site.dbhost }} -db {{ site.database }} " %}
install_{{ name }}:
 cmd.run:
  - name: '/usr/local/bin/joomla site:create {{cmd_install}} --overwrite {{ name }} --www={{ joomla.docroot }}/{{ name }}'
  - cwd: {{ joomla.docroot }}/{{ name }}
  - user: {{ joomla.www_user }}

{% endfor %}