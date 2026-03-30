# maxmsp-mcp

## Project Overview

MCP (Model Context Protocol) server and client for Max/MSP integration. Enables AI agents to create, modify, query, and test Max/MSP patches programmatically through 28 MCP tools.

## Architecture

```
Agent (OpenCode/Claude) <-- MCP --> server.py (FastMCP/Python)
                                       |
                                  Socket.IO (port 5002)
                                       |
                                  max_mcp_node.js (Node bridge)
                                       |
                                  max_mcp.js + max_mcp_v8_add_on.js
                                       |
                                    Max/MSP
```

## Key Components

| Component | Location | Purpose |
|-----------|----------|---------|
| server.py | Root | FastMCP server with 28 tools |
| max_mcp.js | MaxMSP_Agent/ | Max-side message handler (legacy js engine) |
| max_mcp_node.js | MaxMSP_Agent/ | Node.js Socket.IO bridge |
| max_mcp_v8_add_on.js | MaxMSP_Agent/ | v8 engine addon for boxtext, autofit, signal safety, patcher targeting |
| bridge_demo.maxpat | MaxMSP_Agent/ | Clean bridge demo with subpatcher encapsulation |
| docs.json | Root | Max object reference database (1,129 objects) |
| CLAUDE.md | Root | Critical rules for MCP tool usage (Claude Code) |

## MCP Tool Categories (28 tools)

- **Object creation/manipulation**: add_max_object, remove_max_object, connect/disconnect, move_object, recreate_with_args, autofit_existing
- **Object properties**: set_object_attribute, set_message_text, set_number, send_bang, send_messages
- **Query**: get_objects_in_patch, get_objects_in_selected, get_object_attributes, get_object_connections, get_avoid_rect_position, list_all_objects, get_object_doc
- **Subpatcher**: create_subpatcher, enter/exit_subpatcher, get_patcher_context, add_subpatcher_io
- **Safety**: check_signal_safety, encapsulate
- **Patcher targeting**: list_patchers, target_patcher

## Technology Stack

- Python 3.12 with FastMCP (mcp 1.6.0)
- Socket.IO for Max communication
- Node.js bridge for Max integration
- Max/MSP v8 JavaScript engine + legacy js engine

## Current Status

OpenCode integration functional. MCP server works with both OpenCode and Claude Code. Bridge supports multi-patcher targeting via list_patchers/target_patcher.
