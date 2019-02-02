# FinancialMarkets

FinancialMarkets.jl will help you describe and model financial market objects in Julia.

For example:

```julia
# Load packages
 using Dates, FinancialMarkets

# Create 3m USD LIBOR
depo = Deposit(USD(), Month(3), 0.05)

# Price depo at trade date with default par of 1e6 
price(depo) # returns 987518.8588670965
```
## Features

Objects such as:

- Compounding constants, interest rates, discount factors
- Financial market calendars, day counters and roll conventions
- Currencies
- Stub types
- Schedules
- Cash flows
- Interest rate indices
- Instruments

Modelling such as:

- Year fraction calculations
- Conversion between interest rates and discount factors and between different interest rates
- Identifying good (and bad) days
- Adjusting and shifting dates
- Creating swap date schedules
- Pricing instruments

## Installation

Install FinancialMarkets.jl by running:

```julia
Pkg.add("FinancialMarkets")
```

## Obligatory badges

[![Build Status](https://travis-ci.org/imanuelcostigan/FinancialMarkets.jl.svg?branch=master)](https://travis-ci.org/imanuelcostigan/FinancialMarkets.jl)
[![Coverage Status](https://img.shields.io/coveralls/imanuelcostigan/FinMarkets.jl.svg)](https://coveralls.io/r/imanuelcostigan/FinMarkets.jl?branch=master)
[![Documentation Status](https://readthedocs.org/projects/finmarketsjl/badge/?version=master)](https://readthedocs.org/projects/finmarketsjl/?badge=master)
