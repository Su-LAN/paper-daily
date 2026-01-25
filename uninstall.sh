#!/bin/bash

# ============================================
# Paper Daily - 卸载脚本
# ============================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║     📚 Paper Daily 卸载程序                ║"
echo "╚════════════════════════════════════════════╝"
echo ""

read -p "确定要卸载 Paper Daily 吗? (y/n): " confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "已取消卸载"
    exit 0
fi

echo ""
echo -e "${YELLOW}[INFO]${NC} 停止定时任务..."
launchctl unload ~/Library/LaunchAgents/com.paper-daily.plist 2>/dev/null || true
launchctl unload ~/Library/LaunchAgents/com.paper-daily-update.plist 2>/dev/null || true

echo -e "${YELLOW}[INFO]${NC} 删除 LaunchAgent 文件..."
rm -f ~/Library/LaunchAgents/com.paper-daily.plist
rm -f ~/Library/LaunchAgents/com.paper-daily-update.plist

echo -e "${YELLOW}[INFO]${NC} 删除 Skill 文件..."
rm -rf ~/.claude/skills/paper-daily

read -p "是否删除论文数据 (~/paper-daily)? (y/n): " delete_data

if [[ "$delete_data" == "y" || "$delete_data" == "Y" ]]; then
    echo -e "${YELLOW}[INFO]${NC} 删除数据目录..."
    rm -rf ~/paper-daily
    echo -e "${GREEN}[OK]${NC} 所有数据已删除"
else
    echo -e "${GREEN}[OK]${NC} 数据目录已保留: ~/paper-daily"
fi

echo ""
echo -e "${GREEN}✅ 卸载完成!${NC}"
echo ""
