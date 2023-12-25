
import json
import argparse
import os

def get_args():
    parser = argparse.ArgumentParser(description='prepare download scripts')
    parser.add_argument('--superpath',
                        default='slidespeech',
                        type=str,
                        help='the path to store slidespeech')
    args = parser.parse_args()
    return args

if __name__ == "__main__":
    args = get_args()

    superpath = args.superpath
    for group in ['train', 'dev', 'test']:
        if not os.path.exists(f"data/{group}/wavid2channel.json"):
            print(f"data/{group}/wavid2channel.json does not exist.")
            print("Please first download the wavid2channel.tar.gz from https://slidespeech.github.io/ and uncompress it.")
            break
        with open(f"data/{group}/wavid2channel.json", 'r') as f:
            wavid2channel = json.load(f)
        idx = 0
        with open(f"data/{group}/process.sh", 'w') as f:
            for wavid, youtube_channel in wavid2channel.items():
                idx += 1
                if idx > 2:
                    break
                category = wavid.split("_")[0]
                output_dir = f"{superpath}/{group}/{category}/{wavid}.%(ext)s"
                process_str = "yt-dlp -f 22 -o '{}' https://www.youtube.com/watch?v={}".format(
                    output_dir, youtube_channel
                )
                f.write(f"{process_str}\n")
