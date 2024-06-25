import pandas as pd
import pickle

def load_dataset():

    df = pd.read_csv('Dataset/imdb_top_1000.csv')
    
    
    df['Genre'] = df['Genre'].str.split(',')
    df.rename(columns={'Series_Title': 'Title', 'IMDB_Rating':'Rating'}, inplace=True)
    df['Actors'] = (df['Star1'] + ', ' + df['Star2'] + ', ' + df['Star3'] + ', ' + df['Star4'])
    df['Actors'] = df['Actors'].str.split(',')
    
    cols = ['Title', 'Released_Year', 'Runtime', 'Rating', 'Genre', 'Director', 'Actors','Overview']
    df = df[cols]
    
    # df.to_csv('clean_movie_data.csv')

    movie_db = df.to_dict(orient='records')
    
    movie_nested_dict = {}
    
    for i in movie_db:
        entry = {
            'Released_Year': i['Released_Year'],
        'Runtime': i['Runtime'],
        'Rating': i['Rating'],
        'Genre': i['Genre'],
        'Director': i['Director'],
        'Actors': i['Actors'],
        'Overview': i['Overview']
        }
    
        movie_nested_dict[i['Title']] = entry
    
    with open('movie_nested_dict.pickle', 'wb') as file:
        pickle.dump(movie_nested_dict, file, protocol=pickle.HIGHEST_PROTOCOL)
    
    print('saved')

    return movie_nested_dict

def load_existing():
    with open('movie_nested_dict.pickle', 'rb') as file:
        movie_nested_dict = pickle.load(file)

    return movie_nested_dict

    
