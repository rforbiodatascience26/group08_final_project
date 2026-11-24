# Child immunization against measles vs Under 5-years old mortality across countries.

Group 8 Final Project for DTU course R for Bio Data Science (22160)

## Biological question

Does child immunization against measles relate to under-five mortality across countries, and does stunting prevalence help explain cross-country variation in that relationship? Countries with higher measles-vaccine coverage should theoretically have lower under five mortality. But, child mortality is also driven by nutritional and developmental conditions. (Black R. et al., 2013; doi: [10.1016/S0140-6736(13)60937-X](https://doi.org/10.1016/s0140-6736%2813%2960937-x). By bringing in stunting prevalence as a marker for chronic undernutrition, we have a third variable to ask whether it modifies or helps explain the coverage mortality relationship.

## Datasets

### 1) Measles immunization dataset

[Link to dataset](https://www.who.int/data/gho/data/indicators/indicator-details/GHO/measles-containing-vaccine-first-dose-%28mcv1%29-immunization-coverage-among-1-year-olds-%28-%29)

Per country, per year, tracks the percentage of 1-year olds that have received their first dose of the measles vaccine.

5,052 rows x 34 columns

Data from 2000 - 2025

Variables of interest:

1.  SpatialDimValueCode: ISO3 country code
2.  Location / Parent Location: country name and WHO region
3.  Period: the year
4.  Value: the percentage of MCV1

Data wrangling steps:

1.  Dropping the variables that we don’t need.

### 2) Mortality under 5 years old dataset

[Link to dataset](https://www.who.int/data/gho/data/indicators/indicator-details/GHO/under-five-mortality-rate-%28probability-of-dying-by-age-5-per-1000-live-births%29)

Per country, per year, probability of dying by age 5, per 1000 live births.

39,346 rows x 34 columns

Data from 1931 - 2024

Variables of interest:

1.  SpatialDimValueCode: ISO3 country code
2.  Location / Parent Location: country name and WHO region
3.  Period: the year
4.  Value: the mortality rate (probability of dying by age 5), per 1,000 live births

Data wrangling steps:

1.  Dropping the variables that we don’t need.
2.  The Value variable comes in a string format, where in each cell we have the actual percentage of interest and the CI (e.g. "1.3 [0.6 - 2.8]"). Using the stringr library we can extract just the first part as numeric.

### 3) Stunting prevalence dataset

[Link to dataset](https://www.who.int/data/gho/data/indicators/indicator-details/GHO/gho-jme-country-children-aged-5-years-stunted-%28-height-for-age--2-sd%29)

Per country, per survey year, what percentage of children under 5 are stunted (their height is 2 standard deviations below the WHO growth reference median). This is a potential marker for chronic undernutrition.

1,131 rows x 34 columns

Data from 1983 - 2024

Variables of interest:

1.  SpatialDimValueCode: ISO3 country code
2.  Location / Parent Location: country name and WHO region
3.  Survey years: the years that the survey took place. However, not every country has a row for every year, because countries don’t always conduct annual surveys for stunting.
4.  Value: the percentage of children under 5 classified as stunted

Data wrangling steps:

1.  Dropping the variables that we don’t need.
2.  The Value variable has again a string format that combines the percentage with the CI in brackets, so we will only extract the first parts as numeric.

## Linear model

`lm(mortality_rate ~ measles_coverage + stunting_prevalence)`
