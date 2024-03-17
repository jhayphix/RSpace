# Import modules
library(readxl)
library(tseries)
library(ggplot2)
library(forecast)

# Import dataset
data_path = "//mac/Home/Documents/_DataScienceHub/R/Datasources/Practicals_data.xls"
dataframe = read_excel(data_path)
attach(dataframe)

#----------------------------------------------
# .... Temperature data starting from 1960
#----------------------------------------------
temp <- ts(Temperature, start=c(1960, 1), frequency = 1)
temp2 <- ts(Temperature, start=c(1960, 1), frequency = 12);

#----------------------------------------------
# .... Work with temp2
#----------------------------------------------
plot(temp2, main="Plot of Monthly Temperature Series", ylab="Tempeature", xlab="Year", lwd=2.1, col="blue")

welch(Temp2, freq=12) # no seasonality

adf.test(temp2)
pp.test(temp2)
kpss.test(temp2)

#----------------------------------------------
# .... Work with temp
#----------------------------------------------
plot(temp, main="Plot of Yearly Temperature Series", ylab="Tempeature", xlab="Year", lwd=2.2, col="maroon")

adf.test(temp)
pp.test(temp)
kpss.test(temp)

ndiffs(temp)

# Difference temp
# Check if differenced temp is stationary


#----------------------------------------------
# .... Model selection
#----------------------------------------------
# Use acf and pacf
# Build competing model
#   mauto -> Get the model automatically
#   m1 -> ARIMA(1,1,0)
#   m2 -> ARIMA(0,1,1)
#   m3 -> ARIMA(2,1,0)
#   Check the one which is suitable (m1, m2, m3)
# Manipulate model
#   m3_const -> ARIMA(2,1,0) include constant term
#   m3_drift -> ARIMA(2,1,0) include drift term
# Specify model used
#   m1_ml -> model 1 with Maximum likelihood method
#   m1_css -> model 1 with CSS method

#----------------------------------------------
# .... Model diagnosis
#----------------------------------------------
# Check the residuals if normaly distributed