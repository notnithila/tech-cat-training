from load_data import load_dataset, load_existing

import utility 

if __name__=="__main__":

    # to load data first time
    # movie_db = load_dataset()

    # maintain an updated vesrion to store user added movies 
    movie_db = load_existing()
    
    print(f'Movie DB loaded with {len(movie_db)} movies listed')
    
    selection = int(input('''
        Select a choice (1 - 5):
        1. Search by Genre
        2. Search by Movie Title
        3. Search by Rating
        4. Search by Year
        5. Add a Movie

        Enter: '''))

    # calls the specific function based on user selection 
    
    if selection == 1:
        # Searching by Genre
        sub_selection = input('Enter Genre: ')
        utility.search_genre(sub_selection, movie_db)

                    
    elif selection == 2:
        # Searching by Text in Title (with a loop)
        sub_selection = None
        
        while sub_selection != 'EXIT':
            sub_selection = input("""
            Enter Movie Title to Search. 
            
            Else type 'EXIT' to terminate
            """)
            
            movies = utility.search_title(sub_selection, movie_db)
            
    elif selection == 3:
        # Searching by Rating
        rating = input("""
        Enter a Rating:
        
        Example 8, 8.4

        Enter: """)
        try:
            rating = float(rating)
            utility.search_rating(rating, movie_db)
        except:
            print('Rating needs to be numeric')


    elif selection == 4:
        # Searching by Year
        year = input("""
        Enter a Movie Year:
        
        Example 2022, 1994

        Enter: """)
        utility.search_year(year, movie_db)
    

    elif selection == 5:
        # Add a new Movie 
        mov_title = input('Enter a Movie Title: ')
        mov_genre = input('Enter a Genre: ')
        mov_rating = input('Enter a Movie Rating: ')
        mov_director = input('Enter a Movie Director: ')
        mov_year = input('Enter Movie Year: ')
        mov_actors = input("Enter Actors e.g. ['A. Smith', 'Tom Cruise', 'Jennifer W']: ")


        if len(mov_title) == 0:
            while len(mov_title) == 0 or mov_title == 'EXIT':
                print('Title Cannot be Empty. Please try again. To stop type "EXIT"')
                mov_title = input('Enter a Movie Title: ')
            
        if mov_title != 'EXIT':
            utility.add_movie(mov_title, mov_rating, mov_director, mov_year, mov_actors, mov_genre, movie_db)
