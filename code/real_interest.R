#Setting directory to script location
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Open libraries
library(dplyr)
library(SciViews)
library(forecast)
library(tseries)
library(ggplot2)

#####################################################################################################
#Setting up dataframes
########################################
#Read data sets to dataframes
df_CPI <- read.csv(file = "CPI_mo_ns.csv", header = TRUE)
df_nom <- read.csv(file = "nom_io_ns.csv", header = TRUE)

#Setting dataframe variables
#Nominal
df_nom$year <- lubridate::year(df_nom$DATE)
df_nom$month <- lubridate::month(df_nom$DATE)
df_nom$quarter <- 1 + (as.numeric(df_nom$month)-1) %/% 3
df_nom$mt <- with(df_nom, month[quarter == "1"][match(month,month)])
#CPI
df_CPI$year <- lubridate::year(df_CPI$DATE)
df_CPI$month <- lubridate::month(df_CPI$DATE)
df_CPI$quarter <- 1 + (as.numeric(df_CPI$month)-1) %/% 3
df_CPI$mt <- with(df_CPI, month[quarter == "1"][match(month,month)])

#####################################################################################################
#Calculating real interest rate
########################################

#Average quarterly nominal interest calculation
Avg_nom <- df_nom %>%
  group_by(year,quarter) %>%
  summarise(Avg_nom = mean(INTDSRZAM193N))

#CPI calculation
CPI_portion <- df_CPI %>%
  group_by(year,quarter) %>%
  summarise(term = (ln((ZAFCPIALLMINMEI[mt == "2"]+ZAFCPIALLMINMEI[mt == "3"])/2)-ln((ZAFCPIALLMINMEI[mt == "2"]+ZAFCPIALLMINMEI[mt == "1"])/2))^2 - 1)

#Real Interest calculation
Real_interest <- merge(Avg_nom,CPI_portion) %>% group_by(year,quarter) %>%
  summarise(Real_interest_rate = Avg_nom-term)

#####################################################################################################
#Removin' seasonality
########################################
#Making timeseries
rts <- ts(Real_interest$Real_interest_rate,frequency = 4)

#Dickie-Fuller test
adf.test(rts, alternative = "stationary")
acf(rts, main = "")
Pacf(rts, main = "")

#Seasonally adjusting and testing stationarity
decomp <- stl(rts,"periodic")
seasonally_adj_Rt <- seasadj(decomp)

#Differenced seasonally adjusted series with d = 1
rts_diffone <- diff(seasonally_adj_Rt, differences = 1)
#If you want to view decomposition and seasonally adjusted and differenced series
plot(decomp)
plot(seasonally_adj_Rt)
plot(rts_diffone)

#Checking to see if d = 1 is okay by investigating P-value and lag
adf.test(rts_diffone, alternative = "stationary")
acf(rts_diffone, main = "ACF for differenced series")
Pacf(rts_diffone, main = "PACF for differenced series")

#####################################################################################################
#Exporting calculated series
########################################
#Appending new series to dataframe
Real_interest$seasonally_adjusted <- seasonally_adj_Rt
#Adding a fill value to the start of the differenced series
rts_diffed <- append(rts_diffone,0.10,after = 0)
Real_interest$seasonally_differenced <- rts_diffed

#Write real interest to csv file
write.csv(Real_interest,"Real_interest.csv")

#####################################################################################################

