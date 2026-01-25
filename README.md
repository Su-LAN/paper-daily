# Paper Daily

Daily paper digest powered by Claude Code skill.

## Features

- Search latest papers from arXiv
- Summarize contributions, methods, experiments, and conclusions
- Auto-commit and push to GitHub
- Schedule daily runs with macOS LaunchAgent

## Structure

```
paper-daily/
├── papers/                    # Daily paper summaries
│   └── YYYY-MM-DD-keywords.md
├── run.sh                     # Manual run script
└── README.md
```

## Usage

### Manual Run

```bash
# Using Claude Code skill directly
claude "/paper-daily LLM reasoning"

# Using the run script
~/paper-daily/run.sh "multimodal vision"
~/paper-daily/run.sh "code generation"
```

### Automatic Daily Run

LaunchAgent runs automatically at 9:00 AM daily.

Check logs:
```bash
cat /tmp/paper-daily.log
```

### Modify Default Keywords

Edit `~/Library/LaunchAgents/com.paper-daily.plist` and reload:
```bash
launchctl unload ~/Library/LaunchAgents/com.paper-daily.plist
launchctl load ~/Library/LaunchAgents/com.paper-daily.plist
```
