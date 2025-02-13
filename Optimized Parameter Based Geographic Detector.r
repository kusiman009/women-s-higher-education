# Load necessary libraries
library(dplyr)
library(geodetector)

# Assuming your dataset 'my_data' is already loaded and the variables are renamed correctly.

# Define dependent and independent variables
dependent_var <- "x1"  # Dependent variable: Percentage of women with higher education
independent_vars <- c("x2", "x3", "x4", "x5", "x6", "x7", "x8", "x9", "x10", 
                      "x11", "x12", "x13", "x14", "x15")

# Step 1: Define discretization methods and number of intervals
discmethod <- c("equal", "quantile")  # Discretization methods
discitv <- c(3:6)  # Number of intervals (3 to 6)

# Step 2: Run the Optimal Discretization (optidisc) model
# Here, 'y' is the dependent variable and 'xa' to 'xc' are independent variables (replace with your actual variables)

# Prepare formula for the model
formula <- as.formula(paste(dependent_var, "~", paste(independent_vars, collapse = " + ")))

# Run optimal discretization (optidisc function)
odc_results <- optidisc(
  formula = formula,    # Dependent and independent variables in a formula
  data = my_data,       # Data to use
  discmethod = discmethod,  # Discretization methods
  discitv = discitv        # Number of intervals
)
# Step 3: Print the optimal discretization results
print(odc_results)

# Step 4: Plot the optimal discretization results
plot(odc_results)

# Factor detector analysis
g1 <- gd(x1 ~ x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15, 
         data = my_data)
# Print results
print(g1)
# Plot results
plot(g1)
# Load necessary library
library(GD)

# Run the geographical risk detector
gr1 <- gdrisk(x1 ~ x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15, 
              data = my_data)

# Print the results
print(gr1)

# Save the output to a file
write.csv(gr1, "C:/Users/Frank Osei-kusi/Desktop/west africa OPGD/gdrisk_detector_results.csv")

# Plot the results
plot(gr1)

# Save the plot as PNG
png("C:/Users/Frank Osei-kusi/Desktop/west africa OPGD/gdrisk_detector_plot.png")
plot(gr1)
dev.off()



