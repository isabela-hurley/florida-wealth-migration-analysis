-- Query 1: Which states sent the most tax returns to Florida?
SELECT origin_state_name, num_returns
FROM "IRS DATA"
WHERE origin_state_abbr != 'FL'
AND origin_state_name NOT LIKE '%Total%'
AND origin_state_name NOT LIKE '%Non-migrant%'
AND origin_state_name NOT LIKE '%Foreign%'
ORDER BY CAST(REPLACE(num_returns, ',', '') AS INTEGER) DESC
LIMIT 10;

-- Query 2: Which states brought the most AGI (wealth) to Florida?
SELECT origin_state_name, agi
FROM "IRS DATA"
WHERE origin_state_name NOT LIKE '%Total%'
AND origin_state_name NOT LIKE '%Non-migrant%'
AND origin_state_name NOT LIKE '%Foreign%'
AND origin_state_abbr != 'FL'
ORDER BY CAST(REPLACE(agi, ',', '') AS INTEGER) DESC
LIMIT 10;

-- Query 3: Average AGI per return by origin state (wealth density, not just volume)
SELECT 
  origin_state_name,
  num_returns,
  agi,
  ROUND(CAST(REPLACE(agi, ',', '') AS FLOAT) / CAST(REPLACE(num_returns, ',', '') AS FLOAT), 1) AS avg_agi_per_return
FROM "IRS DATA"
WHERE origin_state_name NOT LIKE '%Total%'
AND origin_state_name NOT LIKE '%Non-migrant%'
AND origin_state_name NOT LIKE '%Foreign%'
AND origin_state_abbr != 'FL'
AND CAST(REPLACE(num_returns, ',', '') AS INTEGER) > 1000
ORDER BY avg_agi_per_return DESC
LIMIT 10;

-- Query 4: Florida metro home value appreciation 2020 to 2022 (peak migration period)
SELECT 
  RegionName,
  "1/31/20" AS value_jan_2020,
  "12/31/22" AS value_dec_2022,
  ROUND((CAST("12/31/22" AS FLOAT) - CAST("1/31/20" AS FLOAT)) / CAST("1/31/20" AS FLOAT) * 100, 1) AS pct_change
FROM "zillow data"
WHERE StateName = 'FL'
AND RegionType = 'msa'
ORDER BY pct_change DESC
LIMIT 10;

-- Query 5: How did Florida metros compare to national appreciation?
SELECT 
  RegionName,
  StateName,
  "1/31/20" AS value_jan_2020,
  "12/31/22" AS value_dec_2022,
  ROUND((CAST("12/31/22" AS FLOAT) - CAST("1/31/20" AS FLOAT)) / CAST("1/31/20" AS FLOAT) * 100, 1) AS pct_change
FROM "zillow data"
WHERE RegionType = 'msa'
AND "1/31/20" IS NOT NULL
ORDER BY pct_change DESC
LIMIT 15;

-- Query 6: Full price arc by Florida metro — 2020 baseline, 2022 peak, 2026 current
SELECT 
  RegionName,
  "1/31/20" AS value_jan_2020,
  "12/31/22" AS value_dec_2022,
  "1/31/26" AS value_jan_2026,
  ROUND((CAST("1/31/26" AS FLOAT) - CAST("1/31/20" AS FLOAT)) / CAST("1/31/20" AS FLOAT) * 100, 1) AS total_pct_change
FROM "zillow data"
WHERE StateName = 'FL'
AND RegionType = 'msa'
ORDER BY CAST("1/31/26" AS FLOAT) DESC
LIMIT 10;

-- Query 7: Total AGI and individuals flowing from top 5 high-tax states
SELECT 
  origin_state_name,
  num_individuals,
  agi,
  ROUND(CAST(REPLACE(agi, ',', '') AS FLOAT) / 1000000, 2) AS agi_billions
FROM "IRS DATA"
WHERE origin_state_name IN ('New York', 'California', 'New Jersey', 'Illinois', 'Massachusetts')
ORDER BY CAST(REPLACE(agi, ',', '') AS INTEGER) DESC;

-- Query 8: What share of total Florida inflow did the top 3 states represent?
SELECT 
  origin_state_name,
  CAST(REPLACE(agi, ',', '') AS INTEGER) as state_agi,
  ROUND(CAST(REPLACE(agi, ',', '') AS FLOAT) / 
    (SELECT CAST(REPLACE(agi, ',', '') AS FLOAT) FROM "IRS DATA" WHERE origin_state_name = 'FL Total Migration-US') * 100, 1) AS pct_of_total
FROM "IRS DATA"
WHERE origin_state_name IN ('New York', 'California', 'New Jersey')
ORDER BY state_agi DESC;

-- Query 9: All origin states ranked by AGI, volume, and wealth density — with tax thesis overlay
SELECT 
  origin_state_name,
  CAST(REPLACE(num_returns, ',', '') AS INTEGER) as total_returns,
  ROUND(CAST(REPLACE(agi, ',', '') AS FLOAT) / 1000000, 2) AS agi_billions,
  ROUND(CAST(REPLACE(agi, ',', '') AS FLOAT) / CAST(REPLACE(num_returns, ',', '') AS FLOAT), 1) AS avg_agi_per_return
FROM "IRS DATA"
WHERE origin_state_name NOT LIKE '%Total%'
AND origin_state_name NOT LIKE '%Non-migrant%'
AND origin_state_name NOT LIKE '%Foreign%'
AND origin_state_abbr != 'FL'
ORDER BY CAST(REPLACE(agi, ',', '') AS INTEGER) DESC
LIMIT 15;