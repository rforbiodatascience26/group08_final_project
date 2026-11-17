# group08_final_project
Final project in R4BDS course: Child immunisation against measles vs Under 5-years old mortality across countries.

R for Bio Data Science - Group Project:
Biological ques-on: does child immunisa-on against measles relate to under-five
mortality across countries, and does stun-ng prevalence help explain cross-country
varia-on in that rela-onship?
Countries with higher measles-vaccine coverage should, theore-cally speaking, have
lower under five mortality. But, child mortality is also driven by nutri-onal and
developmental condi-ons. (Black R. et al., 2013; doi: 10.1016/S0140-6736(13)60937-
X). By bringing in stun-ng prevalence as a marker for chronic undernutri-on, we
have a third variable to ask whether it modifies or helps explain the coverage
mortality rela-onship.
lm ( mortality rate ~ vaccina-on coverage + stun-ng prevalence )
Measles immuniza-on dataset: per country, per year, tracks the percentage of 1-year
olds that have received their first dose of the measles vaccine.
4,856 rows x 34 columns
Data from 2000 - 2024
Variables of interest:
1. Spa-alDimValueCode: ISO3 country code
2. Loca-on / Parent Loca-on: country name and WHO region
3. Period: the year
4. Value: the percentage of MCV1
Data wrangling steps:
1. Dropping the variables that we don’t need
Mortality under 5 years old dataset: per country, per year, probability of dying by age
5, per 1000 live births.
13,095 rows x 34 columns
Data from 1931 - 2023
Variables of interest:
1. Spa-alDimValueCode: ISO3 country code
2. Loca-on / Parent Loca-on: country name and WHO region
3. Period: the year
4. Value: the mortality rate (probability of dying by age 5), per 1,000 live births
Data wrangling steps:
1. Dropping the variables that we don’t need
2. The Value variable comes in a string format, where in each cell we have the
actual percentage of interest and the CI (e.g. “1.3 [0.6 - 2.8]”). Using the stringr
library we can extract just the first part as numeric.
Stun-ng prevalence dataset: per country, per survey year, what percentage of
children under 5 are stunted (their height is 2 standard devia-ons below the WHO
growth reference median)
This is a poten-al marker for chronic undernutri-on.
967 rows x 34 columns
Data from 1983 - 2023
Variables of interest:
1. Spa-alDimValueCode: ISO3 country code
2. Loca-on / Parent Loca-on: country name and WHO region
3. Survey years: the years that the survey took place. However, not every
country has a row for every year, because countries don’t always conduct annual
surveys for stun-ng
4. Value: the percentage of children under 5 classified as stunted.
Data wrangling steps:
1. Dropping the variables that we don’t need
2. The Value variable has again a string format that combines the percentage
with the CI in brackets, so we will only extract the first parts as numeric.
Under 5 mortality rate: hhps://www.who.int/data/gho/data/indicators/indicator-
details/GHO/under-five-mortality-rate-(probability-of-dying-by-age-5-per-1000-live-
births)
Measles vaccine: hhps://www.who.int/data/gho/data/indicators/indicator-
details/GHO/measles-containing-vaccine-first-dose-(mcv1)-immuniza-on-coverage-
among-1-year-olds-(-)
Stun-ng prevalence: hhps://www.who.int/data/gho/data/indicators/indicator-
details/GHO/gho-jme-country-children-aged-5-years-stunted-(-height-for-age--2-sd)
