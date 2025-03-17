#!/bin/sh

PARAM='--dataset="unieai/shareGPT" --conversation="conversation"'
DATASET="shareGPT"
if [ -n "$3" ]; then
    PARAM='--dataset="unieai/longDocQA" --template="{question}"'    
    DATASET="longDocQA"
fi
CONCURRENCY=${1:-512}
TIME=${2:-120}

echo "Concurrency: $CONCURRENCY"
echo "Time: $TIME"
echo "Dataset: $DATASET"

export API_KEY=sk-a4f328fa02fa11f0a28f1b1f424847fa
python3 metrics.py $PARAM --time-limit="$TIME" --max-concurrent="$CONCURRENCY" --model="qwen_2.5_14b_unieinfra" --api-url=https://uifw2.exp.unieai.com/v1/chat/completions --output-dir="phison/unieinfra_${CONCURRENCY}_${TIME}_${DATASET}"
