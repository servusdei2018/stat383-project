library(here)
library(ggplot2)

# Load data
data <- read.csv(here("data.csv"))
expanded <- read.csv(here("expanded.csv"))

# Calculate percentage for Trump and Harris in the original dataset
vote_counts_data <- table(data$vote)
percentages_data <- prop.table(vote_counts_data) * 100

# Calculate percentage for Trump and Harris in the expanded dataset
vote_counts_expanded <- table(expanded$vote)
percentages_expanded <- prop.table(vote_counts_expanded) * 100

# Print percentages
cat("Orignal Dataset Percentages:\n")
print(percentages_data)
cat("\nExpanded Dataset Percentages:\n")
print(percentages_expanded)


# Calculate percentage change for each candidate (Trump, Harris)
percent_change_trump <- ((percentages_expanded["Donald Trump"] - percentages_data["Donald Trump"]) / percentages_data["Donald Trump"]) * 100
percent_change_harris <- ((percentages_expanded["Kamala Harris"] - percentages_data["Kamala Harris"]) / percentages_data["Kamala Harris"]) * 100

# Print percentage change results
cat("\nPercentage Change in Support for Donald Trump: ", round(percent_change_trump, 2), "%\n")
cat("Percentage Change in Support for Kamala Harris: ", round(percent_change_harris, 2), "%\n")

pie_data <- data.frame(
    Vote = names(vote_counts_data),
    Percentage = as.numeric(percentages_data)
)
png("original_dataset_pie_chart.png", width = 800, height = 800)
ggplot(pie_data, aes(x = "", y = Percentage, fill = Vote)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar(theta = "y") +
    labs(title = "Vote Distribution (Regular Dataset)") +
    theme_void() +
    theme(legend.title = element_blank())
dev.off()

pie_data_expanded <- data.frame(
    Vote = names(vote_counts_expanded),
    Percentage = as.numeric(percentages_expanded)
)
png("expanded_dataset_pie_chart.png", width = 800, height = 800)
ggplot(pie_data_expanded, aes(x = "", y = Percentage, fill = Vote)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar(theta = "y") +
    labs(title = "Vote Distribution (Expanded Dataset)") +
    theme_void() +
    theme(legend.title = element_blank())
dev.off()
