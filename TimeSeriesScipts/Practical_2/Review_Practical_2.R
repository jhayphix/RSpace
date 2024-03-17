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

# Difference temperature series
temp_diff <- diff(temp)
plot(temp_diff, main="Plot of Yearly Differenced Temperature Series", ylab="Tempeature", xlab="Year", lwd=2.2, col="orange")

adf.test(temp_diff)
pp.test(temp_diff)
kpss.test(temp_diff)


#----------------------------------------------
# .... Model selection
#----------------------------------------------

# Use acf and pacf | ARIMA(1,1,0)
Acf(temp, main="ACF plot of Year Temperature Series", lwd=2.5, col="maroon")
Pacf(temp, main="PACF plot of Year Temperature Series", lwd=2.5, col="maroon")

# ARIMA(0,1,1) | AIC=106.5 AICc=106.72 BIC=110.62
mauto <- auto.arima(temp)
# ARIMA(1,1,0) | AIC=109.02 AICc=109.24 BIC=113.14
m1 <- Arima(temp, order=c(1,1,0))
# ARIMA(2,1,0) | AIC=105.8  AICc=106.24 BIC=111.98
m2 <- Arima(temp, order=c(2,1,0)) # --------> Suitable model
# ARIMA(0,1,2) | AIC=108.49 AICc=108.93 BIC=114.67
m3 <- Arima(temp, order=c(0,1,2))

model <- m2

# Manipulate model
model_mean <- Arima(temp, order=c(2,1,0), include.mean = TRUE)
model_drift <- Arima(temp, order=c(2,1,0), include.drift = TRUE)

# Specify method used
m

#----------------------------------------------
# .... Model diagnosis
#----------------------------------------------
# Check the residuals if normaly distributed