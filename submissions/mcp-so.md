# mcp.so

Two paths. The portfolio playbook used a GitHub issue on `chatmcp/mcpso` for Voydar (issue #4732, open) and SourceFinch (#4731). mcp.so also has a web form at https://mcp.so/submit (type, name, repository URL; a paid $39 option skips review; not needed). Use the issue: it carries the full description and needs only Harry's GitHub account.

## Click-through (Harry)

Run this yourself (it posts publicly as your GitHub account):

```bash
cd ~/dev/common-elements-claude-plugins
gh issue create -R chatmcp/mcpso \
  --title "Submit Remote MCP Server: Common Elements (com.commonelements/data)" \
  --body-file submissions/mcp-so-issue.md
```

Or the form: https://mcp.so/submit, type **Remote Server**, name `Common Elements`, repository `https://github.com/CommonElements/common-elements-claude-plugins` (only after that repo is public).

The body is [`mcp-so-issue.md`](mcp-so-issue.md). Read it as the recipient before posting.
