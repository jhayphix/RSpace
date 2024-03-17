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
# .... Working with temp
#----------------------------------------------
BoxCox.lambda(Temp)

autoplot(Temp2, main="Plot of Temperature two", col="maroon", lwd=2)

adf.test(Temp)
pp.test(Temp)
kpss.test(Temp)

# -----------------------------------------------------
# --------------- Differencing ------------------------
# -----------------------------------------------------
Temp_first_diff = diff(Temp)
Temp_first_diff
plot(Temp_first_diff)

# Checking for stationarity on the first diff
# How to controlled -> [ The first difference of the temperature series is stationary]
adf.test(Temp_first_diff)

# --------------------- End ---------------------------

# -----------------------------------------------------
# --------------- Plotting ACF and PACF ---------------
# -----------------------------------------------------
Acf(Temp) # You can assign it to a variable eg temp_afc = Acf(Temp)
Pacf(Temp)

# --------------------- End ---------------------------


