library(forecast)
fit <- auto.arima(value)
fore <- predict(fit, n.ahead = 48)
ts.plot(value, fore$pred, col = c(1,2), lty = c(1,2), ylab = "Attitudes", main = "Changes of Bus Passengers' Overall Satisfaction Towards TfL's Bus Service")
