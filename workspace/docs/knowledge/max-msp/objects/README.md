# Max/MSP Object Reference Database

## docs.json

Symlinked from the project root. Contains specifications for 1,129 Max/MSP objects across four domains:

| Domain | Count | Examples |
|--------|-------|---------|
| Max (control) | 438 | metro, counter, trigger, gate, coll, dict |
| MSP (signal) | 445 | cycle~, svf~, tapin~, tapout~, adsr~, dac~ |
| Jitter (video/matrix) | 209 | jit.matrix, jit.gl.render |
| Max for Live | 37 | live.dial, live.slider |

## Usage

Search with Python:
```python
import json
with open('docs.json') as f:
    docs = json.load(f)
# docs is a dict keyed by category, each containing a list of object dicts
```

Search with jq:
```bash
jq 'to_entries[] | .value[] | select(.name | test("cycle")) | {name, description}' docs.json
```

See `skills/maxmsp-object-reference/SKILL.md` for full search utilities.
