library(tidyverse)

nam <- c("daily", "first", "patients")
f <- paste0("../fake_processed/", nam, ".csv")
names(f) <- nam

daily <- read.csv(f["daily"])    # Daily timeseries
admis <- read.csv(f["patients"]) # Patient admission details
first <- read.csv(f["first"])    # Combination of admission data and first record for daily

head(arrange(daily, pin, day)[, 1:5])
head(arrange(first, pin)[, 1:5])
head(arrange(admis, pin)[, 1:5])
