---
name: skill-manager
description: Routing-Skill für die ai_skills-Library. IMMER verwenden bei Anfragen zu Forex, Aktien, Marktdaten, Rohstoffen, Analysten-Ratings, Marktkapitalisierung oder Sektor-/Branchenanalyse – auch wenn der Nutzer keinen Skill explizit nennt. Wählt automatisch den passendsten Skill aus oder präsentiert Optionen bei Mehrdeutigkeit.
---

# Skill Manager

Ein Routing-Layer für deine persönliche ai_skills-Library. Analysiert die Nutzeranfrage und wählt automatisch den passenden Skill – oder präsentiert Optionen, wenn mehrere infrage kommen.

---

## Routing-Workflow

### Schritt 1: Anfrage verstehen

Lies die Anfrage und extrahiere:
- **Primäres Ziel**: Was soll erreicht werden?
- **Domain-Keywords**: Forex, Aktie, Marktkapitalisierung, Rohstoff, Analyst, Sektor, Branche, Index, …
- **Datentyp**: Echtzeit-Quote vs. historische Daten vs. Katalog/Liste vs. Analyse-Report
- **Scope**: Einzelunternehmen vs. Batch, Einzelkennzahl vs. Gesamtanalyse

### Schritt 2: Gegen Registry abgleichen

Vergleiche die extrahierten Merkmale mit dem [Skill Registry](#skill-registry) weiter unten.

Vergib ein **Konfidenz-Level**:
- **Hoch (>80%)**: Ein Skill passt eindeutig → sofort ausführen
- **Mittel (50–80%)**: 2–3 Skills kämen infrage → Optionen präsentieren
- **Niedrig (<50%)**: Kein klarer Match → nachfragen oder nächstbesten vorschlagen

### Schritt 3: Routing-Entscheidung

**Hohe Konfidenz → Auto-Route**

Lade den passenden Skill und führe ihn aus. Informiere den Nutzer kurz:
> "Ich verwende den `[skill-name]`-Skill dafür. [Ein Satz Begründung.]"

**Mittlere Konfidenz → Optionen präsentieren**

Liste 2–3 Kandidaten mit je einer Zeile Erklärung:
> "Dafür kommen mehrere Skills infrage:
> 1. `stock-quote` – für den aktuellen Kurs inkl. Kennzahlen
> 2. `stock-performance` – wenn du den Preisverlauf über Zeit willst
> Welcher passt besser, oder soll ich mit #1 starten?"

**Niedrige Konfidenz → Klären**

Wenn kein Skill sinnvoll passt: erkläre kurz was die Library abdeckt und frage nach dem genauen Ziel.

### Schritt 4: Skill laden und ausführen

Sobald ein Skill gewählt ist, lies seine `SKILL.md` aus `skills/<skill-name>/SKILL.md` und folge seinen Anweisungen, um die Aufgabe zu erledigen.

---

## Skill Registry

> Alle Skills benötigen den **Octagon MCP**-Server, konfiguriert im AI-Agent.

### 💱 Forex

| Skill | Am besten für | Trigger-Begriffe |
|-------|--------------|-----------------|
| `forex-list` | Währungspaare auflisten, Forex-Marktstruktur verstehen | "Währungspaare", "forex", "FX", "EUR/USD", "Majors", "Exotics" |

### 📊 Aktienkurse & Performance

| Skill | Am besten für | Trigger-Begriffe |
|-------|--------------|-----------------|
| `stock-quote` | Aktueller Kurs + Kernkennzahlen für eine Aktie | "Kurs", "Preis", "Quote", "was kostet X gerade", "52-Wochen-Hoch" |
| `stock-performance` | Preistrend über Zeit, historische Schlusskurse | "Performance", "wie hat sich X entwickelt", "Preisverlauf", "Volumen-Trend" |
| `stock-price-change` | Renditen über mehrere Zeiträume | "Rendite", "wie viel hat X gewonnen/verloren", "Momentum", "1Y-Return" |
| `stock-historical-index` | Vollständige historische Daten für Markt-Indizes | "S&P 500 Historie", "Index-Performance", "Markt-Trend über Jahre" |
| `stock-grades` | Analysten-Upgrades/Downgrades | "Analysten-Rating", "Upgrade", "Downgrade", "institutionelle Einschätzung" |

### 💰 Marktkapitalisierung

| Skill | Am besten für | Trigger-Begriffe |
|-------|--------------|-----------------|
| `company-market-cap` | Marktkapitalisierung eines einzelnen Unternehmens | "Marktkapitalisierung von X", "wie groß ist X", "Bewertung von X" |
| `batch-market-cap` | Marktkapitalisierungen mehrerer Unternehmen | "Marktkapitalisierungen vergleichen", "Peer-Bewertung", mehrere Ticker |
| `historical-market-cap` | Marktkapitalisierung über Zeit | "Marktkapitalisierungs-Historie", "wie hat sich Xs Bewertung verändert" |

### 🎯 Analysten-Kursziele & Ratings

| Skill | Am besten für | Trigger-Begriffe |
|-------|--------------|-----------------|
| `price-target-summary` | Vollständige Kursziel-Aufschlüsselung der Analysten | "Kursziel", "Analysten-Prognose", "Upside-Potenzial", "wo sehen Analysten X" |
| `price-target-consensus` | Durchschnitt/Median/Hoch/Tief der Kursziele | "Konsens-Kursziel", "durchschnittliches Analysten-Ziel", "Kursziel-Spanne" |

### 🏭 Sektor- & Branchenanalyse

| Skill | Am besten für | Trigger-Begriffe |
|-------|--------------|-----------------|
| `sector-pe-ratios` | KGV nach Sektor | "Sektor-KGV", "Sektor-Bewertung", "ist X teuer vs. Sektor" |
| `industry-pe-ratios` | KGV nach spezifischer Branche | "Branchen-KGV", "Nischen-Bewertung", spezifische Branchen-Vergleiche |
| `sector-performance-snapshot` | Umsatz, EBITDA, Marktkapitalisierung nach Sektor | "Sektor-Überblick", "Sektor-Kennzahlen", "Sektor-Finanzen" |
| `industry-performance-snapshot` | Tägliche Kursbewegungen nach Branche | "Branchenbewegung heute", "tägliche Branchen-Performance" |

### 🛢️ Rohstoffe

| Skill | Am besten für | Trigger-Begriffe |
|-------|--------------|-----------------|
| `commodities-list` | Vollständige Liste handelbarer Rohstoffe | "welche Rohstoffe kann ich handeln", "Rohstoff-Katalog", "Rohstoff-Ticker" |
| `commodities-quote` | Aktueller Preis für Gold, Öl, etc. | "Goldpreis", "Ölpreis", "Rohstoff-Quote", "GCUSD", "CLUSD", "Silberpreis" |

### 📈 Master / Orchestrierung

| Skill | Am besten für | Trigger-Begriffe |
|-------|--------------|-----------------|
| `market-analyst-master` | Umfassende Multi-Perspektiven-Aktienanalyse | "vollständige Analyse von X", "Aktien-Report", "alles über X", "recherchiere X" |

### 📰 Trading & Marktanalyse

| Skill | Am besten für | Trigger-Begriffe |
|-------|--------------|-----------------|
| `technical-analyst` | Chart-Analyse (Trend, S/R, Szenarien) anhand von Chart-Bildern | "analysiere diesen Chart", "Trendanalyse", "Support/Resistance", Chart-Bild, "was siehst du im Chart" |
| `options-strategy-advisor` | Options-Strategien berechnen und simulieren | "Covered Call", "Iron Condor", "Put-Spread", "Options-Strategie", "Greeks", "Earnings Play" |
| `market-news-analyst` | Aktuelle Markt-News analysieren und einordnen | "was ist passiert", "FOMC", "ECB", "BOJ", "Markt-News", "Geopolitik", "Earnings letzte Woche" |

### 🌲 Pine Script (TradingView)

| Skill | Am besten für | Trigger-Begriffe |
|-------|--------------|-----------------|
| `pine-manager` | Komplexe Pine-Script-Projekte planen und koordinieren | "baue ein komplettes Trading-System", "Pine-Script-Projekt", mehrere Features gleichzeitig |
| `pine-visualizer` | Trading-Idee in Komponenten zerlegen, YouTube-Video analysieren | "wie würde ich X bauen", "zerlege diese Strategie", YouTube-URL, Konzeptfragen |
| `pine-developer` | Pine-Script-Code schreiben (Indikatoren, Strategien) | "schreibe einen Pine-Script", "erstelle einen Indikator", "implementiere", "code mir" |
| `pine-debugger` | Fehler in Pine-Script finden und beheben | "debug", "Fehler", "funktioniert nicht", "falsche Werte", "fix my script" |
| `pine-backtester` | Backtesting-Logik und Performance-Metriken hinzufügen | "backtest", "Win-Rate", "Drawdown", "Performance-Metriken", "Equity-Kurve" |
| `pine-optimizer` | Script schneller, schöner oder nutzerfreundlicher machen | "optimiere", "verbessere", "schneller", "bessere UI", "Inputs organisieren" |
| `pine-publisher` | Script für TradingView-Community vorbereiten | "veröffentlichen", "publish", "House Rules", "Dokumentation", "release" |

### 💻 Software-Entwicklung (65 Skills)

Bei Entwicklungsaufgaben direkt den passenden Sprach-/Framework-Skill laden. Mapping:

| Trigger | → Skill |
|---------|---------|
| Python | `python-pro` | TypeScript | `typescript-pro` | JavaScript | `javascript-pro` |
| React | `react-expert` | Next.js | `nextjs-developer` | Vue | `vue-expert` |
| Angular | `angular-architect` | Go | `golang-pro` | Rust | `rust-engineer` |
| Java/Spring | `java-architect` | Kotlin | `kotlin-specialist` | Swift/iOS | `swift-expert` |
| C++ | `cpp-pro` | C# / .NET | `csharp-developer` | PHP | `php-pro` |
| Flutter | `flutter-expert` | FastAPI | `fastapi-expert` | Django | `django-expert` |
| Rails | `rails-expert` | Laravel | `laravel-specialist` | NestJS | `nestjs-expert` |
| GraphQL | `graphql-architect` | SQL | `sql-pro` | PostgreSQL | `postgres-pro` |
| Pandas / Daten | `pandas-pro` | Spark | `spark-engineer` | ML Pipeline | `ml-pipeline` |
| LLM Fine-Tuning | `fine-tuning-expert` | RAG | `rag-architect` | Prompts | `prompt-engineer` |
| MCP Server | `mcp-developer` | DevOps / CI-CD | `devops-engineer` | Cloud | `cloud-architect` |
| Kubernetes | `kubernetes-specialist` | Terraform | `terraform-engineer` | Monitoring | `monitoring-expert` |
| Security Audit | `security-reviewer` | Auth / OWASP | `secure-code-guardian` | Chaos | `chaos-engineer` |
| Tests / E2E | `test-master` | Playwright | `playwright-expert` | Code Review | `code-reviewer` |
| Debugging | `debugging-wizard` | Architektur | `architecture-designer` | Microservices | `microservices-architect` |
| Legacy | `legacy-modernizer` | Embedded | `embedded-systems` | CLI | `cli-developer` |
| Docs | `code-documenter` | Features/Specs | `feature-forge` | Ideen challengen | `the-fool` |
| Jira/Confluence | `atlassian-mcp` | Salesforce | `salesforce-developer` | Shopify | `shopify-expert` |
| WordPress | `wordpress-pro` | Game Dev | `game-developer` | WebSocket | `websocket-engineer` |

### 🔍 Skill-Discovery

| Skill | Am besten für | Trigger-Begriffe |
|-------|--------------|-----------------|
| `find-skills` | Neue Skills aus dem skills.sh-Ökosystem finden und installieren | "gibt es einen Skill für X", "ich brauche Hilfe mit Y", "Library erweitern", "npx skills find" |

---

## Schnell-Routing (Direkt-Zuordnung)

Diese Muster führen ohne Abwägung direkt zu einem Skill:

| Anfrage-Muster | → Skill |
|---------------|---------|
| Einzelner Ticker + "Kurs" / "Preis" / "Quote" | `stock-quote` |
| Mehrere Ticker + "vergleichen" | `batch-market-cap` oder `stock-performance` |
| "Analysten" + "Kursziel" | `price-target-summary` |
| "Vollständige Analyse" / "alles über X" | `market-analyst-master` |
| "Währungspaar" / "Forex" / "EUR" / "GBP/USD" | `forex-list` |
| "Gold" / "Öl" / "Silber" / "Rohstoff" + "Preis" | `commodities-quote` |
| "Sektor" + "KGV" / "Bewertung" | `sector-pe-ratios` |
| "Upgrade" / "Downgrade" / "Rating-Änderung" | `stock-grades` |
| "Marktkapitalisierung" + einzelne Firma | `company-market-cap` |
| "Marktkapitalisierung" + mehrere Firmen | `batch-market-cap` |
| Chart-Bild + "analysiere" / "was siehst du" / "Trend" | `technical-analyst` |
| "Options" + "Strategie" / "Covered Call" / "Greeks" / "Spread" | `options-strategy-advisor` |
| "News" + "Markt" / "FOMC" / "ECB" / "was ist passiert" | `market-news-analyst` |
| "Pine Script" + "schreiben" / "erstellen" / "Indikator" | `pine-developer` |
| "Pine Script" + "Fehler" / "debug" / "funktioniert nicht" | `pine-debugger` |
| "Pine Script" + "backtest" / "Win-Rate" / "Drawdown" | `pine-backtester` |
| "Pine Script" + "optimiere" / "verbessere" / "UI" | `pine-optimizer` |
| "Pine Script" + "veröffentlichen" / "publish" | `pine-publisher` |
| "Trading-System" / komplexes Projekt + mehrere Features | `pine-manager` |
| YouTube-URL + Trading / Indikator-Idee | `pine-visualizer` |

---

## Registry aktuell halten

Wenn neue Skills zu `skills/` hinzugefügt werden, die Registry-Tabelle oben ergänzen:
1. Skill-Name (als `code span`)
2. Wofür er am besten geeignet ist (eine Zeile)
3. Typische Trigger-Begriffe

So bleibt das Routing akkurat wenn die Library wächst.
