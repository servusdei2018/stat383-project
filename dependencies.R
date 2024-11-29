required_packages <- c("ggplot2", "here")

# Install missing packages
install_if_missing <- function(pkg) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
        install.packages(pkg)
    }
}

invisible(lapply(required_packages, install_if_missing))
