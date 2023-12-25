
import json
import argparse
import os
import glob

def get_args():
    parser = argparse.ArgumentParser(description='prepare mp42wav scripts')
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
        # with open(f"data/{group}/wavid2channel.json", 'r') as f:
        #     wavid2channel = json.load(f)
        mp4list = glob.glob(f"{superpath}/{group}/*/*.mp4")
        now_wavid_list = [mp4path.split("/")[-1].split(".")[0] for mp4path in mp4list]
        with open(f"data/{group}/process_mp42wav.sh", 'w') as f:
            for wavid in now_wavid_list:
                category = wavid.split("_")[0]
                input_dir = f"{superpath}/{group}/{category}/{wavid}.mp4"
                output_dir = f"{superpath}/{group}/wav/{category}/{wavid}.wav"
                process_str = "mkdir -p {} && ".format(os.path.dirname(output_dir))
                process_str += f"ffmpeg -loglevel panic -i {input_dir} -ac 1 -ar 16000 {output_dir}"
                f.write("{}\n".format(process_str))

