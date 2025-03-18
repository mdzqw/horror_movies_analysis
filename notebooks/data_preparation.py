import pandas as pd
import numpy as np
import requests
import os
import time

# Loading data
print("Loading data...")
basics = pd.read_csv('title.basics.tsv', sep='\t', low_memory=False)  # Load the basics dataset
ratings = pd.read_csv('title.ratings.tsv', sep='\t', low_memory=False)  # Load the ratings dataset

# Filtering horror movies
print("Filtering horror movies...")
horror_movies = basics[(basics['genres'].str.contains('Horror', na=False)) & 
                       (basics['titleType'] == 'movie')]  # Filter movies with 'Horror' genre

# Replace '\N' with NaN in the 'startYear' column
horror_movies['startYear'] = horror_movies['startYear'].replace('\\N', np.nan)

# Remove rows with missing release year
horror_movies = horror_movies.dropna(subset=['startYear'])

# Convert 'startYear' to integer
horror_movies['startYear'] = horror_movies['startYear'].astype(int)

# Merging with ratings
print("Merging with ratings...")
horror_movies_with_ratings = pd.merge(horror_movies, ratings, on='tconst', how='inner')  # Merge horror movies with ratings

# Remove duplicates (if any)
horror_movies_with_ratings = horror_movies_with_ratings.drop_duplicates(subset=['tconst'])

# Saving cleaned data
horror_movies_with_ratings.to_csv('cleaned_horror_movies.csv', index=False)
print("Data cleaning completed. Result saved in 'cleaned_horror_movies.csv'.")
print("Unique values in 'startYear' after cleaning:")
print(horror_movies['startYear'].unique())

# Checking the minimum and maximum year
print("\nMinimum release year:", horror_movies['startYear'].min())
print("Maximum release year:", horror_movies['startYear'].max())

# Selecting a time range
start_year = 1970
end_year = 2025

# Filtering by release year
filtered_horror_movies = horror_movies_with_ratings[
    (horror_movies_with_ratings['startYear'] >= start_year) & 
    (horror_movies_with_ratings['startYear'] <= end_year)
]

# Saving filtered data
filtered_horror_movies.to_csv('filtered_horror_movies_1970_2025.csv', index=False)
print(f"Filtering by years {start_year}-{end_year} completed. Result saved in 'filtered_horror_movies_1970_2025.csv'.")
print("Minimum release year after filtering:", filtered_horror_movies['startYear'].min())
print("Maximum release year after filtering:", filtered_horror_movies['startYear'].max())

# Checking the number of movies
print("\nNumber of movies after filtering:", len(filtered_horror_movies))