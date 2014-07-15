#!/bin/bash
#
# yet another cat
#
# Restrict cat command which means 'concat'
# 'concat' を表す cat コマンドを厳密化！！
#
# show AA of a cat if non-stdin or not specified 2 or more files
# 標準入力が無い、かつ、ファイルが指定されない場合、猫のAAを流します
#
# @see http://kenji1234.blog75.fc2.com/blog-entry-19.html
#
#
# @dankogai /proc/uptime is not portable so replaced with perl's Time::HiRes
#

concatable () {
    if [ ! -t 0 ];then
          return 0
            fi
              local FILE_COUNT=0
                for arg in "$@"; do
                      if [[ "$arg" != -* ]] && [ -f "$arg" ]; then
                              return 0
                                  fi
                                    done
                                      return 1
}

if concatable "$@" ; then
    /bin/cat "$@";
      exit $?
      fi

      CAT_LENGTH=80
      CAT_HEIGHT=13
       CAT[0]="            lヽ、                  /ヽ"
        CAT[1]="            i!  ﾞヽ、           ／   ﾞi!           ..,,  .,,.;;''⌒ヽ"
         CAT[2]="            l       ゝ-─‐-／'       i!   , ,__,,;'\"   \"';       ,ﾉ\""
          CAT[3]="          ,／\"                        i!''\"   ....ﾞ'';;..,,;;    ,,Y\""
           CAT[4]="        ,/'                           〈                  'i;;- ､,,    "
            CAT[5]="        i'                             'i,                         ﾞ\"ヽ、"
             CAT[6]="        i!   ●            ●      ＊ ,'i                            ﾞ )"
              CAT[7]="        'i,:::    ﾄ----ｲ      :::::::    ,/        '          ﾞ\",;''i,--'\""
               CAT[8]="  ,,-‐''\"\\､       \\,_/          ,,-‐                  ,..;;;ﾞ\""
                CAT[9]="（        ,,, ''          ,,.-‐''\"              ,,'\"´｀'´"
                CAT[10]=" ヽ,..-‐''       ,.-‐''\"             /-‐''\"´"
                CAT[11]="              （             ,. -'\""
                CAT[12]="                 ヽ、,,.. -‐'''\""

                CAT_2_LEIGTH=46
                CAT_2_HEIGHT=10
                CAT_2[0]="       ;' ':;,,          ,;'':;,"
                CAT_2[1]="      ;'     ':;,.,.,.,.,.,,,;'    ';,     っ"
                CAT_2[2]="    ,:'                     : :､"
                CAT_2[3]="  ,:'ノ            ＼     ::::::::',     っ"
                CAT_2[4]=" :'   ●         ●         :::::i."
                CAT_2[5]=" i  ///(_人＿) //// *  :::::i    "
                CAT_2[6]=" ,i.       し'                :::::i"
                CAT_2[7]="(⌒)              (⌒) ::::::::: /" 
                CAT_2[8]=" ;,  :'              ; : : ::::::::｀:､"
                CAT_2[9]="  ; ,:'               ';,.  : : ::::::｀:､"

                mili_sleep () {
                    perl -MTime::HiRes=sleep -e sleep -e 0.05
                }

                clr() {
                    echo -e '\033[H\033[2J\c'
                }
                cursor() {
                    echo -e '\033['$2';'$1'H\c'
                }
                new_screen() {
                    echo -e '\033\067\033[?47h\c'
                }
                exit_screen() {
                    echo -e '\033[?47l\033\070\c'
                }
                substr(){
                    local start=$1
                      shift
                        local length=$1
                          shift
                            str="$*"
                              echo "${str:$start:$length}"
                }
                show_cat() {
                    local length=$(( COLUMNS - $1 ))
                      (( length < 0 )) && return
                        local x=$1
                          local y=$2
                            local start=0
                              local length=$(( COLUMNS - $1 ))
                                (( x < 0 )) && start=$(( - x )) x=0
                                  for (( i=0; i < CAT_HEIGHT; i++ ));do
                                        cursor $x $(( y++ ))
                                            substr $start $length "${CAT[$i]}"
                                              done
                }

                show_cat_2 () {
                    local x=$1
                      local y=$2
                        for (( i=0; i < CAT_2_HEIGHT; i++ ));do
                              cursor $x $(( y++ ))
                                  echo "${CAT_2[$i]}"
                                    done
                }

#eval `resize`
COLUMNS=`tput cols`
LINES=`tput lines`
trap '' 2
new_screen
clr
h=$(( (LINES - CAT_HEIGHT) / 2 ))
c=0;
while (( c < COLUMNS + CAT_LENGTH )); do
    x=$(( COLUMNS - c ))
      show_cat $x $h $c
        mili_sleep 20
          c=$(( c + 2 ))
            clr
            done

            show_cat_2 20 $h
            cursor 20 $(( $h + 13 ))
            echo "cat はきちんと concat として使いましょう"
            sleep 4
            clr
            exit_screen

# vim: sw=2 ts=2 et fdm=marker:

