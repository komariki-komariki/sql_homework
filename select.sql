SELECT genre_title, COUNT(genre_title) FROM Genre
JOIN Genre_artist ON Genre_artist.Genre_id = genre.Genre_id
GROUP BY genre_title;	 

SELECT Album.Album_title, COUNT(Track.Track_id) FROM Track
JOIN Album ON Album.Album_id = track.Album_id
WHERE Year BETWEEN 2019 AND 2020
GROUP BY album.Album_title;

SELECT Album.Album_title, round(AVG(duration)) FROM  Track
JOIN Album ON Album.Album_id = track.Album_id
GROUP BY Album.Album_title;

SELECT Artist.Artist_name FROM Artist
JOIN Album_artist ON Artist.Artist_id = Album_artist.Artist_id
JOIN Album ON Album_artist.Album_id = Album.Album_id
WHERE year != 2020;

SELECT Collection.Title FROM Tracks_collection
JOIN Collection ON Collection.collection_id = Tracks_collection.collection_id
JOIN Track ON Tracks_collection.track_id = Track.track_id
JOIN Album on Track.Album_id = Album.album_id
JOIN Album_artist ON Album.album_id = Album_artist.album_id
JOIN Artist ON Artist.artist_id = Album_artist.artist_id
WHERE Artist.Artist_name = 'Artist_6'
GROUP BY Collection.Title;

SELECT Album.Album_title FROM Album_artist
JOIN Album ON Album_artist.Album_id = Album.Album_id
JOIN Artist ON Album_artist.Artist_id = Artist.artist_id
JOIN Genre_artist ON Artist.artist_id = Genre_artist.artist_id
JOIN Genre ON Genre_artist.genre_id = Genre.genre_id
GROUP BY Album.Album_title
HAVING COUNT(Genre.genre_title) > 1;

SELECT Track.song_title FROM Track
FULL OUTER JOIN Tracks_collection ON Track.track_id = Tracks_collection.track_id
LEFT JOIN collection ON Tracks_collection.collection_id = collection.collection_id
WHERE collection.collection_id IS NULL;

SELECT Artist.Artist_name, Track.duration from Artist
JOIN Album_artist ON Artist.artist_id = Album_artist.artist_id
JOIN Album ON Album_artist.album_id = Album.album_id
JOIN Track ON Album.album_id = Track.Album_id
WHERE Track.duration = (SELECT MIN(Track.duration) FROM track);

SELECT Album.Album_title, COUNT(Track.Track_id) FROM Album
JOIN Track ON Album.album_id = Track.album_id
GROUP BY Album.Album_title
HAVING COUNT(Track.track_id) = (SELECT MIN(count) FROM
                                (SELECT Album.Album_title, COUNT(Track.track_id) count FROM Track
                                JOIN Album ON Album.album_id = Track.album_id
                                GROUP BY Album.Album_title)  as c
                            );	