# ai_skills

Personal Skill Library for Claude Code and others.

Skills follow the [Agent Skills Open Standard](https://github.com/anthropics/agent-skills-open-standard). Each skill lives in its own folder under `skills/` and contains a `SKILL.md` with YAML frontmatter (`name`, `description`) and Markdown instructions.

---

## Skills Overview

### 🧭 Meta-Skills

| Skill | Description |
|-------|-------------|
| [skill-manager](skills/skill-manager/SKILL.md) | Routing-Layer für die Library: analysiert die Anfrage und wählt automatisch den passenden Skill – oder präsentiert Optionen bei Mehrdeutigkeit. Einstiegspunkt für alle Finanzmarkt-Anfragen. |
| [find-skills](skills/find-skills/SKILL.md) | Sucht und installiert Skills aus dem skills.sh-Ökosystem via `npx skills find`. Verwenden wenn der Nutzer nach neuen Fähigkeiten fragt oder die Library erweitern möchte. |

---

### 📈 Market & Forex – Master Skills

| Skill | Description |
|-------|-------------|
| [market-analyst-master](skills/market-analyst-master/SKILL.md) | Comprehensive market analyst skill orchestrating all Octagon market data skills. Use for stock analysis, market reports, valuation comparison, and sector/technical analysis. |

---

### 💱 Forex

| Skill | Description |
|-------|-------------|
| [forex-list](skills/forex-list/SKILL.md) | Retrieve listing of actively traded currency pairs (majors, crosses, exotics) via Octagon MCP. Use for forex market research, pair categorization, and trading opportunity analysis. |

---

### 📊 Stock Data & Quotes

| Skill | Description |
|-------|-------------|
| [stock-quote](skills/stock-quote/SKILL.md) | Retrieve real-time stock quotes via Octagon MCP. Use for current price, day/52-week range, volume, market cap, and moving averages for any publicly traded stock. |
| [stock-performance](skills/stock-performance/SKILL.md) | Retrieve stock price data and performance metrics via Octagon MCP. Use for analyzing closing prices, trading volume, price trends, and historical performance over time. |
| [stock-price-change](skills/stock-price-change/SKILL.md) | Retrieve stock price change stats across multiple time periods via Octagon MCP. Use for short/long-term return analysis, momentum evaluation, and cross-timeframe comparisons. |
| [stock-historical-index](skills/stock-historical-index/SKILL.md) | Retrieve historical end-of-day price data for market indices via Octagon MCP. Use for index performance analysis, market trend tracking, and return calculations. |
| [stock-grades](skills/stock-grades/SKILL.md) | Retrieve latest stock grades and ratings from analysts via Octagon MCP. Use for tracking upgrades, downgrades, rating changes, and institutional sentiment over time. |

---

### 💰 Market Capitalization

| Skill | Description |
|-------|-------------|
| [company-market-cap](skills/company-market-cap/SKILL.md) | Retrieve market capitalization for a single company via Octagon MCP. Use for current market value, valuation context, or size classification of any publicly traded stock. |
| [batch-market-cap](skills/batch-market-cap/SKILL.md) | Retrieve market cap data for multiple companies at once via Octagon MCP. Use for peer valuation comparison, market cap screening, or portfolio size composition analysis. |
| [historical-market-cap](skills/historical-market-cap/SKILL.md) | Retrieve historical market cap data for any stock via Octagon MCP. Use for tracking valuation trends, identifying peak/trough valuations, and historical size comparisons. |

---

### 🎯 Analyst Price Targets & Ratings

| Skill | Description |
|-------|-------------|
| [price-target-summary](skills/price-target-summary/SKILL.md) | Retrieve analyst price target summary for any stock via Octagon MCP. Use for evaluating analyst sentiment, upside/downside potential, and tracking target trends over time. |
| [price-target-consensus](skills/price-target-consensus/SKILL.md) | Retrieve consensus price targets (avg, median, high, low) for any stock via Octagon MCP. Use for evaluating upside/downside potential and measuring analyst agreement. |

---

### 🏭 Sector & Industry Analysis

| Skill | Description |
|-------|-------------|
| [sector-pe-ratios](skills/sector-pe-ratios/SKILL.md) | Retrieve sector P/E ratios via Octagon MCP. Use for comparing company valuations to sector benchmarks and analyzing market-wide valuation trends across exchanges. |
| [industry-pe-ratios](skills/industry-pe-ratios/SKILL.md) | Retrieve industry-specific P/E ratios via Octagon MCP. Use for comparing valuations to industry peers and understanding niche market valuations beyond broad sector averages. |
| [sector-performance-snapshot](skills/sector-performance-snapshot/SKILL.md) | Retrieve sector performance metrics (revenue, EBITDA, net income, market cap) via Octagon MCP. Use for sector-wide financial analysis across companies and exchanges. |
| [industry-performance-snapshot](skills/industry-performance-snapshot/SKILL.md) | Retrieve daily industry performance overview via Octagon MCP. Use for analyzing daily price movements, average changes, and performance trends by specific industry. |

---

### 🛢️ Commodities

| Skill | Description |
|-------|-------------|
| [commodities-list](skills/commodities-list/SKILL.md) | Retrieve full catalog of tradable commodities (energy, metals, agriculture) via Octagon MCP. Use for commodity market research, sector coverage, and market participant analysis. |
| [commodities-quote](skills/commodities-quote/SKILL.md) | Retrieve real-time commodity price quotes via Octagon MCP. Use for current prices, day ranges, moving averages, and tracking metals, energy, and agricultural commodities. |

---

## Prerequisites

All skills in this library require the **[Octagon MCP](https://github.com/OctagonAI/octagon-mcp)** server to be configured in your AI agent (Claude Desktop, Cursor, Windsurf, etc.).

## Adding New Skills

Skills follow this structure:

```
skills/
└── skill-name/
    └── SKILL.md    # YAML frontmatter + Markdown instructions
```

Frontmatter format:

```yaml
---
name: skill-name
description: Klare Beschreibung wann dieser Skill verwendet werden soll (max. 200 Zeichen)
---
```

### 📰 Trading & Marktanalyse

| Skill | Description |
|-------|-------------|
| [technical-analyst](skills/technical-analyst/SKILL.md) | Analysiert Wochenpreis-Charts für Aktien, Indizes, Krypto und Forex. Verwenden wenn Chart-Bilder vorliegen für Trendanalyse, Support/Resistance, Szenarien und Wahrscheinlichkeiten. |
| [options-strategy-advisor](skills/options-strategy-advisor/SKILL.md) | Options-Strategie-Analyse mit Black-Scholes, Greeks, P/L-Simulation und Risikomanagement. Verwenden für Covered Calls, Spreads, Iron Condors, Earnings Plays und Positions-Sizing. ⚠️ 959 Zeilen |
| [market-news-analyst](skills/market-news-analyst/SKILL.md) | Analysiert marktbewegende News der letzten 10 Tage und ihre Auswirkungen auf Aktien und Rohstoffe. Verwenden für FOMC/ECB/BOJ-Reaktionen, Geopolitik-Impacts und Earnings-Analysen. ⚠️ 714 Zeilen |

---

### 🌲 Pine Script (TradingView)

| Skill | Description |
|-------|-------------|
| [pine-manager](skills/pine-manager/SKILL.md) | Orchestriert Pine-Script-Entwicklung für komplexe Projekte und Trading-Systeme. Verwenden wenn mehrere Features koordiniert oder ein vollständiges System gebaut werden soll. |
| [pine-visualizer](skills/pine-visualizer/SKILL.md) | Zerlegt Trading-Ideen in implementierbare Pine-Script-Komponenten. Verwenden für Konzeptanalyse, Strategieplanung oder zum Extrahieren von Ideen aus YouTube-Videos. |
| [pine-developer](skills/pine-developer/SKILL.md) | Schreibt produktionsreifen Pine-Script-v6-Code nach TradingView-Guidelines. Verwenden zum Erstellen von Indikatoren, Strategien oder Pine-Script-Funktionalität. |
| [pine-debugger](skills/pine-debugger/SKILL.md) | Debuggt Pine-Script-Probleme in TradingView. Verwenden bei Fehlern, unerwartetem Verhalten oder wenn Debugging-Tools zu einem Script hinzugefügt werden sollen. |
| [pine-backtester](skills/pine-backtester/SKILL.md) | Backtesting für Pine-Script-Indikatoren und Strategien. Verwenden für Performance-Metriken, Trade-Analyse, Equity-Kurven, Win-Rates und Drawdown-Tracking. |
| [pine-optimizer](skills/pine-optimizer/SKILL.md) | Optimiert Pine-Script für Performance, UX und visuelle Qualität in TradingView. Verwenden um Ladezeit, UI, Inputs oder Visuals zu verbessern. |
| [pine-publisher](skills/pine-publisher/SKILL.md) | Bereitet Pine-Scripts für die Veröffentlichung in TradingViews Community-Library vor. Verwenden für Dokumentation, House-Rules-Compliance und Release-Vorbereitung. |

---

## Sources

Skills adapted from:
- [OctagonAI/skills](https://github.com/OctagonAI/skills)
- [vercel-labs/skills](https://github.com/vercel-labs/skills)
- [traderspost/pinescript-agents](https://github.com/traderspost/pinescript-agents)
- [tradermonty/claude-trading-skills](https://github.com/tradermonty/claude-trading-skills)
