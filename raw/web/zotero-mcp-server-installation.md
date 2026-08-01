---
source_type: web
source_url: "https://raw.githubusercontent.com/54yyyu/zotero-mcp/566b396cc32227491fddc65f94245bea4b4a0959/README.md"
source_commit: "566b396cc32227491fddc65f94245bea4b4a0959"
title: "Zotero MCP README — installation and client configuration excerpts"
ingested: 2026-07-22
capture_scope: "README lines 75-134 and 227-415 at the pinned commit"
sha256: "32f065027ba39c83766dda1bf5ea3b8cdb70cb032102001cc84cf510418650f0"
---

## 🚀 Quick Install

> **New to the command line?** Try the community-built [Zotero MCP Setup](https://github.com/ehawkin/zotero-mcp-setup) — includes a macOS GUI installer (DMG), one-click install scripts for Mac/Windows, and a step-by-step guide. No Terminal experience needed.

### Default Installation (core tools only)

The base install is lightweight — it includes search, metadata retrieval, annotations, and write operations. No ML/AI dependencies are pulled in.

#### Installing via uv (recommended)

```bash
uv tool install zotero-mcp-server
zotero-mcp setup  # Auto-configure (Claude Desktop supported)
```

#### Installing via pip

```bash
pip install zotero-mcp-server
zotero-mcp setup  # Auto-configure (Claude Desktop supported)
```

#### Installing via pipx

```bash
pipx install zotero-mcp-server
zotero-mcp setup  # Auto-configure (Claude Desktop supported)
```

### Optional Extras

Heavy ML/PDF dependencies are separated into optional extras so the base install stays fast and small:

| Extra | What it adds | Install command |
|-------|-------------|-----------------|
| `semantic` | Semantic search via ChromaDB, sentence-transformers, OpenAI/Gemini embeddings | `pip install "zotero-mcp-server[semantic]"` |
| `pdf` | PDF outline extraction (PyMuPDF) and EPUB annotation support | `pip install "zotero-mcp-server[pdf]"` |
| `scite` | [Scite](https://scite.ai) citation intelligence — tallies and retraction alerts (no account needed) | `pip install "zotero-mcp-server[scite]"` |
| `all` | Everything above | `pip install "zotero-mcp-server[all]"` |

For example, with uv:
```bash
uv tool install "zotero-mcp-server[all]"    # Full install with all features
uv tool install "zotero-mcp-server[semantic]" # Just semantic search
```

If you only need basic library access (search, read, annotate, write), the default install with no extras is all you need.

#### Updating Your Installation

Keep zotero-mcp up to date with the smart update command:

```bash
# Check for updates
zotero-mcp update --check-only

# Update to latest version (preserves all configurations)
zotero-mcp update
```

## 🖥️ Setup & Usage

Full documentation is available at [Zotero MCP docs](https://stevenyuyy.com/zotero-mcp/).

**Requirements**
- Python 3.10+
- Zotero 7+ (for local API with full-text access)
- An MCP-compatible client (e.g., Claude Desktop, ChatGPT Developer Mode, Cherry Studio, Chorus)

**For ChatGPT setup: see the [Getting Started guide](./docs/getting-started.md).**

### Configure Zotero

The Zotero local API must be enabled for the MCP server to work.

In Zotero 9, the local API toggle is under Settings → Advanced → 'Allow other applications on this computer to communicate with Zotero'.

Here is a screenshot:

![Zotero local API](./docs/zotero-local-api.png)

### For Claude Desktop / Claude Code (MCP client)

#### Configuration
After installation, either:

1. **Auto-configure** (recommended):
   ```bash
   zotero-mcp setup
   ```

2. **Manual configuration**:
   For Claude Desktop, add this to `claude_desktop_config.json`.
   For Claude Code, add this to `~/.claude.json`:
   ```json
   {
     "mcpServers": {
       "zotero": {
         "command": "zotero-mcp",
         "env": {
           "ZOTERO_LOCAL": "true",
           "ZOTERO_API_KEY": "YOUR_API_KEY",
           "ZOTERO_LIBRARY_ID": "YOUR_LIBRARY_ID"
         }
       }
     }
   }
   ```

   For **local read-only use**, `ZOTERO_LOCAL: "true"` is all you need — drop the `ZOTERO_API_KEY` and `ZOTERO_LIBRARY_ID` lines entirely.

   The local API is fast but read-only, so the MCP server uses the Zotero web API for write operations.
   
   To enable **write mode**:
   - Keep `ZOTERO_LOCAL: "true"` — with API credentials set, the server runs in hybrid mode (fast local reads, web API writes)
   - Click [here](https://www.zotero.org/settings/security#applications) to generate a Zotero API key and replace `YOUR_API_KEY` with it
   - `ZOTERO_LIBRARY_ID` is your numeric **userID**, shown on that same page (for a group library, use the group's ID and also set `ZOTERO_LIBRARY_TYPE: "group"`).

   > **Important Note**: Environmental variables set in the shell you run `claude` in will override these values.

   > **Tip:** If Claude Desktop reports it can't find the `zotero-mcp` command, use the
   > absolute path instead (run `zotero-mcp setup-info` or `which zotero-mcp` to find it) —
   > GUI apps don't always inherit your shell `PATH`.

#### Usage

1. Start Zotero desktop (make sure local API is enabled in preferences)
2. Launch Claude Desktop / Claude Code
3. For Claude Desktop, access the Zotero-MCP tool through Claude Desktop's tools interface.
For Claude Code, run the `/mcp` command, and make sure the Zotero MCP server is connected.

Example prompts:
- "Search my library for papers on machine learning"
- "Find recent articles I've added about climate change"
- "Summarize the key findings from my paper on quantum computing"
- "Extract all PDF annotations from my paper on neural networks"
- "Search my notes and annotations for mentions of 'reinforcement learning'"
- "Show me papers tagged '#Arm' excluding those with '#Crypt' in my library"
- "Search for papers on operating system with tag '#Arm'"
- "Export the BibTeX citation for papers on machine learning"
- **"Find papers conceptually similar to deep learning in computer vision"** *(semantic search)*
- **"Research that relates to the intersection of AI and healthcare"** *(semantic search)*
- **"Papers that discuss topics similar to this abstract: [paste text]"** *(semantic search)*

### For Autohand Code

After installing Zotero MCP, add a local read-only server with:

```bash
autohand mcp add zotero env ZOTERO_LOCAL=true zotero-mcp
```

Add `--scope project` after `add` to keep the server configuration in the current project. For hybrid or web API access, add the credentials described above to the `env` command. See [Autohand Code](https://github.com/autohandai/code-cli/) for current installation and CLI details.

### For Cherry Studio

#### Configuration
Go to Settings -> MCP Servers -> Edit MCP Configuration, and add the following:

```json
{
  "mcpServers": {
    "zotero": {
      "name": "zotero",
      "type": "stdio",
      "isActive": true,
      "command": "zotero-mcp",
      "args": [],
      "env": {
        "ZOTERO_LOCAL": "true"
      }
    }
  }
}
```
Then click "Save".

Cherry Studio also provides a visual configuration method for general settings and tools selection.

## 🔧 Advanced Configuration

### Using Web API Instead of Local API

For accessing your Zotero library via the web API (useful for remote setups):

```bash
zotero-mcp setup --no-local --api-key YOUR_API_KEY --library-id YOUR_LIBRARY_ID
```

### Environment Variables

**Zotero Connection:**
- `ZOTERO_LOCAL=true`: Use the local Zotero API (default: false)
- `ZOTERO_API_KEY`: Your Zotero API key (for web API)
- `ZOTERO_LIBRARY_ID`: Your Zotero library ID (for web API)
- `ZOTERO_LIBRARY_TYPE`: The type of library (user or group, default: user)
- `ZOTERO_WEBDAV_URL`: Optional WebDAV folder URL for direct attachment downloads in remote mode
- `ZOTERO_WEBDAV_USERNAME`: Optional WebDAV username
- `ZOTERO_WEBDAV_PASSWORD`: Optional WebDAV password

**Semantic Search:**
- `ZOTERO_EMBEDDING_MODEL`: Embedding model to use (default, openai, gemini, ollama)
- `OPENAI_API_KEY`: Your OpenAI API key (for OpenAI embeddings)
- `OPENAI_EMBEDDING_MODEL`: OpenAI model name (text-embedding-3-small, text-embedding-3-large)
- `OPENAI_BASE_URL`: Custom OpenAI endpoint URL (optional, for use with compatible APIs)
- OpenAI Batch API indexing is configured by `zotero-mcp setup` and can be overridden with
  `zotero-mcp update-db --openai-batch` or `--no-openai-batch`
- `GEMINI_API_KEY`: Your Gemini API key (for Gemini embeddings)
- `GEMINI_EMBEDDING_MODEL`: Gemini model name (gemini-embedding-001)
- `GEMINI_BASE_URL`: Custom Gemini endpoint URL (optional, for use with compatible APIs)
- `OLLAMA_EMBEDDING_MODEL`: Ollama embedding model name (qwen3-embedding by default)
- `OLLAMA_BASE_URL`: Ollama server URL (default: http://localhost:11434)
- `ZOTERO_DB_PATH`: Custom `zotero.sqlite` path (optional). When unset, the
  database is located automatically: a data directory configured in Zotero's
  preferences (read from the profile's `prefs.js`) is tried first, then the
  default `~/Zotero` location.

### Command-Line Options

```bash
# Run the server directly
zotero-mcp serve

# Specify transport method
zotero-mcp serve --transport stdio|streamable-http|sse

# Setup and configuration
zotero-mcp setup --help                    # Get help on setup options
zotero-mcp setup --semantic-config-only    # Configure only semantic search
zotero-mcp setup-info                      # Show installation path and config info for MCP clients

# Updates and maintenance
zotero-mcp update                          # Update to latest version
zotero-mcp update --check-only             # Check for updates without installing
zotero-mcp update --force                  # Force update even if up to date

# Semantic search database management
zotero-mcp update-db                       # Update semantic search database (fast, metadata-only)
zotero-mcp update-db --openai-batch        # Submit OpenAI embeddings through Batch API
zotero-mcp update-db --no-openai-batch     # Force realtime OpenAI embeddings for this run
zotero-mcp openai-batch-status             # Check latest OpenAI embedding batch status
zotero-mcp openai-batch-import             # Import completed OpenAI batch embeddings
zotero-mcp update-db --fulltext             # Update with full-text extraction (comprehensive but slower)
zotero-mcp update-db --force-rebuild       # Force complete database rebuild
zotero-mcp update-db --fulltext --force-rebuild  # Rebuild with full-text extraction
zotero-mcp update-db --fulltext --db-path "your_path_to/zotero.sqlite" # Customize your zotero database path
zotero-mcp db-status                       # Show database status and info

# General
