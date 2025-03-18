# Horror Movies Analysis: Ratings, Box Office, and Trends

This project analyzes horror movies from 1970 to 2025, focusing on ratings, box office gross, and popularity trends. The analysis includes:
- Top movies by weighted rating, box office, and number of votes.
- Distribution of movies by genres and decades.
- Visualizations created using Tableau.

## Project Structure
- `data/`: Contains the CSV files used for analysis.
  - `cleaned_horror_movies.csv`: Cleaned dataset.
  - `filtered_horror_movies_1970_2025.csv`: Filtered dataset.
  - `top_25_movies_with_box_office.csv`: Top 25 horrors table used for Tableau. 
  - `https://developer.imdb.com/non-commercial-datasets/#titlebasicstsvgz`: Initial dataset from IMDB. 
  - `https://developer.imdb.com/non-commercial-datasets/#titleratingstsvgz`: Initial dataset from IMDB. 
- `notebooks/`: Contains Jupyter Notebooks or scripts for data analysis.
  - `data_preparation.py`: Python script for cleaning and filtering the data.
  - `creating_table_and_insert.sql`: SQL queries for creating the horror movies dataset.
  - `analysis.sql`: SQL queries for analyzing the horror movies dataset.
- `visualization/`: Contains Tableau dashboards and exported visualizations.
  - `Horror Movies Analysis_ Ratings, Box Office, and Trends.twbx`: Tableau dashboard file.
- `docs/`: Contains project documentation.
  - `README.md`

## How to Use
1. Run the Python script to clean the data.
2. Execute the SQL queries to analyze the data.
3. Open the Tableau dashboard to visualize the results.

## Technologies Used
- **Tableau**: For creating interactive dashboards.
- **Python**: For data cleaning and analysis (Pandas, NumPy).
- **SQL**: For querying and aggregating data (DBeaver).
