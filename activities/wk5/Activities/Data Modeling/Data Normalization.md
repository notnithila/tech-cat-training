# Data Normalization

### **Exercise: Normalize the "UserTracks" Schema to 3NF**

**Scenario:** You are given a table from a music streaming platform database. The table, `UserTracks`, contains information about users, the tracks they've listened to, the artist of each track, and the user's review for the track.

**Unnormalized `UserTracks` Table:**

| UserID | UserName | UserEmail                                     | TracksListened                        | TrackArtists               | TrackReviews                               |
| ------ | -------- | --------------------------------------------- | ------------------------------------- | -------------------------- | ------------------------------------------ |
| 101    | John     | [john@example.com](mailto:john@example.com)   | "Imagine, Let It Be"                  | "John Lennon, The Beatles" | "Loved it!, Classic!"                      |
| 102    | Emily    | [emily@example.com](mailto:emily@example.com) | "Shape of You, Perfect"               | "Ed Sheeran, Ed Sheeran"   | "Catchy!, So romantic!"                    |
| 103    | Alan     | [alan@example.com](mailto:alan@example.com)   | "Hotel California, Bohemian Rhapsody" | "Eagles, Queen"            | "Always a favorite!, Freddie at his best!" |

**Instructions:**

1. **Identify Issues**: Before diving into normalization, list down the issues you observe in the above schema which prevent it from being in 1NF, 2NF, and 3NF.
2. **1NF**:
   - Ensure that each column contains atomic (indivisible) values.
   - Decompose the table such that each track listened, its artist, and its review by the user are represented as individual rows, not as comma-separated lists.
3. **2NF**:
   - Ensure that all non-key attributes are fully functionally dependent on the primary key.
   - Identify any partial dependencies, i.e., any columns that are dependent on only a part of the primary key. Split the table accordingly.
4. **3NF**:
   - Remove columns which are not dependent on the primary key but are dependent on another column in the table.
   - You might need to introduce new tables to ensure every non-key attribute has only one dependency, and that is the primary key.
5. **Final Output**:
   - Sketch the tables you've created in the steps above.
   - Clearly label primary keys and foreign keys for each table.
   - Ensure that your design adheres to the principles of 3NF.
6. **Bonus (Optional)**:
   - For additional practice, try to identify any many-to-many relationships in your 3NF tables and create junction tables to resolve them.

**Expected Output**:

1. Users
2. Tracks (with artists as attributes or in a separate table if they wish to normalize further)
3. UserTrackReviews (a junction table that connects users to tracks and stores reviews)

