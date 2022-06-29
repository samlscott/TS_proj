
# SVAR in R

# Load packages
library(urca)
library(vars)
library(mfilter)
library(tseries)
library(TSstudio)
library(forecast)
library(tidyverse)

# Load data
data <- read.csv(file.choose())

# declare time series variables
y_t <- ts(data$real_gdp, start (1960,1,1), frequency = 4)
g_t <- ts(data$gov_gdp, start (1960,1,1), frequency = 4)
r_t <- ts(data$real_int, start (1960,1,1), frequency = 4)

# Plot the Series
ts_plot(y_t)
ts_plot(g_t)
ts_plot(r_t)

# SVAR Restrictions
amat <- diag(3)
amat
amat[2,1] <- NA
amat[3,1] <- NA
amat[3,2] <- NA
amat
# allowing coefficients in bottom corner to be free
# zeros in upper triangle are the restrictions

# Build the model
sv <- cbind(y_t,g_t,r_t)
colnames(sv) <- cbind("", "", "")

# Lag order selection
lagselect <- VARselect(sv, lag.max = 8, type = "both")
lagselect$selection

# Estimate the model
Model1 <- VAR(sv, p = 4, season = NULL, type = "const")
SVARMod1 <- SVAR(Model1, Amat = amat, Bmat = NULL, hession = TRUE, estmethod = c("scoring", "direct"))
SVARMod1

# IRF
SVARy_t <- irf(SVARMod1, impulse = "r_t", repsone = "y_t")
SVARy_t
plot(SVARy_t)

SVARg_t <- irf(SVARMod1, impulse = "r_t", repsone = "g_t")
SVARg_t
plot(SVARg_t)

SVARr_t <- irf(SVARMod1, impulse = "r_t", repsone = "r_t")
SVARr_t
plot(SVARr_t)







# real interest rate

#Setting directory to script location
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Open libraries
library(dplyr)
library(SciViews)

#Read data sets to data frameworks
df_CPI <- read.csv(file = "CPI_mo_ns.csv", header = TRUE)
df_nom <- read.csv(file = "nom_io_ns.csv", header = TRUE)

#Setting data framework variables
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


#Average quarterly nominal interest
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

#Write real interest to csv file
write.csv(Real_interest,"Real_interest.csv")



## Dickey Fuller Tests


# Dickey Fuller tests
library(tseries)
real_gdp1 <- real_gdp1[1:187,]
adf.test(real_gdp1)

library(tseries)
adf.test(Real_interest1$Real_interest_rate)

library(tseries)
adf.test(g_g_not_s$Value)


# Historical decomposition
amat1 <- diag(3)
amat1[1,2] <- NA
amat1[1,3] <- NA
amat1[2,1] <- NA
amat1[2,3] <- NA
amat1[3,1] <- NA
amat1[3,2] <- NA
amat1

#Building the model
library(svars)
n_sv <- cbind(y_t,g_t,r_t)
n_sv1 <- sv[-1,]
n_sv2 <- sv1[-187,]
colnames(sv2) <- cbind("y_t", "g_t", "r_t")

lagselect <- VARselect(sv2, lag.max = 8, type = "both")

n_Model1 <- VAR(n_sv2, p = 3, season = NULL, type = "const")
n_SVARMod1 <- SVAR(n_Model1, Amat = amat1, Bmat = NULL, hession = TRUE, estmethod = c("scoring", "direct"))

hist_decomp <- hd(n_SVARMod1)

