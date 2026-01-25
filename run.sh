#!/bin/bash
# 每日论文搜索脚本
# 用法: ./run.sh [研究关键词]
# 示例: ./run.sh "LLM reasoning"
#       ./run.sh "multimodal vision"

KEYWORDS="${1:-LLM reasoning}"

echo "📚 开始搜索论文..."
echo "研究方向: $KEYWORDS"
echo "时间: $(date)"
echo "---"

cd ~/paper-daily
/opt/homebrew/bin/claude --print "/paper-daily $KEYWORDS"

echo "---"
echo "✅ 完成!"
