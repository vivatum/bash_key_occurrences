#!/bin/bash

#README
#script parameters: <path to Localizable file> <min occurrences for key - Int> <path to search folder>
#run example: % bash key_occurrences_counter.sh /imka2/IMKA/pl.lproj/Localizable.strings 3 /Developer/iMKA_iOS/imka


results_file_name="result_list.txt"
localizable_file=$1
min_count=$2
search_folder_path=$3

YELLOW='\033[1;33m'
BLUE='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

declare -i current_line=0

echo -e ${YELLOW}"  Start analysis..."${NC}

function create_report_file {
  [ ! -e $results_file_name ] || rm $results_file_name
  touch $results_file_name
  echo "REPORT" >> $results_file_name
  echo "Unused Localizable Keys:" >> $results_file_name
  report_start_title="Report start: "
  current_date=$(date +%F)
  current_time=$(date +%T)
  echo $report_start_title $current_date $current_time >> $results_file_name
  echo -e "Search path:" $search_folder_path '\n\n' >> $results_file_name
}

function get_key_in_line {
  local arg1=$1
  IFS=" = " read key value <<< $arg1
  local countSearch=$(grep -R $key $search_folder_path | wc -l);
  if (( $countSearch < $min_count ));
  then
    echo $key "--->" $countSearch >> $results_file_name
  fi
}

function analyze_localizable_file {
  if [[ $localizable_file != "" ]];
  then
    local -i all_lines=$(wc -l < $localizable_file)
    while read line
    do
      ((current_line++))
      echo -en "\r\033[K""  ${YELLOW}Progress: "${RED}"$current_line"${NC}"/"${BLUE}"$all_lines"${NC}
      local no_space_line=${line// /}
      if [[ $no_space_line != "" ]] && [[ $line != *"MARK:"* ]];
      then
        get_key_in_line $line
      fi
    done < "$localizable_file"
    echo "Localizable file FINISHED"
  else
    echo "Localizable file is empty"
  fi
}

function finish_report {
  report_finish="Report time: "
  current_date=$(date +%F)
  current_time=$(date +%T)
  echo -e '\n\n'$report_finish $current_date $current_time >> $results_file_name
  cat $results_file_name
}

create_report_file
analyze_localizable_file
finish_report
