CREATE TABLE users
(
    userid integer NOT NULL,
    name text NOT NULL,
    PRIMARY KEY (userid)
);

CREATE TABLE movies
(
    movieid integer NOT NULL,
    title text NOT NULL,
    PRIMARY KEY (movieid)
);

CREATE TABLE taginfo
(
    tagid integer NOT NULL,
    content text NOT NULL,
    PRIMARY KEY (tagid)
);

CREATE TABLE genres
(
    genreid integer NOT NULL,
    name text NOT NULL,
    PRIMARY KEY (genreid)
);

CREATE TABLE ratings
(
    userid integer NOT NULL,
    movieid integer NOT NULL,
    rating numeric NOT NULL,
    "timestamp" bigint NOT NULL,
    PRIMARY KEY (userid, movieid),
    CONSTRAINT movies FOREIGN KEY (movieid)
        REFERENCES movies (movieid),
    CONSTRAINT users FOREIGN KEY (userid)
        REFERENCES users (userid),
    CONSTRAINT rating CHECK (rating >= 0 AND rating <= 5)
);

CREATE TABLE tags
(
    userid integer,
    movieid integer,
    tagid integer,
    "timestamp" bigint,
    CONSTRAINT movieid FOREIGN KEY (movieid)
        REFERENCES movies (movieid),
    CONSTRAINT tagid FOREIGN KEY (tagid)
        REFERENCES taginfo (tagid),
    CONSTRAINT userid FOREIGN KEY (userid)
        REFERENCES users (userid)
);

CREATE TABLE hasagenre
(
    movieid integer,
    genreid integer,
    CONSTRAINT genreid FOREIGN KEY (genreid)
        REFERENCES genres (genreid),
    CONSTRAINT movieid FOREIGN KEY (movieid)
        REFERENCES movies (movieid)
);
