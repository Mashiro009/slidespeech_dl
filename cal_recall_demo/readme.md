
# The demo of scripts for computing Recall

```bash

# python compute_wer_details.py --v 1 --ref ref --ref_ocr ocr --ref2session wav2session --rec_name base --rec_file rec > unit_test.results  
# python compute_wer_details.py --v 1 --ref ref --ref_ocr ocr --ref2session wav2session --rec_name base --rec_file rec --rec_name hot --rec_file rec1 > unit_test_compare.results  

bash unit_test.sh


```

The scripts compute both the relevant information for a single recognition result and compares the difference between two model recognition results.

`ref2session` denotes the session corresponding to each uttid, and the recognition result metrics of each session can be computed separately.