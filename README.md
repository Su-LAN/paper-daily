# Paper Daily

Daily paper digest powered by Claude Code skill.

## Features

- Search latest papers from arXiv
- Summarize contributions, methods, experiments, and conclusions
- Auto-commit and push to GitHub
- Schedule daily runs with macOS LaunchAgent
- Configurable sorting (by relevance or date)

## Structure

```
paper-daily/
├── papers/                    # Daily paper summaries
│   └── YYYY-MM-DD-keywords.md
├── config.json                # Configuration file
├── run.sh                     # Manual run script
└── README.md
```

## Configuration

Edit `config.json` to customize default behavior:

```json
{
  "default_keywords": "LLM reasoning",
  "paper_count": 3,
  "sort_by": "relevance",
  "time_range": "7d"
}
```

| Option | Values | Description |
|--------|--------|-------------|
| `default_keywords` | any string | Default search keywords |
| `paper_count` | 1-10 | Number of papers to summarize |
| `sort_by` | `relevance` / `date` | Sort by relevance or newest first |
| `time_range` | `24h` / `7d` / `30d` | Time range for paper search |

## Usage

### Manual Run

```bash
# Basic usage
claude "/paper-daily LLM reasoning"

# Sort by newest first
claude "/paper-daily LLM agents --sort=date"

# Get more papers
claude "/paper-daily multimodal --count=5"

# Use default keywords from config
claude "/paper-daily"

# Using the run script
~/paper-daily/run.sh "code generation"
```

### Automatic Daily Run

LaunchAgent runs automatically at 9:00 AM daily.

Check logs:
```bash
cat /tmp/paper-daily.log
```

### Modify LaunchAgent Keywords

Edit `~/Library/LaunchAgents/com.paper-daily.plist` and reload:
```bash
launchctl unload ~/Library/LaunchAgents/com.paper-daily.plist
launchctl load ~/Library/LaunchAgents/com.paper-daily.plist
```
