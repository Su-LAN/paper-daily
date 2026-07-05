#!/usr/bin/env python3
"""Update citation counts for all papers in data/papers.json via Semantic Scholar batch API."""
import json
import sys
import time
import urllib.request
from datetime import date

DATA = "/Users/lansu/paper-daily/data/papers.json"
TODAY = date.today().isoformat()
BATCH_URL = "https://api.semanticscholar.org/graph/v1/paper/batch?fields=citationCount,title"

with open(DATA) as f:
    db = json.load(f)

papers = db["papers"]
ids = list(papers.keys())
print(f"Total papers: {len(ids)}")

results = {}
CHUNK = 100
for i in range(0, len(ids), CHUNK):
    chunk = ids[i:i + CHUNK]
    body = json.dumps({"ids": [f"ARXIV:{a}" for a in chunk]}).encode()
    req = urllib.request.Request(
        BATCH_URL, data=body,
        headers={"Content-Type": "application/json", "User-Agent": "paper-daily/1.0"},
    )
    for attempt in range(4):
        try:
            with urllib.request.urlopen(req, timeout=60) as resp:
                data = json.load(resp)
            break
        except Exception as e:
            if attempt == 3:
                print(f"Batch {i//CHUNK} failed: {e}", file=sys.stderr)
                data = [None] * len(chunk)
            else:
                time.sleep(3 * (attempt + 1))
    for arxiv_id, item in zip(chunk, data):
        if item and item.get("citationCount") is not None:
            results[arxiv_id] = item["citationCount"]
    time.sleep(1)

updated, unchanged, failed, increases = 0, 0, [], []
for arxiv_id, p in papers.items():
    hist = p["citation_history"]
    if arxiv_id not in results:
        failed.append(arxiv_id)
        continue
    new_count = results[arxiv_id]
    prev = hist[-1]["count"] if hist else 0
    if hist and hist[-1]["date"] == TODAY:
        hist[-1]["count"] = new_count
    else:
        hist.append({"date": TODAY, "count": new_count})
    delta = new_count - prev
    if delta != 0:
        updated += 1
        increases.append((delta, new_count, p["title"], p.get("venue", "")))
    else:
        unchanged += 1

with open(DATA, "w") as f:
    json.dump(db, f, indent=2, ensure_ascii=False)
    f.write("\n")

print(f"Refreshed: {len(results)} | changed: {updated} | unchanged: {unchanged} | failed: {len(failed)}")
if failed:
    print("Failed IDs:", ", ".join(failed))
print("\nTop citation changes:")
for delta, count, title, venue in sorted(increases, reverse=True)[:10]:
    print(f"  {delta:+d} -> {count:4d}  [{venue}] {title[:70]}")
