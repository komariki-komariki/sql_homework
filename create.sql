create table if not exists Genre (
	Genre_id serial primary key,
	genre_title varchar(50) not null
);

create table if not exists Artist (
	Artist_id serial primary key,
	Artist_name varchar(50) not null unique
);

create table if not exists Album(
	Album_id serial primary key,
	Year integer not null,
	Album_title varchar(100) not null
);

create table if not exists Genre_artist(
	Genre_artisi_id serial primary key,
	Genre_id integer references Genre(Genre_id) not null,
	Artist_id integer references Artist(Artist_id) not null
);

create table if not exists Album_artist(
	Album_artist_id serial primary key,
	Album_id integer references Album(Album_id) not null,
	Artist_id integer references Artist(Artist_id) not null
);

create table if not exists Track(
	Track_id serial primary key,
	duration integer not null,
	song_title varchar(100) not null,
	Album_Id integer references Album(Album_id) not null
);

create table if not exists Collection(
	Collection_id serial primary key,
	Year integer not null,
	Title varchar(100) not null
);

create table if not exists Tracks_collection(
	Tracks_collection_id serial primary key,
	Collection_id integer references Collection(Collection_id) not null,
	Track_id integer references Track(Track_id) not null
);