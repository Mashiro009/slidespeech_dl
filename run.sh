#!/bin/bash

stage=-1 # start from 0 if you need to start from data preparation
stop_stage=3


# The slidespeech dataset location, please change this to your own path
slidespeech_data=/export/data/asr-data/OpenSLR/144/
# slidespeech_data=slidespeech

if [ ${stage} -le -1 ] && [ ${stop_stage} -ge -1 ]; then
    echo "stage -1: Youtube Channel Info Download"
    wget https://speech-lab-share-data.oss-cn-shanghai.aliyuncs.com/SlideSpeech/wavid2channel.tar.gz .
    tar -xzvf wavid2channel.tar.gz
fi

if [ ${stage} -le 0 ] && [ ${stop_stage} -ge 0 ]; then
    echo "stage 0: Prepare Download Scripts"
    python local/prepare_download_scripts.py --superpath ${slidespeech_data}
fi

if [ ${stage} -le 1 ] && [ ${stop_stage} -ge 1 ]; then
    echo "stage 1: Downloading Videos"
    for group in train dev test; do
        echo "run data/${group}/process.sh"
        bash data/${group}/process.sh
    done
fi

if [ ${stage} -le 2 ] && [ ${stop_stage} -ge 2 ]; then
    echo "stage 2: Check the Completeness of the Corpus and maybe redownload"
    python local/check_download.py --superpath ${slidespeech_data}
    for group in train dev test; do
        if [ -f data/${group}/process_fix.sh ]; then
            echo "redownload the remained videos and run data/${group}/process_fix.sh";
            bash data/${group}/process_fix.sh
            rm data/${group}/process_fix.sh
        fi
    done
fi

if [ ${stage} -le 3 ] && [ ${stop_stage} -ge 3 ]; then
    echo "stage 3: Get 16k wavs from the videos"
    python local/prepare_video2wav_scripts.py --superpath ${slidespeech_data}
    for group in train dev test; do
        echo "run data/${group}/process_mp42wav.sh"
        bash data/${group}/process_mp42wav.sh
    done
fi





