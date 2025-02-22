# STAT383 Project: Clarkson University Student Voting Behavior in the 2024 Election Cycle

This repository contains the code and data used for our STAT383 project at Clarkson University, which analyzes generational differences in voting behavior among undergraduate students. The study explores the voting preferences of students, compares them to inferred parental voting behaviors, and contrasts these findings with state- and national-level polling data for the 2024 election cycle.

Detailed reports containing our study's findings, preliminary predictions, and key insights are available in the `papers` directory.

## Prerequisites

This project uses R and the following libraries:
- `here` (for managing file paths)
- `ggplot2` (for creating visualizations)

These dependencies may be installed by running the `dependencies.R` script.

## Getting Started

1. Clone the repository
    ```bash
    git clone https://github.com/servusdei2018/stat383-project.git
    cd stat383-project
    ```

2. Load the RStudio Project: Open `stat383-project.Rproj` in RStudio to set up the project environment.

3. Run the Analysis
  - To preprocess the data and generate the expanded dataset, run:
    ```R
    source("expand_data.R")
    ```
  - To perform statistical analysis and create visualizations, run:
    ```R
    source("stats.R")
    ```

4. Visualize the Results
  - View the pie charts for vote distributions:
    - Original dataset: `original_dataset_pie_chart.png`
    - Expanded dataset: `expanded_dataset_pie_chart.png`

## Included Data

- `data.csv`: Contains raw survey responses with student voting preferences.
- `expanded.csv`: Includes inferred parental voting preferences based on survey responses.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Citation

Please cite our paper if you use this code or part of it in your work:

```bibtex
@misc{bracy2024studentvoting,
      title={Clarkson University Student Voting Behavior in the 2024 Election Cycle},
      author={Nathanael Bracy and Joseph Kerekes and Megan Zalepeski and Ethan Jansen},
      year={2024},
      url={https://github.com/servusdei2018/stat383-project},
      note={R code, data and reports for a study in generational voting behavior analysis},
}
```
