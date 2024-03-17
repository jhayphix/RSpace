#----------------------------------------------
# .... Imports
#----------------------------------------------
library(forecast)
library(tseries)
library(ggplot2)
Temperature
attach(Practicals_data)

# ----------------------------------------------------
# ------ Transforming the data to time series --------
# -----------------------------------------------------
# Frequency is 1 because its yearly data
Temp = ts(Temperature, start=1960, frequency=1)

# When you know the ending then end = 2018 : Gives the same solution as Temp above
Temp_same = ts(Temperature, start=1960, end=2018, frequency=1)

# Indicating the month and year, Frequency is 12 because of monthly data
Temp2 = ts(Temperature, start=c(1960, 1), frequency=12)

# --------------------- End ---------------------------

# ----------------------------------------------------
# --------------- Plotting ----------------------------
# -----------------------------------------------------
plot(Temp)

# Giving appropriate labeling
plot(Temp, ylab="Temperature (in min)", xlab="Year")

# Using autoplot
autoplot(Temp)+ylab("Temperature (in min)")+xlab("Year")
# Note -> it gives an error

# --------------------- End ---------------------------


# -----------------------------------------------------
# --------------- Stabilizing the variance ------------
# -----------------------------------------------------

BoxCox.lambda(Temp)

# --------------------- End ---------------------------


# -----------------------------------------------------
# --------------- Checking for stationarity -----------
# -----------------------------------------------------

# Adf test Ho: The temperature series is not stationary
adf.test(Temp)

# PP test Ho: The temperature series is not stationary
pp.test(Temp)

# KPSS test Ho: The temperature series is stationary
kpss.test(Temp)

# --------------------- End ---------------------------

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


