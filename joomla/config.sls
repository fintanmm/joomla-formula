# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import joomla with context %}

{% for name, site in pillar['joomla']['sites'].items() %}
{% set cmd_config = "-L {{ site.dbuser }} -H {{ site.dbhost }} -db {{ site.database }} " %}
configure_{{ name }}:
 cmd.run:
  - name: '/usr/local/bin/joomla site:configure {{cmd_config}} --overwrite {{ name }} --www={{ joomla.docroot }}/{{ name }}'
  - cwd: {{ joomla.docroot }}/{{ name }}
  - user: {{ joomla.www_user }}

{% endfor %}
