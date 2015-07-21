# This file is part of Rebooty-inspector, providing intelligent tab-completion for BASH
# Save it to: /etc/bash_completion.d/
#
# Revision date:  2015/07/21, matching up with Rebooty-inspector v0.2.x
# Latest version: <http://github.com/ryran/Rebooty-inspector>
#
# Copyright 2015 Ryan Sawhill Aroha <rsaw@redhat.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#    General Public License <gnu.org/licenses/gpl.html> for more details.
#
#-------------------------------------------------------------------------------

_Rebooty-inspector()  {
  
  # Variables
  local curr prev shrtopts longopts
  
  # Wipe out COMPREPLY array
  COMPREPLY=()
  
  # Set cur & prev appropriately
  curr=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}
  
  # Short and long options
  shrtopts="-h -l -a -e
            -q -v -n
            -o -f -g -x"
            
  longopts="--help --logit --all --event
            --quiet --verbose --lines
            --os --file --glob --nocolor"
  
  # Check previous arg to see if we need to do anything special
  case "${prev}" in
  
      # Disable autocompletion for solo opts and opts that we can't guess args for
      -h|--help)
          return
          ;;
      -n|--lines)
          COMPREPLY=( $(compgen -W "10 20 30 40 50 60 70 80 9999" -- "${curr}") )
          return
          ;;
      -o|--os)
          COMPREPLY=( $(compgen -W "5 5-rsyslog3 5-rsyslog5 6 7" -- "${curr}") )
          return
          ;;
      -f|--file)
          compopt -o plusdirs  # Important!
          COMPREPLY=( $(compgen -f -- "${curr}") )
          return 0
          ;;
  esac
  
  # Now that we've made it past the options that require args,
  # we can enable directory completion
  compopt -o plusdirs
  
  if [[ ${curr} == --* ]]; then
      # If current arg starts w/2 dashes, attempt to autocomplete long opts
      COMPREPLY=( $(compgen -W "${longopts}" -- "${curr}") )
      return 0
  elif [[ ${curr} == -* ]]; then
      # Otherwise, if current only starts w/1 dash, attempt autocomplete short opts
      COMPREPLY=( $(compgen -W "${shrtopts}" -- "${curr}") )
      return 0
  fi
}

# Add the names of any Rebooty-inspector aliases (or alternate file-names) to the end of the following line
complete -F _Rebooty-inspector Rebooty-inspector
