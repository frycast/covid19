### Given GPS target coordinates and a year, this script retrieves 
## daily summary weather data from the nearest weather station for that year.
##
## The NOAA dataset used is Global Surface Summary of the Day (GSOD)
## docs and metadata: https://data.nodc.noaa.gov/cgi-bin/iso?id=gov.noaa.ncdc:C00516
## The stationID is concatenation of USAF and WBAN identifiers

library(RCurl) # For ftp
library(tidyverse) # For data wrangling

## 0. Set target coordinates, URL sources, and year
lat <- -37.827313; lon <- 145.352647 
yr <- 2019
gdir <- "ftp://ftp.ncdc.noaa.gov/pub/data/gsod"
gdir_csv <- "https://www.ncei.noaa.gov/data/global-summary-of-the-day/access"
surl <- "ftp://ftp.ncdc.noaa.gov/pub/data/noaa/isd-history.csv"


get_stations <- function(year,
                         gsod_dir = gdir,
                         stations_url = surl) {
  ## 1. Get vector of all stationIDs that we can access
  gsod_url <- paste0(gsod_dir, "/", year, "/")
  gsod_filenames <- getURL(gsod_url, ftp.use.epsv = FALSE, dirlistonly = TRUE)
  gsod_stationIDs <- substr(unlist(strsplit(gsod_filenames, "\r\n")), 1, 12)
  ## 2. Get stations list with GPS and date range
  stations_csv <- getURL(stations_url)
  stations_all <- read.csv(textConnection(stations_csv))
  ## 3. Filter stations list to date range and to stationIDs that we can retrieve
  stations <- stations_all %>% 
    mutate(stationID = paste0(USAF, "-", WBAN)) %>% 
    filter(stationID %in% gsod_stationIDs) %>% 
    filter(as.integer(END) > year)
  return(stations)
}
  
get_closest_stationID <- function(lat, lon, stations) {
  ## 4. Find and return stationID with GPS coordinates closest to target
  stations[which.min((lat - stations$LAT)^2 + (lon - stations$LON)^2), "stationID"]
}

get_station_data <- function(stationID, gsod_dir_csv = gdir_csv, year = syear) {
  # 4. Retrieve all observations from the station 
  gsod_station_csv <- paste0(gsod_dir_csv, "/", year, "/", gsub("-", "", stationID), '.csv')
  gsod_station <- read.csv(gsod_station_csv)
  return(as_tibble(gsod_station))
}

stations <- get_stations(yr)
closest_stationID <- get_closest_stationID(lat, lon, stations)
station_data <- get_station_data(closest_stationID)

station_data

### Next steps:
# 6. Check GPS coordinates in retrieved observations for consistency








##### UNUSED CODE -----------------------------------------------------------
# ## We use package rnoaa to get National Oceanic and Atmospheric Administation data
# # rnoaa docs: https://docs.ropensci.org/rnoaa/
# # You may need to install GDAL first (see docs)
# # You will need an API key to use NOAA NCDC functions (see docs)
# # install.packages("rnoaa")
# 
# library(rnoaa)
# con <- file("noaakey.txt", "r")
# key <- readLines(con, n = 1); close(con) # put your API key in line 1 of a file noaakey.txt
# options(noaakey = key)
# ncdc_datasets()
# startdate <- '2019-05-01'
# enddate <- '2020-04-03'
# dataset <- 'GHCND'
# features <- c('PRCP','TMAX','TMIN')
# 
# out <- ncdc(datasetid = dataset, datatypeid = features, 
#             startdate = startdate, enddate = enddate, 
#             limit = 25, stationid='GHCND:ITM00016179')








