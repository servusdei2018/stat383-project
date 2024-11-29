library(here)

# Load data
data <- read.csv(here("data.csv"))
out <- file(here("expanded.csv"), "w")

# Write headers
header <- colnames(data)
header <- header[header != "vote_different_than_at_least_one_of_your_parent"]
writeLines(paste(header, collapse = ","), out)

# Process responses
for (i in 1:nrow(data)) {
    # Record original vote
    row <- data[i, !(names(data) == "vote_different_than_at_least_one_of_your_parent")]
    writeLines(paste(row, collapse = ","), out)

    # Can't infer anything from an 'Other' response
    if (data$vote[i] == "Other") {
        next
    }

    # Infer parent vote
    parent_vote <- data$vote[i]
    if (data$vote_different_than_at_least_one_of_your_parent[i] == 1) {
        if (parent_vote == "Kamala Harris") {
            inferred_parent_vote <- "Donald Trump"
        } else {
            inferred_parent_vote <- "Kamala Harris"
        }
    } else {
        inferred_parent_vote <- parent_vote
    }

    # Record inferred parent vote
    row_inferred <- c(inferred_parent_vote, row[2:length(row)])
    writeLines(paste(row_inferred, collapse = ","), out)
}

close(out)
