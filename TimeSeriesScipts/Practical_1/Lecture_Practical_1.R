# ----------------------------------------------
# .... Imports
# ----------------------------------------------
library(readxl)
library(tseries)
library(ggplot2)
library(forecast)
#library(seastests)

# Read data
data_path <- "//mac/Home/Documents/_DataScienceHub/R/Datasources/Practicals_data.xls"
dataset <- read_excel(data_path)
attach(dataset)

# ----------------------------------------------
# .... Convert data to time series
# ----------------------------------------------
Temp = ts(Temperature, start=1960, end=2018, frequency=1)
Temp2= ts(Temperature, start=c(1960,1), frequency=12)

# ----------------------------------------------
# .... Working with temperature series
# ----------------------------------------------
BoxCox.lambda(Temp)

autoplot(Temp, main="Plot of Temperature Series", col="maroon", lwd=2)

adf.test(Temp)
pp.test(Temp)
kpss.test(Temp)

# ----------------------------------------------
# .... Working with differenced temperature series
# ----------------------------------------------
Temp_diff_1 = diff(Temp)
Temp_diff_1

autoplot(Temp_diff_1, main="Plot of First Temperature DifferencedSeries", col="maroon", lwd=2)

adf.test(Temp_diff_1)
pp.test(Temp_diff_1)
kpss.test(Temp_diff_1)

# ----------------------------------------------
# .... Plot of ACF and PACF
# ----------------------------------------------
Acf(Temp)
Pacf(Temp)



