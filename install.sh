#!/bin/bash
# ============================================================
# ai_skills – Claude Code Global Installer (Mac/Linux)
# ============================================================
# Klont dein privates ai_skills-Repo und verlinkt alle Skills
# per Symlink in ~/.claude/skills/ (global verfügbar).
#
# Verwendung:
#   chmod +x install.sh && ./install.sh
#
# Update (nach git push im Repo):
#   ./install.sh          ← führt git pull aus und refresht Links
# ============================================================

set -e

REPO_URL="https://github.com/jdecken79/ai_skills.git"
INSTALL_DIR="$HOME/.local/share/ai_skills"
CLAUDE_SKILLS="$HOME/.claude/skills"

# ── Farben ──────────────────────────────────────────────────
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}╔══════════════════════════════════╗${NC}"
echo -e "${BLUE}║  ai_skills – Claude Code Setup   ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════╝${NC}"
echo ""

# ── 1. Repo klonen oder aktualisieren ───────────────────────
if [ -d "$INSTALL_DIR/.git" ]; then
    echo -e "↻  Repo aktualisieren in $INSTALL_DIR ..."
    git -C "$INSTALL_DIR" pull --ff-only
else
    echo -e "📥 Repo klonen nach $INSTALL_DIR ..."
    echo ""
    echo "   Das Repo ist privat – du brauchst deinen GitHub-Benutzernamen"
    echo "   und einen Personal Access Token (PAT) mit 'Contents: Read' Recht."
    echo "   Token erstellen: github.com → Settings → Developer settings → Fine-grained tokens"
    echo ""
    read -p "   GitHub-Benutzername: " GH_USER
    read -s -p "   Personal Access Token: " GH_TOKEN
    echo ""
    mkdir -p "$(dirname "$INSTALL_DIR")"
    git clone "https://${GH_USER}:${GH_TOKEN}@github.com/jdecken79/ai_skills.git" "$INSTALL_DIR"
    unset GH_TOKEN  # Token sofort aus dem Speicher löschen
fi

echo ""

# ── 2. ~/.claude/skills/ anlegen ────────────────────────────
mkdir -p "$CLAUDE_SKILLS"

# ── 3. Symlinks erstellen / aktualisieren ───────────────────
LINKED=0
UPDATED=0
SKIPPED=0

for skill_dir in "$INSTALL_DIR/skills"/*/; do
    skill_name=$(basename "$skill_dir")
    target="$CLAUDE_SKILLS/$skill_name"

    if [ -L "$target" ]; then
        # Symlink existiert – auf aktuellen Pfad aktualisieren
        current=$(readlink "$target")
        if [ "$current" != "$skill_dir" ]; then
            ln -sf "$skill_dir" "$target"
            ((UPDATED++))
        else
            ((SKIPPED++))
        fi
    elif [ -e "$target" ]; then
        # Echter Ordner (z.B. manuell angelegt) – nicht anfassen
        echo -e "  ${YELLOW}⚠ Übersprungen (kein Symlink):${NC} $skill_name"
        ((SKIPPED++))
    else
        ln -s "$skill_dir" "$target"
        ((LINKED++))
    fi
done

# ── 4. Zusammenfassung ──────────────────────────────────────
TOTAL=$(ls -d "$INSTALL_DIR/skills"/*/ 2>/dev/null | wc -l | tr -d ' ')
echo -e "${GREEN}✓ Fertig!${NC}"
echo ""
echo "  📁 Repo:        $INSTALL_DIR"
echo "  🔗 Skills-Dir:  $CLAUDE_SKILLS"
echo "  ✚ Neu verlinkt: $LINKED"
echo "  ↻ Aktualisiert: $UPDATED"
echo "  ⊘ Übersprungen: $SKIPPED"
echo "  📦 Gesamt:      $TOTAL Skills"
echo ""
echo -e "  ${BLUE}→ Starte Claude Code neu um alle Skills zu laden.${NC}"
echo ""

# ── 5. Update-Kurzbefehl in Shell-Config eintragen (optional) ──
SHELL_RC=""
if [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
fi

if [ -n "$SHELL_RC" ]; then
    ALIAS_LINE="alias skills-update='git -C $INSTALL_DIR pull && $INSTALL_DIR/../$(basename $0)'"
    if ! grep -q "skills-update" "$SHELL_RC" 2>/dev/null; then
        echo "" >> "$SHELL_RC"
        echo "# ai_skills Update-Alias" >> "$SHELL_RC"
        echo "$ALIAS_LINE" >> "$SHELL_RC"
        echo -e "  ${GREEN}✓ Alias 'skills-update' zu $SHELL_RC hinzugefügt${NC}"
        echo "    Nutze 'skills-update' im Terminal um deine Skills jederzeit zu aktualisieren."
    fi
fi
