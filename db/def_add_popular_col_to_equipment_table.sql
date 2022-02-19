ALTER TABLE Equipment ADD popular int default 0 CONSTRAINT popular_check  CHECK (popular >= 0);

update  Equipment set popular = 100 where id in (4, 5, 6, 7, 10, 11, 17, 18, 24, 
25, 29, 32, 36, 37, 45, 46, 51, 52, 53, 56);