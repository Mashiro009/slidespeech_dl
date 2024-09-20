

superdir=.

python compute_wer_details.py --v 1 \
    --ref ${superdir}/ref \
    --ref_ocr ${superdir}/ocr  \
    --ref2session ${superdir}/wav2session \
    --rec_name base \
    --rec_file ${superdir}/rec \
    > ${superdir}/unit_test.results

python compute_wer_details.py --v 1 \
    --ref ${superdir}/ref \
    --ref_ocr ${superdir}/ocr  \
    --ref2session ${superdir}/wav2session \
    --rec_name base \
    --rec_name hot \
    --rec_file ${superdir}/rec \
    --rec_file ${superdir}/rec1 \
    > ${superdir}/unit_test_compare.results