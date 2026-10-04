#!/usr/bin/env bash
# Generate (once) the Ed25519 key that proves Common Elements controls
# commonelements.com to the official MCP Registry, and print the DNS TXT
# record to add. Prints commands; changes nothing outside ~/.config/common-elements.
# The private key never leaves this Mac and is never committed.
set -euo pipefail

K="$HOME/.config/common-elements"
PEM="$K/mcp-registry-ed25519.pem"

mkdir -p "$K" && chmod 700 "$K"
if [ ! -f "$PEM" ]; then
  openssl genpkey -algorithm Ed25519 -out "$PEM"
  chmod 600 "$PEM"
  echo "Generated $PEM"
else
  echo "Using existing $PEM"
fi

PUB=$(openssl pkey -in "$PEM" -pubout -outform DER | tail -c 32 | base64)
TXT="v=MCPv1; k=ed25519; p=$PUB"

cat <<EOF

DNS TXT record for the apex of commonelements.com:

  $TXT

Add it (Vercel DNS, team theschoellergroup):

  vercel dns add commonelements.com @ TXT "$TXT" --scope theschoellergroup

Check propagation:

  dig +short TXT commonelements.com | grep MCPv1

Optional, for the HTTP proof as well: set PROOF_RECORD in
apps/web/app/.well-known/mcp-registry-auth/route.ts (Common Elements app) to the
same value, so the two proofs do not disagree.
EOF
