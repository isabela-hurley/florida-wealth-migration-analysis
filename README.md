## Florida Wealth Migration & Real Estate Analysis

Florida has commanded national attention since 2020. No state income tax, rising home values, and warm weather created a pull that drew wealth out of high-tax northeastern and coastal states at an unprecedented rate. This project analyzes the capital inflows into Florida during the  2020–2021 peak migration wave using IRS tax return data, then maps that migration against Zillow home value data from 2020 through early 2026 to answer a more specific question: where did the money go, what did it do to prices, and what held when the market corrected?

This is not a "prices went up" story. It's a capital reallocation story highlighting who moved, how wealthy they were, and which markets absorbed the impact.

**Key Findings**

**1. New York wasn't just the largest source, it was dominant in scale.**
New York sent 49,277 tax returns to Florida in 2020–2021, nearly twice the next closest state.  More importantly, it brought $11 billion in adjusted gross income — notably more than California, New Jersey, and Illinois combined. Three states alone (NY, CA, NJ) accounted for 34.6% of all incoming AGI to Florida that year.

**2. Volume and wealth told different stories.**
Georgia was the #2 state by number of returns but doesn't appear in the top 10 for AGI. The data suggests people leaving Georgia were middle income, likely job-driven. The people leaving New York, DC, and Connecticut were wealthy. DC led with movers averging $249K AGI per household, Illinois $244K, then Connecticut $236K, all higher than New York's $223K average. New York dominated in scale while the others dominated in wealth density.

**3. The highest appreciation wasn't in Miami — it was in secondary markets.**
Naples led all Florida metros at 69% appreciation from January 2020 to December 2022, followed by Punta Gorda (68%) and Cape Coral (68%). These were markets with lower starting prices where incoming wealth had an outsized impact. Key West is the standout luxury case — it went from $588K to $967K, a 64.5% gain on an already expensive base. Florida placed 5 metros in the top 15 nationally for appreciation during this period, more than any other single state.

**4. Most markets peaked in 2022 and pulled back, however the gains largely held.**
Most Florida markets pulled back through 2023–2024 as mortgage rates rose and the migration wave normalized. Naples went $358K → $606K → $551K. North Port went $279K → $467K → $400K. The markets that ran hardest corrected the most, but still sit 40–55% above their 2020 baselines. Miami proved the most resilient, holding near its peak at $467K in early 2026 versus a $453K high in 2022. Miami's buyer pool skews heavily toward international wealth and high-net-worth domestic buyers who largely transact in cash — when rates rose and priced out the typical financed buyer elsewhere in Florida, Miami's demand floor held because its buyers were never rate-dependent to begin with.

**5. This was a long time coming capital reallocation event, not a lifestyle trend.**
The pandemic gets credit for the Florida migration wave, just not for the reason most people assume. COVID created the ideal economic conditions that made relocating to Florida financially optimal. The Fed dropped rates to near zero, northeastern asset values surged, remote work eliminated geographic constraints, and high earners finally had a reason to execute a move they'd already been running the math on for years.
Five high-tax states moved $26.8 billion in AGI into Florida in 2020–2021 — concentrated from financial centers, skewed toward high earners, and sticky in the markets that attracted the wealthiest buyers. When rates rose sharply in 2022 and that window closed, the migration wave normalized almost immediately. This was not by accident.

---

## The Convinient Tax Argument Has a Hole In It

Texas has no state income tax. Yet Texas movers averaged $84K AGI per return, ranking 12th in total wealth sent despite being 5th in volume. If this were purely a tax arbitrage story, Texas should be sending nobody. Instead it's sending a lot of people at modest income levels. 
What the Texas data reveals is that two completely different migration profiles were happening simultaneously. High-earning deliberate relocators from northeastern financial centers were making a calculated wealth decision. And a separate, larger group of lifestyle and retirement movers from Texas, Georgia, and North Carolina were moving for entirely different reasons.
When the Fed dropped rates to near zero in response to the pandemic, it did two things at once: it inflated the value of northeastern properties that high earners were sitting on, and it made buying in Florida cheaper than it had been in years. A New York homeowner in 2021 could sell an appreciated asset at peak, move that capital to Florida, and finance a new primary residence at 3% — capturing the tax savings, the asset gain, and the low entry cost simultaneously. That window was only open for about two years. When rates rose sharply in 2022, the migration wave normalized almost immediately.

The tax narrative isn't wrong but it just only explains half the migration. The other half required a very specific economic environment to execute, and the pandemic created it.

---

## Data Sources
- **IRS Statistics of Income — State-to-State Migration Data (2020–2021):** 
https://www.irs.gov/statistics/soi-tax-stats-migration-data
- **Zillow Home Value Index (ZHVI) — Metro Level (2000–2026):** 
https://www.zillow.com/research/data

## Methodology
IRS migration data was cleaned and imported into SQLite via DB Browser. Zillow ZHVI data was imported as a second table. Nine SQL queries were written to analyze migration volume, AGI concentration, average wealth per household by origin state, and Florida metro home value changes across three time points: January 2020, December 2022 (peak), and January 2026 (current). Results were cross-referenced to identify the relationship between migration inflows and real estate appreciation by market.

## Tools
SQL · SQLite · DB Browser · IRS SOI Data · Zillow Research Data
