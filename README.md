# 📚 Paper Daily

> 每日论文速递 - 基于 Claude Code 的学术论文自动追踪工具

自动搜索顶级会议/期刊的最新论文，生成结构化总结，跟踪引用数变化，并同步到 GitHub。

## ✨ 功能特性

- 🔍 **智能搜索** - 从 arXiv、Semantic Scholar 搜索最新论文
- 🏆 **顶会筛选** - 只关注 CCF-A / CORE A* 级别会议和期刊
- 📊 **引用追踪** - 每日更新引用数，记录增长趋势
- 🧠 **论文记忆** - 避免重复推荐，持续追踪关注的论文
- 📝 **结构化总结** - 自动生成贡献、方法、实验、结论的摘要
- 🔄 **自动同步** - 定时运行，自动推送到 GitHub
- ⏰ **定时任务** - macOS LaunchAgent 支持开机自启

## 🚀 快速安装

### 一键安装 (推荐)

```bash
curl -fsSL https://raw.githubusercontent.com/Su-LAN/paper-daily/main/install.sh | bash
```

### 手动安装

```bash
# 1. 克隆仓库
git clone https://github.com/Su-LAN/paper-daily.git
cd paper-daily

# 2. 运行安装脚本
./install.sh
```

## 📋 前置要求

安装脚本会自动检查并安装以下依赖：

| 依赖 | 用途 | 安装方式 |
|------|------|---------|
| [Homebrew](https://brew.sh/) | macOS 包管理器 | 自动安装 |
| [Git](https://git-scm.com/) | 版本控制 | `brew install git` |
| [GitHub CLI](https://cli.github.com/) | GitHub 操作 | `brew install gh` |
| [Claude Code](https://claude.ai/download) | AI 助手 | 见下方说明 |

### 安装 Claude Code

**方式一：官网下载 (推荐)**
1. 访问 https://claude.ai/download
2. 下载并安装 Claude Code
3. 打开终端运行 `claude` 完成登录

**方式二：npm 安装**
```bash
npm install -g @anthropic-ai/claude-code
claude  # 首次运行需要登录
```

**方式三：Homebrew**
```bash
brew install claude-code
claude  # 首次运行需要登录
```

## 📖 使用方法

### 搜索新论文

```bash
# 搜索 LLM 相关论文
claude "/paper-daily LLM agents"

# 搜索多模态论文
claude "/paper-daily multimodal vision"

# 按引用数排序
claude "/paper-daily transformer --sort=citations"

# 获取更多论文
claude "/paper-daily NLP --count=5"
```

### 更新引用数

```bash
# 更新所有已追踪论文的引用数
claude "/paper-daily --update"
```

### 生成报告

```bash
# 生成引用增长报告
claude "/paper-daily --report"
```

### 使用快捷脚本

```bash
# 使用 run.sh
~/paper-daily/run.sh "code generation"
```

## ⚙️ 配置

编辑 `~/paper-daily/config.json`:

```json
{
  "default_keywords": "LLM reasoning",
  "paper_count": 3,
  "sort_by": "relevance",
  "venue_filter": {
    "enabled": true,
    "levels": ["CCF-A", "CORE-A*", "CORE-A"]
  },
  "citation_tracking": {
    "enabled": true,
    "update_existing": true
  }
}
```

| 配置项 | 可选值 | 说明 |
|--------|--------|------|
| `default_keywords` | 任意字符串 | 默认搜索关键词 |
| `paper_count` | 1-10 | 每次搜索的论文数量 |
| `sort_by` | `relevance` / `date` / `citations` | 排序方式 |
| `venue_filter.levels` | CCF-A, CORE-A*, CORE-A | 会议级别筛选 |

## ⏰ 定时任务

安装时可选择设置定时任务：

| 任务 | 默认时间 | 功能 |
|------|---------|------|
| 论文搜索 | 每天 9:00 | 搜索新论文并推送 |
| 引用更新 | 每天 20:00 | 更新所有论文引用数 |

### 管理定时任务

```bash
# 查看状态
launchctl list | grep paper-daily

# 手动触发
launchctl start com.paper-daily
launchctl start com.paper-daily-update

# 查看日志
cat /tmp/paper-daily.log
cat /tmp/paper-daily-update.log

# 停止定时任务
launchctl unload ~/Library/LaunchAgents/com.paper-daily.plist
launchctl unload ~/Library/LaunchAgents/com.paper-daily-update.plist

# 重新启动
launchctl load ~/Library/LaunchAgents/com.paper-daily.plist
launchctl load ~/Library/LaunchAgents/com.paper-daily-update.plist
```

### 修改定时时间

编辑 plist 文件中的 `StartCalendarInterval`:

```bash
# 编辑搜索任务
nano ~/Library/LaunchAgents/com.paper-daily.plist

# 编辑更新任务
nano ~/Library/LaunchAgents/com.paper-daily-update.plist

# 重新加载
launchctl unload ~/Library/LaunchAgents/com.paper-daily.plist
launchctl load ~/Library/LaunchAgents/com.paper-daily.plist
```

## 🏆 支持的顶级会议

### AI / Machine Learning (CCF-A)
NeurIPS, ICML, ICLR, AAAI, IJCAI

### Computer Vision (CCF-A)
CVPR, ICCV, ECCV

### NLP (CCF-A)
ACL, EMNLP, NAACL

### Information Retrieval (CCF-A)
SIGIR, WWW, KDD

### Systems (CCF-A)
OSDI, SOSP, NSDI

## 📁 目录结构

```
~/paper-daily/
├── papers/                    # 每日论文总结
│   └── YYYY-MM-DD-keywords.md
├── reports/                   # 引用追踪报告
│   └── YYYY-MM-citation-report.md
├── data/
│   ├── papers.json            # 论文记忆 & 引用历史
│   └── venues.json            # 顶会定义
├── config.json                # 配置文件
├── run.sh                     # 快捷运行脚本
├── install.sh                 # 安装脚本
└── uninstall.sh               # 卸载脚本

~/.claude/skills/paper-daily/
└── SKILL.md                   # Claude Code Skill 定义
```

## 📊 输出示例

```markdown
# 📚 每日论文速递 - 2025-01-25

**研究方向**: LLM agents
**筛选条件**: 顶会顶刊 (CCF-A / CORE A*)

---

## 1. Large Language Model Agent: A Survey

**基本信息**
- 作者: Junyu Luo, Weizhi Zhang, et al.
- 发布: 2025-03-27
- 会议/期刊: NeurIPS 2025 (CCF-A)
- 引用数: 45 📈
- arXiv: [2503.21460](https://arxiv.org/abs/2503.21460)

**主要贡献**
提出了一个以方法论为中心的分类体系...

**方法**
研究采用方法论中心的分类法...

**实验**
调研了329篇相关论文...

**结论**
LLM智能体具有目标驱动行为和动态适应能力...
```

## 🗑️ 卸载

```bash
# 运行卸载脚本
~/paper-daily/uninstall.sh

# 或手动卸载
launchctl unload ~/Library/LaunchAgents/com.paper-daily.plist
launchctl unload ~/Library/LaunchAgents/com.paper-daily-update.plist
rm -rf ~/paper-daily
rm -rf ~/.claude/skills/paper-daily
rm ~/Library/LaunchAgents/com.paper-daily*.plist
```

## ❓ 常见问题

### Q: 论文搜索没有结果？
A: 检查网络连接，确保可以访问 arXiv 和 Semantic Scholar。

### Q: 定时任务没有执行？
A:
1. 确保电脑在设定时间处于开机状态
2. 检查 `launchctl list | grep paper-daily`
3. 查看日志 `cat /tmp/paper-daily.error.log`

### Q: 如何修改默认搜索关键词？
A: 编辑 `~/paper-daily/config.json` 中的 `default_keywords`

### Q: 支持 Windows/Linux 吗？
A: 目前定时任务仅支持 macOS。其他系统可以手动运行或使用 cron。

## 📝 License

MIT

## 🤝 Contributing

欢迎提交 Issue 和 Pull Request!

---

Made with ❤️ by Claude Code
