# Imports
library(readxl)
library(tseries)
library(ggplot2)
library(forecast)

# Read data
data_path <- "~/_DataScienceHub/R/Datasources/Practicals_data.xls"
dataset <- read_excel(data_path)
attach(dataset)

# Transform data to time series
temp <- ts(Temperature, start=c(1960,1), end=c(2018, 1), frequency=1)

# Plot data [Describe what you see]
autoplot(temp, main="Temperature series Plot", ylab="Temperature", xlab="Year", col="blue", lwd=1.2)

# Check if variance is stabilized
BoxCox.lambda(temp)

# Check if data is stationary [State Ho and H1 and conclude]
# Adf [Not stationary]
adf.test(temp)
# PP [Not Stationary]
pp.test(temp)
# Kpss [Not Stationary]
kpss.test(temp)

# If Not -> Difference data
temp_diff <- diff(temp)

# Plot differenced data [Describe what you see]
autoplot(temp_diff, main="First Differenced Temperature Series Plot", xlab="Years", ylab="Temperature", col="maroon", lwd=1.3)

# Check if differenced data is stationary [State Ho and H1 and conclude]
# Adf [Stationary]
adf.test(temp_diff)
# PP [Stationary]
pp.test(temp_diff)
# Kpss [Stationary]
kpss.test(temp_diff)


# If Stationary -> Plot ACF and PACF [Describe what you see]
Acf(temp_diff, main="ACF of First Differenced Temperature Series Plot", col="maroon", lwd=2)
Pacf(temp_diff, main="PACF of First Differenced Temperature Series Plot", col="red", lwd=2)

# Identify Model from ACF and PACF [Write model]

#Identify competing models

# __________________________________________

# AIC=106.5    AICc=106.72   BIC=110.62
m1 <- auto.arima(temp)
# AIC=108.49   AICc=108.93   BIC=114.67
m2 <- Arima(temp, order=c(0, 1, 2))
# AIC=107.79   AICc=108.55   BIC=116.04
m3 <- Arima(temp, order=c(0, 1, 3))
# AIC=109.13   AICc=110.28   BIC=119.43
m4 <- Arima(temp, order=c(0, 1, 4))

# AIC=109.02   AICc=109.24   BIC=113.14
m5 <- Arima(temp, order=c(1, 1, 0))
# AIC=105.8   AICc=106.24   BIC=111.98
m6 <- Arima(temp, order=c(2, 1, 0))
# AIC=107.29   AICc=108.04   BIC=115.53
m7 <- Arima(temp, order=c(3, 1, 0))
# AIC=108.32   AICc=109.48   BIC=118.62
m8 <- Arima(temp, order=c(4, 1, 0))

# __________________________________________

# Picked model
model <- m6
model_2 <- m1

# __________________________________________

# Plot residuals [Describe what you see]
model_errors <- arima.errors(model)
model_2_errors <- arima.errors(model_2)

# Check for Normality test [State Ho and H1 and conclude]
shapiro.test(model_errors)
ks.test(temp, model_errors)

# Check if model is appropriate [State Ho and H1 and conclude]
Box.test(model_errors, type="Ljung-Box")
