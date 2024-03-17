#----------------------------------------------
# .... Imports
#----------------------------------------------
library(readxl)
library(tseries)
library(ggplot2)
library(forecast)
library(seastests)

# Read data
data_path <- "~/RSpace/Datasources/Practicals_data.xls"
dataset <- read_excel(data_path)
attach(dataset)

#----------------------------------------------
# .... Convert data to time series
#----------------------------------------------
Temp = ts(Temperature, start=1960, end=2018, frequency=1)

Temp2= ts(Temperature, start=c(1960,1), frequency=12)

#----------------------------------------------
# .... Working with Temp2
#----------------------------------------------
autoplot(Temp2, main="Plot of Temperature two", col="maroon", lwd=2)

welch(Temp2, freq=12) # no seasonality

acf(Temp2, main="Plot of Temperature two", col="brown", lwd=2)


#----------------------------------------------
# .... Working with Temp
#----------------------------------------------

adf.test(Temp)
pp.test(Temp)
kpss.test(Temp)

# Differened Temp
Temp_diff <- diff(Temp)

adf.test(Temp_diff)
pp.test(Temp_diff)
kpss.test(Temp_diff)

#----------------------------------------------

# Check the number of times the data should be differened
ndiffs(Temp) # by defaul it's adf
ndiffs(Temp, test="pp") # changed to pp
ndiffs(Temp, test="kpss") # ... to kpss

#----------------------------------------------
# .... Getting model for the data
#----------------------------------------------
acf(Temp, main="Acf Plot of Temperature series", col="brown", lwd=2)
pacf(Temp, main="Pacf plot of Temperature series", col="maroon", lwd=2)

m1 <- Arima(Temp, order=c(1,1,0))
m2 <- Arima(Temp, order=c(0,1,1))

auto.arima(Temp)
auto.arima(Temp, stepwise = FALSE, approximation = FALSE)

m3 <- Arima(Temp, order=c(2,1,0)) # suitable model

# Include contant
m3_const <- Arima(Temp, order=c(2,1,0), include.constant = TRUE)
# Include drift
m3_drift <- Arima(Temp, order=c(2,1,0), include.drift = TRUE)

# Specifying the method
m1_ml <- Arima(Temp, order=c(1,1,0), method="ML")
m1_css <- Arima(Temp, order=c(1,1,0), method="CSS")


#----------------------------------------------
# .... Diagnostics
#----------------------------------------------

checkresiduals(m3)



