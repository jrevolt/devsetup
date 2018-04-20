#!/bin/bash

detect() {
  local regroot="/HKEY_CURRENT_USER/Software/Microsoft/Windows/CurrentVersion/Internet Settings"
  local enabled="$(regtool get "$regroot/ProxyEnable")"
  local proxy="$(regtool get "$regroot/ProxyServer")"
  local noproxy="$(regtool get "$regroot/ProxyOverride")"
    
  if [[ "$enabled" = "1" &&  "$proxy" != "" ]]; then
	export http_proxy="$proxy"
	export https_proxy="$proxy"
	export no_proxy="$(echo "$noproxy" | sed 's/;/,/g; s/,<local>//')"
  fi
}

detect

