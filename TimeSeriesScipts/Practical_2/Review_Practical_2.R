
# Temperature data starting from 1960
  # Temp -> yearly data
  # Temp2 -> monthly data


# Work with temp2
  # Plot the series
  # Plot for seasonality
  # Check for seasonality

# Work with temp
  # Check if stationary
  # Check the number of differences needed base on the test
  # Difference temp
  # Check if differenced temp is stationary


# Model selection
  # Use acf and pacf
  # Build competing model
    # mauto -> Get the model automatically
    # m1 -> ARIMA(1,1,0)
    # m2 -> ARIMA(0,1,1)
    # m3 -> ARIMA(2,1,0)
    # Check the one which is suitable (m1, m2, m3)
  # Manipulate model
    # m3_const -> ARIMA(2,1,0) include constant term
    # m3_drift -> ARIMA(2,1,0) include drift term
  # Specify model used
    # m1_ml -> model 1 with Maximum likelihood method
    # m1_css -> model 1 with CSS method



# Model diagnosis
  # Check the residuals if normaly distributed