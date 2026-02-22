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

### 💻 Software-Entwicklung (jeffallan)

<details>
<summary>65 Skills anzeigen – Sprachen, Frameworks, DevOps, AI/ML, Security</summary>

**Sprachen & Frameworks**

| Skill | Kurzbeschreibung |
|-------|-----------------|
| [python-pro](skills/python-pro/SKILL.md) | Python 3.11+ mit Type Safety, Async, Testing |
| [typescript-pro](skills/typescript-pro/SKILL.md) | TypeScript mit Advanced Types, Generics, Decorators |
| [javascript-pro](skills/javascript-pro/SKILL.md) | JavaScript ES2023+, Async Patterns, Performance |
| [react-expert](skills/react-expert/SKILL.md) | React 18+, Hooks, State Management, Performance |
| [react-native-expert](skills/react-native-expert/SKILL.md) | Cross-Platform Mobile mit React Native / Expo |
| [nextjs-developer](skills/nextjs-developer/SKILL.md) | Next.js 14+, App Router, Server Components |
| [vue-expert](skills/vue-expert/SKILL.md) | Vue 3, Composition API, Nuxt 3 (TypeScript) |
| [vue-expert-js](skills/vue-expert-js/SKILL.md) | Vue 3, Composition API, Nuxt 3 (JavaScript) |
| [angular-architect](skills/angular-architect/SKILL.md) | Angular 17+, Standalone Components, Signals |
| [golang-pro](skills/golang-pro/SKILL.md) | Go mit Concurrency, Microservices, Performance |
| [rust-engineer](skills/rust-engineer/SKILL.md) | Rust, Memory Safety, Systems Programming |
| [java-architect](skills/java-architect/SKILL.md) | Java mit Spring Boot 3.x, Microservices |
| [kotlin-specialist](skills/kotlin-specialist/SKILL.md) | Kotlin Coroutines, Multiplatform, Android |
| [swift-expert](skills/swift-expert/SKILL.md) | Swift 5.9+, SwiftUI, iOS/macOS |
| [cpp-pro](skills/cpp-pro/SKILL.md) | C++20/23, Templates, Memory Management |
| [csharp-developer](skills/csharp-developer/SKILL.md) | C# .NET 8+, ASP.NET Core, Blazor |
| [dotnet-core-expert](skills/dotnet-core-expert/SKILL.md) | .NET 8, Minimal APIs, Clean Architecture |
| [php-pro](skills/php-pro/SKILL.md) | PHP 8.3+, Laravel, Symfony |
| [flutter-expert](skills/flutter-expert/SKILL.md) | Flutter 3+, Dart, Cross-Platform |

**Web-Frameworks & APIs**

| Skill | Kurzbeschreibung |
|-------|-----------------|
| [fastapi-expert](skills/fastapi-expert/SKILL.md) | FastAPI, Pydantic V2, Async Python APIs |
| [django-expert](skills/django-expert/SKILL.md) | Django, Django REST Framework |
| [rails-expert](skills/rails-expert/SKILL.md) | Rails 7+, Hotwire, Real-time Features |
| [laravel-specialist](skills/laravel-specialist/SKILL.md) | Laravel 10+, Eloquent, API Resources |
| [nestjs-expert](skills/nestjs-expert/SKILL.md) | NestJS, Dependency Injection, Microservices |
| [spring-boot-engineer](skills/spring-boot-engineer/SKILL.md) | Spring Boot 3.x, Reactive Java |
| [graphql-architect](skills/graphql-architect/SKILL.md) | GraphQL Schemas, Apollo Federation |
| [api-designer](skills/api-designer/SKILL.md) | REST/GraphQL Design, OpenAPI Specs |
| [websocket-engineer](skills/websocket-engineer/SKILL.md) | Real-Time mit WebSockets / Socket.IO |

**Daten & Datenbanken**

| Skill | Kurzbeschreibung |
|-------|-----------------|
| [sql-pro](skills/sql-pro/SKILL.md) | SQL-Optimierung, Schema-Design, Query Tuning |
| [postgres-pro](skills/postgres-pro/SKILL.md) | PostgreSQL, Replication, Advanced Indexing |
| [database-optimizer](skills/database-optimizer/SKILL.md) | Query-Analyse, Execution Plans, Performance |
| [pandas-pro](skills/pandas-pro/SKILL.md) | Pandas DataFrames, Cleaning, Aggregation |
| [spark-engineer](skills/spark-engineer/SKILL.md) | Apache Spark, Distributed Data Processing |

**AI / ML**

| Skill | Kurzbeschreibung |
|-------|-----------------|
| [ml-pipeline](skills/ml-pipeline/SKILL.md) | ML Pipelines, Training Workflows, Automation |
| [fine-tuning-expert](skills/fine-tuning-expert/SKILL.md) | LLM Fine-Tuning, Custom Model Training |
| [rag-architect](skills/rag-architect/SKILL.md) | RAG Systeme, Vector Databases, Knowledge AI |
| [prompt-engineer](skills/prompt-engineer/SKILL.md) | Prompt Design, LLM Optimization, Evals |
| [mcp-developer](skills/mcp-developer/SKILL.md) | MCP Server/Client für AI-Integrationen |

**DevOps & Cloud & Infrastruktur**

| Skill | Kurzbeschreibung |
|-------|-----------------|
| [devops-engineer](skills/devops-engineer/SKILL.md) | CI/CD, Containerisierung, Infra Management |
| [cloud-architect](skills/cloud-architect/SKILL.md) | Cloud Architecture, Migrations, Multi-Cloud |
| [kubernetes-specialist](skills/kubernetes-specialist/SKILL.md) | Kubernetes Workloads, Cluster Config |
| [terraform-engineer](skills/terraform-engineer/SKILL.md) | Infrastructure as Code, AWS/Azure/GCP |
| [monitoring-expert](skills/monitoring-expert/SKILL.md) | Monitoring, Logging, Metrics, Tracing |
| [sre-engineer](skills/sre-engineer/SKILL.md) | SLIs/SLOs, Error Budgets, Reliability |
| [microservices-architect](skills/microservices-architect/SKILL.md) | Distributed Systems, Service Decomposition |

**Security**

| Skill | Kurzbeschreibung |
|-------|-----------------|
| [security-reviewer](skills/security-reviewer/SKILL.md) | Security Audits, Vulnerability Reviews |
| [secure-code-guardian](skills/secure-code-guardian/SKILL.md) | Auth/Authz, Input Security, OWASP |
| [chaos-engineer](skills/chaos-engineer/SKILL.md) | Chaos Experiments, Failure Injection |

**Testing & Qualität**

| Skill | Kurzbeschreibung |
|-------|-----------------|
| [test-master](skills/test-master/SKILL.md) | Test Strategies, Automation Frameworks |
| [playwright-expert](skills/playwright-expert/SKILL.md) | E2E Tests mit Playwright |
| [code-reviewer](skills/code-reviewer/SKILL.md) | Code Quality Audits, PR Reviews |
| [debugging-wizard](skills/debugging-wizard/SKILL.md) | Error Analysis, Stack Traces, Root Cause |

**Architektur & Spezial**

| Skill | Kurzbeschreibung |
|-------|-----------------|
| [architecture-designer](skills/architecture-designer/SKILL.md) | System Architecture Design & Review |
| [fullstack-guardian](skills/fullstack-guardian/SKILL.md) | Feature-Implementierung über Frontend + Backend |
| [legacy-modernizer](skills/legacy-modernizer/SKILL.md) | Legacy-System-Migration und Modernisierung |
| [embedded-systems](skills/embedded-systems/SKILL.md) | Firmware, Microcontroller, RTOS |
| [game-developer](skills/game-developer/SKILL.md) | Game Systems, Unity/Unreal |
| [cli-developer](skills/cli-developer/SKILL.md) | CLI Tools, Argument Parsing, TUI |
| [code-documenter](skills/code-documenter/SKILL.md) | Docstrings, API Docs, Documentation |
| [feature-forge](skills/feature-forge/SKILL.md) | Feature Definition, Requirements, Specs |
| [spec-miner](skills/spec-miner/SKILL.md) | Legacy-System-Dokumentation aus Code extrahieren |
| [the-fool](skills/the-fool/SKILL.md) | Devil's Advocate: Ideen und Pläne kritisch hinterfragen |

**Weitere Plattformen**

| Skill | Kurzbeschreibung |
|-------|-----------------|
| [atlassian-mcp](skills/atlassian-mcp/SKILL.md) | Jira, Confluence über MCP |
| [salesforce-developer](skills/salesforce-developer/SKILL.md) | Salesforce, Apex, Lightning Web Components |
| [shopify-expert](skills/shopify-expert/SKILL.md) | Shopify Themes, Apps, Storefront |
| [wordpress-pro](skills/wordpress-pro/SKILL.md) | WordPress Themes, Plugins, Gutenberg |

</details>

---

## Sources

Skills adapted from:
- [OctagonAI/skills](https://github.com/OctagonAI/skills)
- [vercel-labs/skills](https://github.com/vercel-labs/skills)
- [traderspost/pinescript-agents](https://github.com/traderspost/pinescript-agents)
- [tradermonty/claude-trading-skills](https://github.com/tradermonty/claude-trading-skills)
- [jeffallan/claude-skills](https://github.com/jeffallan/claude-skills)
