# Paper Daily

Daily paper digest powered by Claude Code skill. Focuses on top-tier venues (CCF-A / CORE A*) with citation tracking.

## Features

- Search papers from top conferences (NeurIPS, ICML, CVPR, ACL, etc.)
- Filter by venue ranking (CCF-A, CORE A*, CORE A)
- Track citation counts over time
- Memory system to avoid duplicate papers
- Generate citation growth reports
- Auto-commit and push to GitHub

## Structure

```
paper-daily/
├── papers/                    # Daily paper summaries
│   └── YYYY-MM-DD-keywords.md
├── reports/                   # Citation tracking reports
│   └── YYYY-MM-citation-report.md
├── data/
│   ├── papers.json            # Paper memory & citation history
│   └── venues.json            # Top venue definitions
├── config.json                # Configuration
├── run.sh                     # Manual run script
└── README.md
```

## Configuration

Edit `config.json`:

```json
{
  "default_keywords": "LLM reasoning",
  "paper_count": 3,
  "sort_by": "relevance",
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
```

| Option | Values | Description |
|--------|--------|-------------|
| `sort_by` | `relevance` / `date` / `citations` | Sorting method |
| `venue_filter.levels` | CCF-A, CORE-A*, CORE-A | Venue rankings to include |
| `citation_tracking.enabled` | true/false | Track citation counts |

## Usage

### Search New Papers

```bash
# Search for LLM papers from top venues
claude "/paper-daily LLM agents"

# Sort by citation count
claude "/paper-daily LLM agents --sort=citations"

# Get more papers
claude "/paper-daily multimodal --count=5"
```

### Update Citations

```bash
# Update citation counts for all tracked papers
claude "/paper-daily --update"
```

### Generate Report

```bash
# Generate citation growth report
claude "/paper-daily --report"
```

### Automatic Daily Run

LaunchAgent runs at 9:00 AM daily.

Check logs:
```bash
cat /tmp/paper-daily.log
```

## Top Venues Tracked

### AI/ML (CCF-A)
NeurIPS, ICML, ICLR, AAAI, IJCAI

### Computer Vision (CCF-A)
CVPR, ICCV, ECCV

### NLP (CCF-A)
ACL, EMNLP, NAACL

### Information Retrieval (CCF-A)
SIGIR, WWW, KDD

## Output Format

Each paper summary includes:
- Title, authors, publication date
- Venue and ranking (e.g., "NeurIPS 2025 (CCF-A)")
- Citation count with tracking
- Contribution, method, experiments, conclusion

## Citation Tracking

The system tracks citation growth over time:
- New citations added to `data/papers.json` daily
- Monthly reports show top growing papers
- Helps identify trending research
