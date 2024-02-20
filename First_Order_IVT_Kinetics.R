# First Order Reaction Rate Constant (1/s)
kATP <- 0.033
kCTP <- 0.067
kUTP <- 0.075
kGTP <- 0.025

# Initial Concentrations of Each NTP (mM)
ATP_initial <- 10
CTP_initial <- 10
UTP_initial <- 10
GTP_initial <- 10

# Set Seed for Random Number Generator
set.seed(654)

# Create Time Frame Where the Process is Modeled
time_points <- seq(0, 200, by = 1)

# Apply the Time Frame to the Reaction Model
synthetic_data <- sapply(time_points, function(t) reaction_model(t, kATP, kCTP, kUTP, kGTP, ATP_initial, CTP_initial, UTP_initial, GTP_initial))

# Establish a Reaction Model Using First Order Mechanism
reaction_model <- function(t, kATP, kGTP, kCTP, kUTP, ATP_initial, CTP_initial, UTP_initial, GTP_initial) {
  ATP_final <- ATP_initial * exp(-kATP * t)
  CTP_final <- GTP_initial * exp(-kGTP * t)
  UTP_final <- CTP_initial * exp(-kCTP * t)
  GTP_final <- UTP_initial * exp(-kUTP * t)
  return(c(ATP = ATP_final, CTP = CTP_final, UTP = UTP_final, GTP = GTP_final))
}

# Plot NTPs in Separate Plots
# par(mfrow = c(2, 2))
# ntps <- c("ATP", "CTP", "UTP", "GTP")
# colors <- c("purple", "green", "blue", "pink")

# for (i in 1:4) {
#   plot(time_points, synthetic_data[i, ], type = "b", pch = 16, col = colors[i],
#   xlab = "Time (s)", ylab = "Concentration", main = paste("Consumption of", ntps[i]))
#   }

# Plot NTPs in One Plot
par(mfrow = c(2, 2))
ntps <- c("ATP", "CTP", "UTP", "GTP")
colors <- c("purple", "green", "blue", "pink")

plot(time_points, synthetic_data[1, ], type = "b", pch = 16, col = colors[1],
     xlab = "Time (s)", ylab = "Concentration [mM]", main = "First Order Consumption of NTPs in IVT")

for (i in 2:4) {
  lines(time_points, synthetic_data[i, ], type = "b", pch = 16, col = colors[i])
}

# Identify Each NTP in the Plot Using a Legend
legend("topright", legend = ntps, col = colors, pch = 4, lty = 1, cex = 0.8)