#!/bin/bash

FREQUENCY=1                                          # Delay between each check for completion
BACKGROUND_SIGNAL_FILE='/opt/.backgroundfinished'    # File updated by background to indicate completion
BACKGROUND_SAFE_WORD='done'                          # Word in BACKGROUND_SIGNAL_FILE indicating completion
START_MESSAGE='Starting scenario'                    # Message before the progress animation
END_NORMAL_MESSAGE='Challenge ready.'
END_KILLED_MESSAGE='Interupted. This scenario may still be initializing.'

SPINNER_COLOR_NUM=2                # Color to use, unless COLOR_CYCLE=1
SPINNER_COLOR_CYCLE=0              # 1 to rotate colors between each animation
INTERVAL=.25
SPINNER_NORMAL=$(tput sgr0)        # Reset encoding
symbols=("▐⠂       ▌" "▐⠈       ▌" "▐ ⠂      ▌" "▐ ⠠      ▌" "▐  ⡀     ▌" "▐  ⠠     ▌" "▐   ⠂    ▌" "▐   ⠈    ▌" "▐    ⠂   ▌" "▐    ⠠   ▌" "▐     ⡀  ▌" "▐     ⠠  ▌" "▐      ⠂ ▌" "▐      ⠈ ▌" "▐       ⠂▌" "▐       ⠠▌" "▐       ⡀▌" "▐      ⠠ ▌" "▐      ⠂ ▌" "▐     ⠈  ▌" "▐     ⠂  ▌" "▐    ⠠   ▌" "▐    ⡀   ▌" "▐   ⠠    ▌" "▐   ⠂    ▌" "▐  ⠈     ▌" "▐  ⠂     ▌" "▐ ⠠      ▌" "▐ ⡀      ▌" "▐⠠       ▌")

progress_pid=0

apt-get install apache2 -y

mkdir /test
cd /test
touch file.log
echo "Initiating" >> file.log