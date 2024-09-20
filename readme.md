
# SLIDESPEECH: A Large Scale Slide-Enriched Audio-Visual Corpus

The official related scripts for downloading the Corpus of our ICASSP 2024 paper "SLIDESPEECH: A Large Scale Slide-Enriched Audio-Visual Corpus".

Detailed Website: https://slidespeech.github.io/

## Authors

Haoxu Wang, Fan Yu, Xian Shi, Yuezhang Wang, Shiliang Zhang, Ming Li

## Content

### Abstract

Multi-Modal automatic speech recognition (ASR) techniques aim to leverage additional modalities to improve the performance of speech recognition systems. While existing approaches primarily focus on video or contextual information, the utilization of extra supplementary textual information has been overlooked. Recognizing the abundance of online conference videos with slides, which provide rich domain-specific information in the form of text and images, we release SlideSpeech, a large-scale audio-visual corpus enriched with slides. The corpus contains 1,705 videos, 1,000+ hours, with 473 hours of high-quality transcribed speech. Moreover, the corpus contains a significant amount of real-time synchronized slides.
In this work, we present the pipeline for constructing the corpus and propose baseline methods for utilizing text information in the visual slide context. Through the application of keyword extraction and contextual ASR methods in the benchmark system, we demonstrate the potential of improving speech recognition performance by incorporating textual information from supplementary video slides.

## Download the Corpus from Youtube

### Install the ytb-dl tookit

Please refer to the [yt-dlp](https://github.com/yt-dlp/yt-dlp) to install the tookits.

```
pip install yt-dlp
```

### Download the SlideSpeech

```
bash run.sh
```

#### Explanation

- stage 0: Download the wavid2channel files from the website.
- stage 1: Prepare the download scripts.
- stage 2: Use the yt-dlp toolkit to download the videos.
- stage 3: Check the completeness of the corpus and maybe redownload.
    - You maybe run this stage many times.
    - There maybe some videos unavailable and they can not be downloaded anymore.
- stage 4: Get 16k wavs from the videos.


## Citation

```
@INPROCEEDINGS{10448079,
  author={Wang, Haoxu and Yu, Fan and Shi, Xian and Wang, Yuezhang and Zhang, Shiliang and Li, Ming},
  booktitle={ICASSP 2024 - 2024 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)}, 
  title={SlideSpeech: A Large Scale Slide-Enriched Audio-Visual Corpus}, 
  year={2024},
  volume={},
  number={},
  pages={11076-11080},
  keywords={Visualization;Text recognition;Pipelines;Streaming media;Benchmark testing;Web conferencing;Signal processing;audio visual speech recognition;corpus;slides},
  doi={10.1109/ICASSP48485.2024.10448079}
}
```

## License


## Contact

If you have any suggestion or question, you can contact us by: sly.zsl@alibaba-inc.com. Thanks for your attention!