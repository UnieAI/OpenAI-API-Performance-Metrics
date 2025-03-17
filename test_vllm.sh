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

export API_KEY=sk-XMbTbzBOmPYGHgL_HzTKryfDqpmOIIkI8cmSmuaNBENNslOmRXS3Fo4oFoA
python3 metrics.py $PARAM --time-limit="$TIME" --max-concurrent="$CONCURRENCY" --model=qwen_2.5_14b_vllm --api-url=https://vllm.exp.unieai.com/v1/chat/completions --output-dir="phison/vllm_${CONCURRENCY}_${TIME}_${DATASET}"
