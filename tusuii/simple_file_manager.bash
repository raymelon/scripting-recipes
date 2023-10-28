#!/bin/bash

dir=$(pwd)
files=($(find "$dir" -maxdepth 1 -type f -printf "%f\n" | sort))
file_sel=$(printf "%s\n" "${files[@]}" | fzf --preview "file {}" --preview-window=up:30%:wrap)

if [ -n "$file_sel" ]; then
  ext="${file_sel##*.}"

  case "$ext" in
    "pdf")
      zathura "$dir/$file_sel" &
      ;;
      
    "jpg" | "jpeg" | "png" | "gif")

      sxiv "$dir/$file_sel" &
      ;;
      
    "xlsx" | "csv" | "ods")
    
    	libreoffice --calc "$dir/$file_sel" &
    	;;
    
    "docx" | "odt")
    
    	libreoffice --writer "$dir/$file_sel" &
    	;;
    	
    *)
      xdg-open "$dir/$file_sel" &
      ;;
  esac
fi
