#!/bin/sh

# Default values
TOKENIZER_DIR="tokenizer/"
METRICS_DIR="phison/vllm_512_120_shareGPT/"

# Allow command-line arguments to override defaults
if [ -n "$1" ]; then
    METRICS_DIR="$1"
fi

if [ -n "$2" ]; then
    TOKENIZER_DIR="$2"
fi

# Debugging (optional)
echo "Using Tokenizer Directory: $TOKENIZER_DIR"
echo "Using Metrics Directory: $METRICS_DIR"

# Run the command
python report.py --tokenizer-dir="$TOKENIZER_DIR" --output-dir="$METRICS_DIR"
