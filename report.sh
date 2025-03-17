#!/bin/sh

# Default values
PROJECT="phi"
TOKENIZER="Qwen/Qwen2.5-0.5B-Instruct"
METRICS_DIR="$PROJECT/vllm_512_120_shareGPT/"

# Allow command-line arguments to override defaults
if [ -n "$1" ]; then
    METRICS_DIR="$1"
fi

if [ -n "$2" ]; then
    TOKENIZER="$2"
fi

# Debugging (optional)
echo "Using Tokenizer: $TOKENIZER"
echo "Using Metrics Directory: $METRICS_DIR"

# Run the command
python report.py --tokenizer-dir="$TOKENIZER" --output-dir="$METRICS_DIR"
