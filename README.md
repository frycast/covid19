# Covid-19 Aux
Auxiliary data sources for covid-19 modelling group.

### What do we aim to provide?

Two data tables, one dynamic and one static. They should contain four general feature types:

* Daily or weekly weather summaries near hospitals in the study (dynamic)
* A measure of congestion in each hospital in the study (dynamic)
* Comorbidities, smoking and age distribution in the locale served by each hospital (static)
* A measure of the health system quality and access to healthcare in the locale served by each hospital (static)

All features must have a documented reputable source. Scripts to update dynamic data should be provided, preferably in R or Python.

### What is useful here so far?

* The script `weather.R`. Given GPS target coordinates and year of interest, this script retrieves daily summary weather data from the nearest weather station, among NOAA GSOD stations, for that year.



### Link dump of potential data sources
#### Genomic
* [Nextstrain: Real time tracking of genome evolution](https://nextstrain.org/)
* [DeepMind computational predictions of protein structures](https://deepmind.com/research/open-source/computational-predictions-of-protein-structures-associated-with-COVID-19)
* [GISAID repository: genetic sequences, epidemiological and geographical data](https://www.gisaid.org/)

#### Government response
* [Oxford government response tracker](https://www.kaggle.com/paultimothymooney/oxford-covid19-government-response-tracker)
* [Containment and mitigation measures](https://www.kaggle.com/paultimothymooney/covid19-containment-and-mitigation-measures)
* [USA school closures updated daily](https://www.edweek.org/ew/section/multimedia/map-coronavirus-and-school-closures.html)
* [USA Medicaid Emergency Authority Tracker: Approved State Actions](https://www.kff.org/medicaid/issue-brief/medicaid-emergency-authority-tracker-approved-state-actions-to-address-covid-19/)

#### Comorbidities, healthcare and demographics
* [Healthdata.org GBD compare for comorbidities](https://vizhub.healthdata.org/gbd-compare/) also see [here](https://github.com/beoutbreakprepared/nCoV2019)
* [Ourworldindata.org includes Healthcare Capacity, Age Structure and Risk Factor and Comorbidities](https://ourworldindata.org/coronavirus-data#)
* [USA State Data and Policy Actions](https://www.kff.org/health-costs/issue-brief/state-data-and-policy-actions-to-address-coronavirus/)

#### Test and outcome tracking
* [USA Covid tracking project, testing data for states and territories (how many people have been tested, and where)](https://covidtracking.com/data/)

#### Kaggle community
* [Kaggle challenges home](https://www.kaggle.com/covid19)
* [Kaggle best community contributions](https://www.kaggle.com/covid-19-contributions)
* [USA 'CORD-19' Kaggle challenge](https://www.kaggle.com/allen-institute-for-ai/CORD-19-research-challenge/tasks)

#### Creepy Google powers
* [Related news article, The Verge](https://www.theverge.com/2020/4/3/21206318/google-location-data-mobility-reports-covid-19-privacy)
* [New Insights into Human Mobility, Google AI Blog](https://ai.googleblog.com/2019/11/new-insights-into-human-mobility-with.html?m=1)
