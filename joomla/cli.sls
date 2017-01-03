# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "template/map.jinja" import template with context %}

install_joomlatools:
 cmd.run:
  - name: 'composer global require joomlatools/console' 
