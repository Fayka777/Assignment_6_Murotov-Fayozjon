install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

# Generate random data
set.seed(123) # for reproducibility
data <- data.frame(
  x = rnorm(100),
  y = rnorm(100),
  group = sample(letters[1:3], 100, replace = TRUE),
  z = rnorm(100)
)

# Create Histogram of 'x'
hist_plot <- ggplot(data, aes(x = x)) +
  geom_histogram(binwidth = 0.5, fill = "lightblue", color = "black") +
  ggtitle("Histogram of X") +
  xlab("X values")

# Create Bar chart of the count of 'group'
bar_plot <- ggplot(data, aes(x = group)) +
  geom_bar(fill = "lightgreen", color = "black") +
  ggtitle("Bar Chart of Group Counts") +
  xlab("Group") +
  ylab("Count")

# Create Box plot of 'x'
box_plot_x <- ggplot(data, aes(y = x)) +
  geom_boxplot(fill = "lightcoral", color = "black") +
  ggtitle("Box Plot of X") +
  ylab("X values")

# Create Box plot of 'y'
box_plot_y <- ggplot(data, aes(y = y)) +
  geom_boxplot(fill = "lightgoldenrod", color = "black") +
  ggtitle("Box Plot of Y") +
  ylab("Y values")

# Create Scatter plot of 'x' vs 'y'
scatter_plot_xy <- ggplot(data, aes(x = x, y = y)) +
  geom_point(color = "blue") +
  ggtitle("Scatter Plot of X vs Y") +
  xlab("X values") +
  ylab("Y values")

# Create Scatter plot of 'x' vs 'z'
scatter_plot_xz <- ggplot(data, aes(x = x, y = z)) +
  geom_point(color = "red") +
  ggtitle("Scatter Plot of X vs Z") +
  xlab("X values") +
  ylab("Z values")

# Create Scatter plot of 'x' vs 'y' with regression line
scatter_reg_plot_xy <- ggplot(data, aes(x = x, y = y)) +
  geom_point(color = "purple") +
  geom_smooth(method = "lm", color = "darkgreen") +
  ggtitle("Regression Line of Y on X") +
  xlab("X values") +
  ylab("Y values")

# Create Scatter plot of 'x' vs 'z' with regression line
scatter_reg_plot_xz <- ggplot(data, aes(x = x, y = z)) +
  geom_point(color = "darkblue") +
  geom_smooth(method = "lm", color = "orange") +
  ggtitle("Regression Line of Z on X") +
  xlab("X values") +
  ylab("Z values")

# Arrange the plots in a 4x2 grid
grid.arrange(hist_plot, bar_plot, 
             box_plot_x, box_plot_y, 
             scatter_plot_xy, scatter_plot_xz, 
             scatter_reg_plot_xy, scatter_reg_plot_xz, 
             nrow = 4, ncol = 2)
