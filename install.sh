#!/bin/bash

# ============================================
# Paper Daily - 自动安装脚本
# ============================================
# 用法: curl -fsSL https://raw.githubusercontent.com/Su-LAN/paper-daily/main/install.sh | bash
# 或者: ./install.sh
# ============================================

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印带颜色的消息
info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warning() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# 检查命令是否存在
check_command() {
    if command -v "$1" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║     📚 Paper Daily 安装程序                ║"
echo "║     每日论文速递 - Claude Code Skill       ║"
echo "╚════════════════════════════════════════════╝"
echo ""

# ============================================
# Step 1: 检查系统要求
# ============================================
info "检查系统要求..."

# 检查操作系统
if [[ "$OSTYPE" != "darwin"* ]]; then
    warning "此脚本针对 macOS 优化，其他系统可能需要手动配置定时任务"
fi

# 检查 Homebrew
if ! check_command brew; then
    info "正在安装 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # 添加到 PATH (Apple Silicon)
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi
success "Homebrew 已安装"

# 检查 Git
if ! check_command git; then
    info "正在安装 Git..."
    brew install git
fi
success "Git 已安装"

# 检查 GitHub CLI
if ! check_command gh; then
    info "正在安装 GitHub CLI..."
    brew install gh
fi
success "GitHub CLI 已安装"

# 检查 Claude Code
if ! check_command claude; then
    info "正在安装 Claude Code..."
    npm install -g @anthropic-ai/claude-code 2>/dev/null || {
        warning "npm 安装失败，尝试使用 Homebrew..."
        brew install claude-code 2>/dev/null || {
            echo ""
            error "无法自动安装 Claude Code，请手动安装:

1. 访问: https://claude.ai/download
2. 或运行: npm install -g @anthropic-ai/claude-code
3. 安装后重新运行此脚本"
        }
    }
fi
success "Claude Code 已安装"

# 检查 Claude Code 登录状态
info "检查 Claude Code 登录状态..."
if ! claude --version &>/dev/null; then
    warning "请先登录 Claude Code:"
    echo "  运行: claude"
    echo "  按提示完成登录后，重新运行此安装脚本"
    exit 1
fi
success "Claude Code 已就绪"

# ============================================
# Step 2: 设置目录
# ============================================
info "设置目录结构..."

INSTALL_DIR="$HOME/paper-daily"
SKILL_DIR="$HOME/.claude/skills/paper-daily"

# 创建目录
mkdir -p "$INSTALL_DIR/papers"
mkdir -p "$INSTALL_DIR/reports"
mkdir -p "$INSTALL_DIR/data"
mkdir -p "$SKILL_DIR"

success "目录已创建"

# ============================================
# Step 3: 下载/复制文件
# ============================================
info "下载配置文件..."

# 如果是从 GitHub 克隆运行的
if [[ -f "./SKILL.md" ]]; then
    cp -f ./SKILL.md "$SKILL_DIR/SKILL.md"
elif [[ -f "./skill/SKILL.md" ]]; then
    cp -f ./skill/SKILL.md "$SKILL_DIR/SKILL.md"
else
    # 从 GitHub 下载
    curl -fsSL "https://raw.githubusercontent.com/Su-LAN/paper-daily/main/skill/SKILL.md" -o "$SKILL_DIR/SKILL.md"
fi

# 下载数据文件
if [[ -f "./data/venues.json" ]]; then
    cp -f ./data/venues.json "$INSTALL_DIR/data/venues.json"
else
    curl -fsSL "https://raw.githubusercontent.com/Su-LAN/paper-daily/main/data/venues.json" -o "$INSTALL_DIR/data/venues.json"
fi

# 创建默认配置
cat > "$INSTALL_DIR/config.json" << 'EOF'
{
  "default_keywords": "LLM reasoning",
  "paper_count": 3,
  "sort_by": "relevance",
  "sources": ["arxiv", "semantic_scholar"],
  "time_range": "7d",
  "venue_filter": {
    "enabled": true,
    "levels": ["CCF-A", "CORE-A*", "CORE-A"],
    "include_preprints": true
  },
  "citation_tracking": {
    "enabled": true,
    "update_existing": true
  }
}
EOF

# 创建空的论文记录
cat > "$INSTALL_DIR/data/papers.json" << 'EOF'
{
  "papers": {},
  "last_updated": null
}
EOF

# 创建运行脚本
cat > "$INSTALL_DIR/run.sh" << 'EOF'
#!/bin/bash
KEYWORDS="${1:-LLM reasoning}"
echo "📚 搜索论文: $KEYWORDS"
cd ~/paper-daily
claude --print "/paper-daily $KEYWORDS"
EOF
chmod +x "$INSTALL_DIR/run.sh"

success "配置文件已就绪"

# ============================================
# Step 4: 初始化 Git 仓库
# ============================================
info "初始化 Git 仓库..."

cd "$INSTALL_DIR"

if [[ ! -d ".git" ]]; then
    git init

    # 创建 .gitignore
    cat > .gitignore << 'EOF'
.DS_Store
*.log
EOF

    git add .
    git commit -m "Initial commit"
fi

success "Git 仓库已初始化"

# ============================================
# Step 5: GitHub 设置 (可选)
# ============================================
echo ""
read -p "是否要创建 GitHub 仓库并推送? (y/n): " create_repo

if [[ "$create_repo" == "y" || "$create_repo" == "Y" ]]; then
    # 检查 gh 登录状态
    if ! gh auth status &>/dev/null; then
        info "请先登录 GitHub CLI..."
        gh auth login
    fi

    read -p "仓库名称 (默认: paper-daily): " repo_name
    repo_name=${repo_name:-paper-daily}

    read -p "公开仓库? (y/n, 默认: y): " is_public
    is_public=${is_public:-y}

    if [[ "$is_public" == "y" || "$is_public" == "Y" ]]; then
        visibility="--public"
    else
        visibility="--private"
    fi

    gh repo create "$repo_name" $visibility --source=. --push 2>/dev/null || {
        warning "仓库可能已存在，尝试推送..."
        git remote add origin "https://github.com/$(gh api user -q .login)/$repo_name.git" 2>/dev/null || true
        git push -u origin main 2>/dev/null || git push -u origin master
    }

    success "GitHub 仓库已创建"
fi

# ============================================
# Step 6: 设置定时任务 (macOS)
# ============================================
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo ""
    read -p "是否设置每日自动运行? (y/n): " setup_schedule

    if [[ "$setup_schedule" == "y" || "$setup_schedule" == "Y" ]]; then
        read -p "每天几点搜索新论文? (0-23, 默认: 9): " search_hour
        search_hour=${search_hour:-9}

        read -p "每天几点更新引用数? (0-23, 默认: 20): " update_hour
        update_hour=${update_hour:-20}

        read -p "默认搜索关键词 (默认: LLM reasoning): " default_keywords
        default_keywords=${default_keywords:-LLM reasoning}

        CLAUDE_PATH=$(which claude)

        # 创建搜索任务
        cat > "$HOME/Library/LaunchAgents/com.paper-daily.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.paper-daily</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>-c</string>
        <string>cd $INSTALL_DIR &amp;&amp; $CLAUDE_PATH --print "/paper-daily $default_keywords"</string>
    </array>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>$search_hour</integer>
        <key>Minute</key>
        <integer>0</integer>
    </dict>
    <key>StandardOutPath</key>
    <string>/tmp/paper-daily.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/paper-daily.error.log</string>
    <key>EnvironmentVariables</key>
    <dict>
        <key>PATH</key>
        <string>/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin</string>
    </dict>
</dict>
</plist>
EOF

        # 创建更新任务
        cat > "$HOME/Library/LaunchAgents/com.paper-daily-update.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.paper-daily-update</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>-c</string>
        <string>cd $INSTALL_DIR &amp;&amp; $CLAUDE_PATH --print "/paper-daily --update"</string>
    </array>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>$update_hour</integer>
        <key>Minute</key>
        <integer>0</integer>
    </dict>
    <key>StandardOutPath</key>
    <string>/tmp/paper-daily-update.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/paper-daily-update.error.log</string>
    <key>EnvironmentVariables</key>
    <dict>
        <key>PATH</key>
        <string>/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin</string>
    </dict>
</dict>
</plist>
EOF

        # 加载定时任务
        launchctl unload "$HOME/Library/LaunchAgents/com.paper-daily.plist" 2>/dev/null || true
        launchctl unload "$HOME/Library/LaunchAgents/com.paper-daily-update.plist" 2>/dev/null || true
        launchctl load "$HOME/Library/LaunchAgents/com.paper-daily.plist"
        launchctl load "$HOME/Library/LaunchAgents/com.paper-daily-update.plist"

        success "定时任务已设置"
        echo "  - 每天 ${search_hour}:00 搜索新论文"
        echo "  - 每天 ${update_hour}:00 更新引用数"
    fi
fi

# ============================================
# 完成
# ============================================
echo ""
echo "╔════════════════════════════════════════════╗"
echo "║     ✅ 安装完成!                           ║"
echo "╚════════════════════════════════════════════╝"
echo ""
echo "📁 安装位置: $INSTALL_DIR"
echo "📁 Skill 位置: $SKILL_DIR"
echo ""
echo "🚀 快速开始:"
echo "   claude \"/paper-daily LLM agents\"      # 搜索 LLM agents 论文"
echo "   claude \"/paper-daily --update\"        # 更新引用数"
echo "   claude \"/paper-daily --report\"        # 生成报告"
echo ""
echo "📝 修改配置: $INSTALL_DIR/config.json"
echo "📊 查看日志: cat /tmp/paper-daily.log"
echo ""
echo "更多信息请访问: https://github.com/Su-LAN/paper-daily"
echo ""
