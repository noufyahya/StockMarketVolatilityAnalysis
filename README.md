# Stock Market Volatility Analysis 📈

![GitHub last commit](https://img.shields.io/github/last-commit/noufyahya/StockMarketVolatilityAnalysis?color=blue)
![GitHub repo size](https://img.shields.io/github/repo-size/noufyahya/StockMarketVolatilityAnalysis?color=green)

This project analyzes stock market volatility using historical price data, statistical models, and visualization techniques to identify trends, risks, and potential trading opportunities.

### 📌 Overview
**Goal:** Quantify and visualize volatility patterns in stock markets (e.g., S&P 500, NASDAQ).

**Methods:** Rolling standard deviation, GARCH models, and exploratory data analysis (EDA).

**Outputs:** Interactive charts, volatility forecasts, and risk metrics.

### 🛠️ Tools & Technologies
**Python:** pandas, numpy, matplotlib, seaborn, yfinance (Yahoo Finance API)

**Volatility Models:** GARCH (via arch library), rolling statistics

**Visualization:** Plotly, Jupyter Notebook

### 📂 Repository Structure

```
StockMarketVolatilityAnalysis/
├── data/                    # Sample datasets (CSV/JSON)
├── notebooks/               # Jupyter notebooks for analysis
│   ├── EDA.ipynb            # Exploratory Data Analysis
│   ├── GARCH_Modeling.ipynb # Volatility modeling
├── scripts/                 # Python scripts for automation
├── outputs/                 # Charts, reports, and forecasts
├── README.md                # This file
└── requirements.txt         # Dependencies
```


### 🔍 Key Findings
Identified periods of high volatility correlated with macroeconomic events (e.g., Fed rate hikes).

GARCH(1,1) model effectively predicted short-term volatility spikes.

Sector-specific analysis revealed tech stocks (NASDAQ) as more volatile than utilities.


