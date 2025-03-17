#!/bin/sh
source .env

PARAM='--dataset="unieai/shareGPT" --conversation="conversation"'
DATASET="shareGPT"
if [ -n "$3" ]; then
    PARAM='--dataset="unieai/longDocQA" --template="{question}"'    
    DATASET="longDocQA"
fi

CONCURRENCY=${1:-512}
TIME=${2:-120}
PROJECT="phi"
MODEL="gpt-3.5-turbo"

echo "Concurrency: $CONCURRENCY"
echo "Time: $TIME"
echo "Dataset: $DATASET"

python3 metrics.py $PARAM --time-limit="$TIME" --max-concurrent="$CONCURRENCY" --model=$MODEL --api-url=$API_URL --output-dir="$PROJECT/vllm_${CONCURRENCY}_${TIME}_${DATASET}"
