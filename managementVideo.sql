CREATE DATABASE MANAGEMENTVIDEO
GO
USE MANAGEMENTVIDEO
GO

CREATE TABLE GENRES(
IDGENRE INT PRIMARY KEY IDENTITY,
GENRE NVARCHAR(50) NOT NULL
)
GO
CREATE TABLE VIDEO(
IDVIDEO VARCHAR(200) PRIMARY KEY,
TITLE NVARCHAR(100) NOT NULL,
POSTER VARCHAR(100) NOT NULL,
VIEWSS INT not null,
DESCRIPTIONS NVARCHAR(max) NOT NULL,
ACTIVE BIT NOT NULL,
IDGENRE INT NOT NULL,
director nvarchar(70) not null,
actor nvarchar(200)

constraint fk_GENRE
foreign key(IDGENRE)
references GENRES(IDGENRE)
ON UPDATE CASCADE
)

GO

CREATE TABLE USERS(
ID VARCHAR(40) PRIMARY KEY,
PASSWORDS VARCHAR(50) NOT NULL,
EMAIL VARCHAR(60),
FULLNAME NVARCHAR(60) NOT NULL,
ROLES BIT NOT NULL
)
go
CREATE TABLE FAVORITE(
ID INT PRIMARY KEY identity,
USERSID VARCHAR(40),
VIDEOID VARCHAR(200),
LIKEDATE DATE NOT NULL

constraint fk_user
foreign key(usersid)
references users(id),

constraint fk_video
foreign key(videoid)
references video(idVIDEO)
ON DELETE CASCADE
ON UPDATE CASCADE
)
go
CREATE TABLE SHARE(
ID INT PRIMARY KEY IDENTITY,
USERSID VARCHAR(40),
VIDEOID VARCHAR(200),
EMAIL VARCHAR(60),
SHAREDATE DATE NOT NULL


constraint fk_user_SHARE
foreign key(usersid)
references users(id),

constraint fk_video_SHARE
foreign key(videoid)
references video(idVIDEO)
ON DELETE CASCADE
ON UPDATE CASCADE
)

GO
CREATE TABLE COMMENT(
ID INT IDENTITY PRIMARY KEY,
TEXT NVARCHAR(200),
USERSID VARCHAR(40),
VIDEOID VARCHAR(200),
dateComment date

constraint fk_user_COMMENT
foreign key(usersid)
references users(id),

constraint fk_video_COMMENT
foreign key(videoid)
references video(idVIDEO)
ON DELETE CASCADE
ON UPDATE CASCADE
)
go


GO
set identity_insert GENRES on
INSERT INTO GENRES(IDGENRE,GENRE) VALUES
(1,'Horror'),
(2,'Hollywood'),
(3,'Crime'),
(4,'Action'),
(5,'Comedies'),
(6,'Fantasy'),
(7,'Dramas'),
(8,'Romance'),
(9,'Music & Musicals'),
(10,'Sports'),
(11,'International'),
(12,'Documentaries')
set identity_insert GENRES OFF

insert into users (id, passwords, email, fullname, roles) values ('Brightdog', '12345678a', 'glaroze0@kickstarter.com', 'Gonzales Laroze', 0);
insert into users (id, passwords, email, fullname, roles) values ('Pixope', '12345678a', 'hdat1@kickstarter.com', 'Hulda Dat', 0);
insert into users (id, passwords, email, fullname, roles) values ('Agivu', '12345678a', 'dtatteshall2@mac.com', 'Dorthea Tatteshall', 0);
insert into users (id, passwords, email, fullname, roles) values ('Browsezoom', '12345678a', 'ehinze3@hostgator.com', 'Eddie Hinze', 0);
insert into users (id, passwords, email, fullname, roles) values ('Gabvine', '12345678a', 'wkobieriecki4@php.net', 'Weidar Kobieriecki', 1);

insert into video (idvideo, title, poster, viewss, descriptions, active,IDGENRE,director,actor) values 
('6dSKUoV0SNI','ESCAPE ROOM','poster-escape-room.png',0,
'Six people unwittingly find themselves locked in another series of escape rooms, 
slowly uncovering what they have in common to survive -- 
and discovering they have all played the game before.',1,1,'Adam Robitel','Taylor Russell,Zoey Davis,
Logan Miller,Ben Miller,Jay Ellis,Jason Walker,Tyler Labine,Mike Nolan,Deborah Ann Woll, Amanda Harper'),

('6cwNyNmJrjM','Ashin of the North','poster-kingdom-ashin-the-north.jpg',0,
'Kingdom: Ashin of the North is described as a sidequel of Kingdom (2019) season two and a backstory about the mysterious character Lee Chang 
group encountered on their journey to north to discover the origins of the infected.',1,1,'Kim Seong-Hun',
'Gianna Jun,Kim Si-A,Kim Roe-Ha,Jeon Su-Ji,Kim Dam-Ho,Park Byung-Eun,Ji Hyun-Joon,Jung Suk-Won,Kwon Bum-Taek,Kwon Hyuk-Bum'),

('odM92ap8_c0','Godzilla vs. Kong','poster-godzilla.png',0,
'Kong and his protectors undertake a perilous journey to find his true home, and with them is Jia, 
a young orphaned girl with whom he has formed a unique and powerful bond. But they unexpectedly find 
themselves in the path of an enraged Godzilla, cutting a swath of destruction across the globe.',1,1,'Adam Wingard',
'Alexander Skarsgård,Nathan Lind,Millie Bobby Brown,Madison Russell,
Rebecca Hall,Ilene Andrews,Brian Tyree Henry,Bernie Hayes,Shun Oguri.'),

('Z_7eN5iloyk','Midway','poster-mid-way.png',0,
'Battle of Midway, (June 3–6, 1942), World War II naval battle, fought almost 
entirely with aircraft, in which the United States destroyed Japan 
first-line carrier strength and most of its best trained naval pilots.',1,1,'Roland Emmerich',
'Ed Skrein,Dick Best,Patrick Wilson,Edwin Layton,Woody Harrelson, 
Chester W. Nimitz,Luke Evans,Wade McClusky,Mandy Moore,Ann Best'),

('WR7cc5t7tv8','A Quiet Place','poster-quite-place.png',0,
'A family must live in silence to avoid mysterious creatures that hunt by sound. 
Knowing that even the slightest whisper or footstep can bring death, Evelyn and Lee are determined to find a way to protect
their children while desperately searching for a way to fight back.',1,1,'John Krasinski',
'Emily Blunt,Evelyn Abbott,John Krasinski,Lee Abbott,
Millicent Simmonds,Regan Abbott,Noah Jupe,Marcus Abbott,Cade Woodward,Beau Abbott'),

('4q6UGCyHZCI','RESIDENT EVIL','poster-residentevil.png',0,
'Resident Evil, known in Japan as Biohazard, is a Japanese horror video game series and media franchise created by Capcom. 
It consists of survival horror, third-person shooter, and first-person shooter games.',1,1,'Paul W. S. Anderson',
'Kaya Scodelario,Claire Redfield,Robbie Amell,Chris Redfield,Hannah John-Kamen,Jill Valentine, 
Tom Hopper,Albert Wesker, Avan Jogia Leon'),

('gzy6ORqE9IY','Saw','poster-saw9.png',0,
'It is the ninth installment of the Saw film series. The film stars Chris Rock, Max Minghella, Marisol Nichols, and Samuel L.
Jackson, and follows police efforts to stop a Jigsaw copycat killer.',1,1,'Darren Lynn Bousman',
'Chris Rock,Detective Zeke Banks , Samuel L. Jackson ,Marcus Banks ,Max Minghella ,Detective William Schenk ;
Marisol Nichols ,Captain Angie Garza'),

('zcI6SFiK_yk','TEXAS CHAINSAW MASSACRE','poster-texas-chainsaw-massacre.jpg',0,
'A group of five hippies on a road trip through the backwaters of 1970 rural Texas fall prey to a murderous cannibalistic family making up of a leather-masked chainsaw-wielding maniac, his knife-wielding grave 
robber brother, and their cannibal chief father and decaying grandfather.',1,1,'Tobe Hooper',
'Marilyn Burns Sally ,Edwin Neal Hitchhiker , Allen Danziger Jerry ,Paul A. Partain Franklin ,William Vail'),

('RXMp9fBomJw','The Purge: Election Year','poster-the-purge-election-year.png',0,
'It is been two years since Leo Barnes (Frank Grillo) stopped himself from a regrettable act of revenge on Purge Night. 
Now serving as head of security for Senator Charlie Roan (Elizabeth Mitchell), his mission is to protect her in a run for 
president and survive the annual ritual that targets the poor and innocent.',1,1,'James DeMonaco',
'Frank Grillo Leo Barnes ,Elizabeth Mitchell ,Senator Charlie Roan ,Mykelti Williamson Joe Dixon,
Joseph Julian Soria Marcos ,Betty Gabriel.'),

('Vfugwq2uoa0','The Ritual','poster-the-ritual.png',0,
'A group of old college friends reunite for a trip to a forest in Sweden, Eastern Europe,
but encounter a menacing presence there stalking them. A group of old college friends reunite for a trip to a forest in Sweden,
Eastern Europe, but encounter a menacing presence there stalking them.',1,1,'David Bruckner',
'Rafe Spall  Luke , Arsher Ali  Phil , Robert James-Collier  Hutch , Sam Troughton  Dom , Paul Reid  Robert'),

('Y-ufZuqTd5c','The Silence','poster-the-silence.jpg',0,
'When the world is under attack from terrifying creatures who hunt their human prey by sound, 
16-year old Ally Andrews (Kiernan Shipka), who lost her hearing at 13, and her family seek 
refuge in a remote haven. But they discover 
a sinister cult who are eager to exploit Ally heightened senses.',1,1,'John R. Leonetti',
'Stanley Tucci  Hugh Andrews , Kiernan Shipka  Ally Andrews , Miranda Otto  Kelly Andrews , Kate Trotter ·
Lynn , John Corbett  Glenn'),

('pyWuHv2-Abk','Train to Busan','poster-train-to-busan.png',0,
'TRAIN TO BUSAN is a harrowing zombie horror-thriller that follows a group 
of terrified passengers fighting their way through a countrywide viral outbreak while
trapped on a suspicion-filled, blood-drenched bullet train ride to Busan,
a southern resort city that has managed to hold off the zombie hordes',1,1,'Yeon Sang-ho',
'Gong Yoo Seok-woo , Yu-mi Jung  Seong-kyeong , Ma Dong-seok  Sang-hwa , Su-an Kim  Soo-an , Kim Eui-sung  Yon-suk'),

('Lgj4GjqCFlY','Unfriended','poster-unfriend.png',0,
'A group of online chatroom friends find themselves haunted by a mysterious, supernatural force using the
account of their dead friend. While video-chatting one night, six high-school friends receive a 
Skype message from a classmate who killed herself exactly one year ago.',1,1,'Levan Gabriadze',
'Heather Sossaman  Laura , Matthew Bohrer  Matt , Courtney Halverson  Val , Shelley Hennig  Blaire , Moses Storm  Mitch'),

('8m9EVP8X7N8','Zombieland','poster-zombieland.png',0,
'The horror comedy Zombieland focuses on two men who have found a way to survive a world ruled by zombies. Columbus is a big wuss -- 
but when you are afraid of being eaten by zombies, fear can keep you alive.',1,1,'Ruben Fleischer',
'Jesse Eisenberg , Woody Harrelson ,Emma Stone Abigail Breslin , Amber Heard , Bill Murray  Derek Graf , Cesar Aguirre.'),

--hollywood --
('X9ebeNKkc08','The Adam Project','poster-adam-project.jpg',0,
'After accidentally crash-landing in 2022, time-traveling fighter pilot Adam Reed 
teams up with his 12-year-old self for a mission to save the future.',1,2,'Shawn Levy',
'Ryan Reynolds ,Big Adam ,Walker Scobell,Young Adam,Mark Ruffalo,Louis Reed ; 
Jennifer Garner,Ellie Reed,Zoe Saldana,Laura'),

('tI1JGPhYBS8','Army of the Dead','poster-army-of-the-dead.jpg',0,
'After a zombie outbreak in Las Vegas, a group of mercenaries take the ultimate gamble and venture into 
the quarantine zone in hopes of pulling off an impossible heist.',1,2,'Zack Snyder',
'Dave Bautista ,Scott Ward ,Ella Purnell, Kate Ward, Ana de la Reguera · 
Maria Cruz, Omari Hardwick, Vanderohe, Theo Rossi, Burt Cummings '),

('s-7pyIxz8Qg','Catch Me if You Can','poster-catch-me-if-ucan.png',0,
'Notorious con artist Frank Abagnale has duped people worth millions of dollars with his masterful art of deception. 
With his scams getting bolder, he is soon pursued by FBI agent Carl Hanratty.',1,2,'Steven Spielberg',
'Leonardo DiCaprio, Frank Abagnale, Tom Hanks, Carl Hanratty, Christopher Walken 
Frank Abagnale, Martin Sheen, Roger Strong, Nathalie Baye Paula'),

('lyy7y0QOK-0','CHAPPIE','poster-chappie.png',0,
'A law enforcing robot (agent 22) is severely damaged during an encounter between two rival criminal gangs. 
His creator recommends that this police droid be dismantled & recycled. However, 
this Bot is infused with new life and emotions after a 
group of criminals abduct the creator and force him to modify the machine.',1,2,'Neill Blomkamp',
'Sharlto Copley, Chappieas Chappie, Dev Patel, Deon Wilsonas Deon Wilson, Hugh Jackman, Vincent Mooreas Vincent Moore.'),

('7vUQYzZ_UZc','Choose or Die','poster-choose-die.jpg',0,
'After firing up a lost 80s survival horror game, a young coder unleashes a hidden curse that tears reality apart, 
forcing her to make terrifying decisions and face deadly consequences.',1,2,'Toby Meakins',
'Iola Evans, Kayla Asa Butterfield Isaac, Robert Englund, Robert Englund, Angela Griffin, Thea Ryan Gage Lance'),

('CI4EjV_x_PQ','Escape Plan','poster-escape-plan.png',0,
'When a structural-security authority finds himself set up and incarcerated in the world
most secret and secure prison, he has to use his skills to escape with help from the inside.',1,2,'Mikael Håfström',
'Breslin Arnold Schwarzenegger Rottmayer, Hobbes Faran Tahir Javed, Abigail, Sam Neill, Dr. Kyrie, Lester Clark Vinnie Jones.'),

('txCZIVpzcq8','John Wick','poster-joinwick.png',0,
'John is a legendary hitman who had retired until a gang invades his house, steals his car, 
and kills the puppy that his late wife Helen had given him.',1,2,'Chad Stahelski',
'John Wick, Michael Nyqvist, Viggo Tarasov, Iosef Tarasov, Willem Dafoe Marcus, Avi 
Adrianne Palicki, Ms. Perkins, Gregori Toby Leonard Moore.'),

('zAGVQLHvwOY','JOKER','poster-joker.png',0,
'The Joker, initially portrayed as a small-time crook, was disfigured and driven insane by an accident with toxic 
chemicals. He was depicted with chalk-white skin, ruby-red lips permanently fixed in a demonic grin,
and bright green hair.',1,2,'Todd Phillips',
'Joaquin Phoenix,Arthur Fleck, Robert De Niro, Murray Franklin, Zazie Beetz, Sophie Dumond, Frances Conroy, Penny Fleck 
, Brett Cullen, Thomas'),

('2QKg5SZ_35I','JUMANJI: WELCOME TO THE JUNGLE','poster-jumanji.png',0,
'Four teenagers are sucked into a magical video game, and the only way they can escape is to work together to finish the game.
In a brand-new Jumanji adventure, four high-school kids discover an old video-game console and are drawn into the game
jungle setting, literally becoming the adult avatars they chose.',1,2,'Jake Kasdan, Joe Johnston',
'Robin Williams,Jonathan Hyde, Kirsten Dunst, Bradley Pierce, Bonnie Hunt, Bebe Neuwirth, David Alan Grier,
Patricia Clarkson.'),

('DdIHtymX_Fc','Love and Monsters','poster-love-and-monster.jpg',0,
'Seven years after he survived the monster apocalypse, lovably hapless Joel leaves his cozy underground bunker 
behind on a quest to reunite with his ex. Seven years after he survived the monster apocalypse, lovably
hapless Joel leaves his cozy underground bunker behind on a quest to reunite with his ex.',1,2,'Michael Matthews',
'Dylan O Brien Joel,Jessica Henwick, Aimee Michael Rooker Clyde, Dan Ewing,  Cap Ariana Greenblatt Minnow'),

('4I8rVcSQbic','Now You See Me','poster-now-you-see.png',0,
'An F.B.I. Agent and an Interpol Detective track a team of illusionists who pull off bank heists during their performances, and reward their 
audiences with the money. Four magicians each answer a mysterious summons to an obscure address with secrets inside.',1,2,'Louis Leterriers',
'Jesse Eisenberg, J Daniel Atlas, Common Evans, Mark Ruffalo, Dylan Rhodes, 
Woody Harrelson, Merritt McKinney, Isla Fisher, Henley Reeves'),

('QNNcl2mEHzQ','The Outsider','poster-out-sider.jpg',0,
'An eleven-year-old boys violated corpse is discovered in a town park. Eyewitnesses and fingerprints point unmistakably to one of Flint City
most popular citizens—Terry Maitland, Little League coach, English teacher, husband, and father of two girls.',1,2,'Martin Zandvliet',
'Jared Leto, Nick Lowell, Tadanobu Asano, Kiyoshi Kippei Shîna, Orochi Shioli Kutsuna, Miyu Emile Hirsch, Paulie Bowers'),

('Pj0wz7zu3Ms','RED NOTICE','poster-red-notice.jpg',0,
'Red Notice is a 2021 American action comedy film written, directed, and produced by Rawson Marshall Thurber. Dwayne Johnson, who also served as a producer, stars as an FBI agent
who reluctantly teams up with a renowned art thief (Ryan Reynolds) 
in order to catch an even more notorious criminal (Gal Gadot).',1,2,'Rawson Marshall Thurber',
'Dwayne Johnson, John Hartley, Ryan Reynolds, Nolan Booth, Gal Gadot, The Bishop, Ritu Arya, Inspector Urvashi Das, Chris Diamantopoulos · Sotto'),

('JfVOs4VSpmA','SPIDER-MAN: NO WAY HOME','poster-spider-man.png',0,
'When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly 
means to be Spider-Man. Peter Parker secret identity is
revealed to the entire world. Desperate for help, Peter turns to Doctor Strange
to make the world forget that he is Spider-Man.',1,2,'Jon Watts',
'Tom Holland Peter Parker, Zendaya MJ Benedict Cumberbatch, Doctor Strange Jacob Batalon Ned Leeds, Jon Favreau, Happy Hogan'),

('v_0GJg_Jnlo','The Woman in the Window','poster-the-women-in-the-window.png',0,
'Anna Fox (Amy Adams) is an agoraphobic child psychologist who finds herself keeping
tabs on the picture perfect family across the street through
the windows of her New York City brownstone. Her life is turned upside down when
she inadvertently witnesses a brutal crime.',1,2,'Joe Wright',
'Amy Adams Anna Fox, Gary Oldman Alistair Russell, Anthony Mackie Ed, Fred Hechinger Ethan Russell, Julianne Moore Jane Russell 1')

go
set identity_insert favorite on
insert into favorite (id, usersid, videoid,likedate) values (1,'Brightdog','JfVOs4VSpmA','2022-06-07');
insert into favorite (id, usersid, videoid,likedate) values (2,'Pixope', 'v_0GJg_Jnlo','2022-06-07');
set identity_insert favorite OFF

go
set identity_insert Comment on
insert into COMMENT(id, usersid, videoid,text,dateComment) values (1,'Brightdog','JfVOs4VSpmA','Good movie','2022-06-07');
insert into COMMENT(id, usersid, videoid,text,dateComment) values (2,'Pixope', 'v_0GJg_Jnlo',N'Phim tạm ổn','2022-06-07');
insert into COMMENT(id, usersid, videoid,text,dateComment) values (3,'Pixope', 'JfVOs4VSpmA',N'Phim hay quá','2022-06-07');
insert into COMMENT(id, usersid, videoid,text,dateComment) values (4,'Pixope', 'JfVOs4VSpmA',N'Phim này phần nào cũng hay','2022-06-07');
set identity_insert Comment OFF



go
CREATE PROC spFavoriteByYear(@Year int)
AS
BEGIN
SELECT
v.Title AS 'Group',
count(f.VIDEOID) AS 'Likes',
max(f.LikeDate) AS 'Newest',
min(f.LikeDate) AS 'Oldest'
FROM Favorite f JOIN Video v ON v.IdVideo = f.videoid
WHERE year(f.LikeDate) = @Year
GROUP BY v.Title
END

