# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "joomla/map.jinja" import joomla with context %}

install_joomlatools:
 cmd.run:
  - name: 'composer global require joomlatools/console' 
