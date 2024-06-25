import pickle


def search_genre(genre, movie_db):
    title = []
    for k,v in movie_db.items():
        if v['Genre'] != [None]:
            for g in v['Genre']:
                if g.lstrip().upper() == genre.upper():
                    title.append(k)
    print(f"There are {len(title)} movies for {genre} Genre.")
                
    if len(title) > 0:
        print("Here are some movies you might enjoy: \n ")
        for i, t in enumerate(title):
            print(f"{i+1}. {t}")
    else:
         print("No Results Found")
            

def search_title(title, movie_db):
    for m in movie_db.keys():
        tmp = m.upper()
        title = title.upper()
        if tmp.find(title) > -1:
            print('#'*30)
            print(f"Movie Title: {m}")
            print(f"Genre: {movie_db[m]['Genre']}")  
            print(f"Year: {movie_db[m]['Released_Year']}") 
            print(f"Director: {movie_db[m]['Director']}")
            print(f"Actors: {movie_db[m]['Actors']}")  


def search_rating(rating, movie_db):
    title = []
    for k,v in movie_db.items():
        if v['Rating'] == rating:
            title.append(k)
    print(f"There are {len(title)} movies with {rating} rating.")
                
    if len(title) > 0:
        print("Here are some movies you might enjoy: \n ")
        for i, t in enumerate(title):
            print(f"{i+1}. {t}")
    else:
         print("No Results Found")



def search_year(year, movie_db):
    title = []
    for k,v in movie_db.items():
        if v['Released_Year'] == year:
            title.append(k)
    print(f"There are {len(title)} movies released in {year}.")
                
    if len(title) > 0:
        print("Here are some movies you might enjoy: \n ")
        for i, t in enumerate(title):
            print(f"{i+1}. {t}")
    else:
         print("No Results Found")


def add_movie(title, rating, director, year, actors, genre, movie_db):
    rating = None if len(rating) == 0 else rating
    director = None if len(director) == 0 else director
    year = None if len(year) == 0 else year
    actors = None if len(actors) == 0 else actors
    genre = None if len(genre) == 0 else genre
    
    record = {
        'Rating': rating,
        'Director': director,
        'Released_Year': year,
        'Actors': actors,
        'Genre': [genre],
    }
    movie_db[title] = record
    print('Movie added')

    with open('movie_nested_dict.pickle', 'wb') as file:
            pickle.dump(movie_db, file, protocol=pickle.HIGHEST_PROTOCOL)

