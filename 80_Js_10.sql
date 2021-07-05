USE master
GO
alter database [Web_Game_DB] set single_user with rollback immediate
if exists (select * from sysdatabases where name='Web_Game_DB') drop database Web_Game_DB
GO

CREATE DATABASE Web_Game_DB
GO

USE [Web_Game_DB]
GO

-------------------------------------------
CREATE TABLE dbo.[Company](
	coId int NOT NULL identity(1,1) PRIMARY KEY,
	coName nvarchar(63) NOT NULL,
	foundDate date NOT NULL CHECK(foundDate <= getDate()), --(foundation date)
	[description] nvarchar(1027),
	logo nvarchar(255),
	coAddress nvarchar(511),
	coPhone nchar(10),
	coMail nvarchar(255),
	[status] bit,
)
-------------------------------------------
CREATE TABLE dbo.[Game] (
	gId int NOT NULL identity(1,1) PRIMARY KEY,
	Title nvarchar(255) NOT NULL,
	coId int NOT NULL,
	[description] nvarchar(1027),
	version nvarchar(55),
	releaseDate date NOT NULL CHECK(releaseDate <= getDate()),
	rating int CHECK(rating >= 0 AND rating <= 100), --từ 0-100
	price money,
	[state] nvarchar(55) NOT NULL,--(coming soon,available,stopped)
	[status] bit,
	FOREIGN KEY (coId) REFERENCES dbo.[Company](coId),
)
-------------------------------------------
CREATE TABLE dbo.[Galery](
	gId int NOT NULL,
	link nvarchar(255),
	[type] nvarchar(15), --vid, img (prefix), Teaser, Trailer,... vd: imgTeaser, vidGameplay,..
	[status] bit ,
	FOREIGN KEY (gId) REFERENCES dbo.[Game](gId),
) 
-------------------------------------------
CREATE TABLE dbo.[Category](
	caId int NOT NULL identity(1,1) PRIMARY KEY,
	caName nvarchar(63) NOT NULL,
	[description]  nvarchar(1027),
	[status] bit,
)	
-------------------------------------------
CREATE TABLE dbo.[Game_Category] (
	caId int NOT NULL,
	gId int NOT NULL,
	[status] bit,
	FOREIGN KEY (caID) REFERENCES dbo.[Category](caId),
	FOREIGN KEY (gID) REFERENCES dbo.[Game](gId),
)
-------------------------------------------
CREATE TABLE dbo.[Platform](
	plId int NOT NULL identity(1,1) PRIMARY KEY,
	plName nvarchar(63) NOT NULL,
	[description] nvarchar(1027),
	[status] bit,
)	
-------------------------------------------
CREATE TABLE dbo.[Game_Platform] (
	plId int NOT NULL,
	gId int NOT NULL,
	[status] bit,
	FOREIGN KEY (plID) REFERENCES dbo.[Platform](plId),
	FOREIGN KEY (gID) REFERENCES dbo.[Game](gId),
)
-------------------------------------------
CREATE TABLE dbo.[User](
 	[uId] int NOT NULL identity(1,1) PRIMARY KEY,
	username nvarchar(63) NOT NULL UNIQUE,--use to login
	uName nvarchar(63) NOT NULL, -- Display name
	experience int CHECK(experience>=0),  --(lưu là int nhưng sẽ có function để chuyển thành level, vd: level = sqrt(exp/5) + 1
	profilePicture nvarchar(255),
	uMail nvarchar(63),
	uPhone nchar(10),
	uAddress nvarchar(511),
	wallet money,
	system_role nvarchar(63) NOT NULL,
	pass nvarchar(255) NOT NULL,
	[status] bit,
)
-------------------------------------------
CREATE TABLE dbo.[Library](
	[uId] int NOT NULL,
	gId int NOT NULL,
	[Type] nvarchar(63) NOT NULL,
	[status] bit,
	FOREIGN KEY ([uId]) REFERENCES dbo.[User]([uId]),
	FOREIGN KEY (gId) REFERENCES dbo.[Game](gId),
)
-------------------------------------------
CREATE TABLE dbo.[Order](
	oId int NOT NULL identity(1,1) PRIMARY KEY,
	[uId] int NOT NULL,
	orderDate datetime NOT NULL CHECK(orderDate <= getDate()) ,
	[type] nvarchar(63) NOT NULL, --recharge, topup, buygame
	[status] bit,
	total money NOT NULL CHECK (total>=0),
	FOREIGN KEY ([uId]) REFERENCES dbo.[User]([uId]),
)
-------------------------------------------
CREATE TABLE dbo.[Order_Detail](
	oId int NOT NULL,
	gId int NOT NULL,
	price money NOT NULL CHECK (price>=0),
	status bit,
	FOREIGN KEY ([oId]) REFERENCES dbo.[Order]([oId]),
	FOREIGN KEY ([gId]) REFERENCES dbo.[Game]([gId]),
)

CREATE TABLE dbo.[Comment](
	cId int not null identity(1,1) PRIMARY KEY,
	gId int not null,
	[uId] int not null,
	content nvarchar(1027),
	rating int not null,
	status bit,
	FOREIGN KEY ([uId]) REFERENCES dbo.[User]([uId]),
	FOREIGN KEY ([gId]) REFERENCES dbo.[Game]([gId]),
)

-------Add data:
--dbo.[Company]
INSERT INTO Company (coName,coAddress,coMail,coPhone,foundDate,[description],[status],logo) VALUES ('EASport','Redwood City, California, United States','ea.com/sports','0963852741','1991','Siêu hút máu',1,'images/EASport-logo.png');
INSERT INTO Company (coName,coAddress,coMail,coPhone,foundDate,[description],[status],logo) VALUES ('Nintendo','Kyoto, Japan','nintendo.com','0856974123','1889-9-23','Nintendo Co., Ltd. is a Japanese multinational consumer electronics and video game company headquartered in Kyoto. The company was founded in 1889 as Nintendo Karuta by craftsman Fusajiro Yamauchi and originally produced handmade hanafuda playing cards.',1,'images/Nintendo-logo.png');
INSERT INTO Company (coName,coAddress,coMail,coPhone,foundDate,[description],[status],logo) VALUES ('Mihoyo','Shanghai, China','hoyolab.com','0123456789','2011','miHoYo Co., Ltd. is a Chinese video game development and animation studio based in Shanghai, China. Founded in 2012 by three students from Shanghai Jiao Tong University, miHoYo currently employs 2400 people.',1,'images/MiHoYo-logo.jpg');
INSERT INTO Company (coName,coAddress,coMail,coPhone,foundDate,[description],[status],logo) VALUES ('ppy','Japan','osu.ppy.sh/home','0985674123','2007-9-16','apparently tweeting at someone who deletes their account between when you start and finish replying results in you sending a public tweet. wow.',1,'images/PPY-logo.jpg');
INSERT INTO Company (coName,coAddress,coMail,coPhone,foundDate,[description],[status],logo) VALUES ('Ninja Kiwi','Auckland, New Zealand','ninjakiwi.com','0951753842','2006','Ninja Kiwi, previously known as Kaiparasoft Ltd, is a mobile and online video game developer founded in Auckland, New Zealand, in 2006 by brothers Chris and Stephen Harris. Ninja Kiwis first game was a browser based game called Cash Sprint, developed on the Adobe Flash Platform',1,'images/NinjaKiwi-logo.jpg');
INSERT INTO Company (coName,coAddress,coMail,coPhone,foundDate,[description],[status],logo) VALUES ('7th Beat Games','Malaysia','7thbe.at','0321597846','2011-6-1','We make one-button rhythm games!',1,'images/7thbeat-logo.jpg');
INSERT INTO Company (coName,coAddress,coMail,coPhone,foundDate,[description],[status],logo) VALUES ('Mojang','Stockholm, Sweden','minecraft.net','0874596123','2009','Mojang Studios is a Swedish video game developer based in Stockholm. It was founded by the independent video game designer Markus Persson in 2009 as Mojang Specifications for the development and release of Perssons sandbox and survival video game Minecraft',1,'images/Mojang-logo.jpg');
INSERT INTO Company (coName,coAddress,coMail,coPhone,foundDate,[description],[status],logo) VALUES ('Riot Games','West Los Angeles, California, United States','Riotgames.com','0654871293','2006','Riot Games, Inc. is an American video game developer, publisher, and esports tournament organizer based in West Los Angeles, California. The company was founded in September 2006 to develop League of Legends, a multiplayer online battle arena game.',1,'images/riot-logo.jpg');
INSERT INTO Company (coName,coAddress,coMail,coPhone,foundDate,[description],[status],logo) VALUES ('Rockstar Games','New York, United States','rockstargames.com','0512349786','1998','Rockstar Games, Inc. is an American video game publisher based in New York City. The company was established in December 1998 as a subsidiary of Take-Two Interactive, using the assets Take-Two had previously acquired from BMG Interactive.',1,'images/Rockstar-Logo.jpg');
INSERT INTO Company (coName,coAddress,coMail,coPhone,foundDate,[description],[status],logo) VALUES ('Supercell','Helsinki, Finland','supercell.com','0126548793','2010','Supercell Oy is a Finnish mobile game development company based in Helsinki, Finland. Founded on 14 May 2010, the companys debut game was the browser game Gunshine.net, and after its release in 2011, Supercell started developing games for mobile devices. ',1,'images/supercell-logo.jpg');
-------------------------------------------
--dbo.[Game] 
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('FIFA Online 4',1,'2018-5-17','1.18.1200',78,0,'Available','FIFA Online 4 (commonly known as FO4) is a connected online football sport game next to FIFA Online 3 published by Nexon and EA Sports and officially launched for the first time on May 17, 2018. in Korea National on PC host. The mobile version (FIFA Online 4M) was also first launched in July 2018 in Korea.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('MADDEN NFL 21',1,'2020-8-28','1.28',60,59.99,'Available','Madden NFL 21 is an American football video game based on the National Football League, developed by EA Tiburon and published by Electronic Arts. It is an installment of the long-running Madden NFL series.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Animal Crossing: New Horizons',2,'2020-3-20','2.0',94,59.99,'Available','Animal Crossing: New Horizons is a 2020 life simulation game developed and published by Nintendo for the Nintendo Switch; it is the fifth main game in the Animal Crossing series.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Legend of Zelda: Breath of the Wild',2,'2017-3-3','1.3.1',96,59.99,'Available','The Legend of Zelda: Breath of the Wild is a 2017 action-adventure game developed and published by Nintendo for the Nintendo Switch and Wii U consoles.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Super Smash Bros. Ultimate',2,'2018-12-7','11.0',96,59.99,'Available','Super Smash Bros. Ultimate is a 2018 crossover fighting game developed by Bandai Namco Studios and Sora Ltd. and published by Nintendo for the Nintendo Switch. It is the fifth installment in the Super Smash Bros. series, succeeding Super Smash Bros. for Nintendo 3DS and Wii U.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Tetris',2,'1984-6-6','1.0',99,0,'Available','Tetris is a tile-matching video game created by Russian software engineer Alexey Pajitnov in 1984 for the Electronika 60 computer. It has been published by several companies, most prominently during a dispute over the appropriation of the rights in the late 1980s.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Genshin Impact',3,'2020-9-28','1.6',92,0,'Available','Genshin Impact is an action role-playing game developed and published by miHoYo. The game features an open-world environment and action-based battle system using elemental magic and character-switching, and uses gacha game monetization for players to obtain new characters, weapons, and other resources.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Honkai Impact 3rd',3,'2016-10-14','4.6.0 1.1',86,0,'Available','Honkai Impact 3rd, also called Houkai 3rd, is a free-to-play 3D action role-playing mobile game developed and published by miHoYo, and later ported to Microsoft Windows. It is the spiritual successor to Guns GirlZ, using many characters from the previous title in a separate story.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('osu!',4,'2007-9-16','20210520.2',95,0,'Available','osu! is a free-to-play rhythm game primarily developed, published, and created by Dean "peppy" Herbert, written in C# on the .NET framework. Originally released for Microsoft Windows on the 16th of September 2007, the game has also throughout the years been ported to macOS, Linux, Android and iOS.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Bloons TD Battles',5,'2012','6.11',88,0,'Available','Bloons TD Battles. Go head to head with other players in a Bloon-popping battle for victory. From the creators of best-selling Bloons TD 5, this all new Battles game is specially designed for multiplayer combat, featuring the ability to control bloons directly and send them charging past your opponents defenses.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Bloons TD 6',5,'2018-6-14','26.0',96,9.99,'Available','Bloons TD 6 is a 2018 tower defense video game and the sixth game in the Bloons Tower Defense series, developed and published by Ninja Kiwi. It was first released in June 2018 for iOS and Android. The game was ported to Microsoft Windows in December 2018 with a macOS conversion later releasing in March 2020. ',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('A dance of Fire and Ice',6,'2019-1-24','1.12.0',90,5.99,'Available','A Dance of Fire and Ice is a strict rhythm game. Keep your focus as you guide two orbiting planets along a winding path without breaking their perfect equilibrium.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Rhythm Doctor',6,'2020','Early Access',100,15.99,'Coming Soon','Rhythm Doctor is a rhythm game where you heal patients by defibrillating in time to their heartbeats. Learn each patients unique heartbeat and defeat boss viruses trying to sabotage your rhythm, all set to heart-pumping, soul-soothing music.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Minecraft: Java Edition',7,'2011-8-18','1.17',92,26.95,'Available','Minecraft is a sandbox video game developed by Mojang. The game was created by Markus "Notch" Persson in the Java programming language. Following several early private testing versions, it was first made public in May 2009 before fully releasing in November 2011, with Jens Bergensten then taking over development.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Minecraft: Dungeon',7,'2020-3-26','1.9.1.0',88,19.99,'Available','Minecraft Dungeons is an action role-playing game dungeon crawler video game developed by Mojang Studios and Double Eleven and published by Xbox Game Studios. It is a spin-off of the sandbox video game Minecraft and was released for Nintendo Switch, PlayStation 4, Windows, and Xbox One on May 26, 2020.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('League of Legend',8,'2009-10-27','11.10',66,0,'Available','League of Legends, commonly referred to as League, is a 2009 multiplayer online battle arena video game developed and published by Riot Games. Inspired by Defense of the Ancients, a custom map for Warcraft III, Riots founders sought to develop a stand-alone game in the same genre.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Valorant',8,'2020-6-2','2.11',90,0,'Available','Valorant is a free-to-play first-person hero shooter developed and published by Riot Games, for Microsoft Windows. First teased under the codename Project A in October 2019, the game began a closed beta period with limited access on April 7, 2020, followed by an official release on June 2, 2020.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('GTA 5',9,'2013-9-17','1.54',90,29.99,'Available','Grand Theft Auto V is a 2013 action-adventure game developed by Rockstar North and published by Rockstar Games. It is the first main entry in the Grand Theft Auto series since 2008 Grand Theft Auto IV.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Red Dead Redemption 2',9,'2018-8-26','1.14',96,59.99,'Available','Red Dead Redemption 2 is a 2018 action-adventure game developed and published by Rockstar Games. The game is the third entry in the Red Dead series and is a prequel to the 2010 game Red Dead Redemption.',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Clash of Clans',10,'2012-8-2','14.0.12',90,0,'Available','Clash of Clans is a freemium mobile strategy video game developed and published by Finnish game developer Supercell. The game was released for iOS platforms on August 2, 2012, and on Google Play for Android on October 7, 2013',1);
INSERT INTO Game (Title,coId,releaseDate,[version],rating,price,[state],[description],[status]) VALUES ('Brawl Stars',10,'2017-6-5','35.179',86,0,'Available','Brawl Stars is a multiplayer online battle arena and third-person hero shooter video game developed and published by the Finnish video game company Supercell. It was released worldwide on December 12, 2018 on iOS and Android. The game features various game modes, each with a different objective.',1);
-------------------------------------------
--dbo.[Galery]
--Image
INSERT INTO Galery (gId,link,[type],[status]) VALUES (1,'images/fo4.1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (1,'images/Fifaim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (1,'images/fo4.2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (2,'images/madden.1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (2,'images/madden.2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (2,'images/maddenim.jpg','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (3,'images/animal.1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (3,'images/animal.2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (3,'images/Animalim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (4,'images/zelda.1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (4,'images/zelda.2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (4,'images/Zeldaim.jpg','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (5,'images/SuperSmash.1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (5,'images/SuperSmash.2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (5,'images/Supersmim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (6,'images/tetris.1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (6,'images/tetris.2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (6,'images/Tetrisim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (7,'images/Genshin1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (7,'images/Genshin2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (7,'images/Gensim.jpg','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (8,'images/honkai1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (8,'images/honkai2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (8,'images/Honkaiim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (9,'images/osu1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (9,'images/osu2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (9,'images/osuim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (10,'images/Balloonim.jpg','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (10,'images/BloonBattle.1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (10,'images/BloonBattle.2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (11,'images/Bloon6im.jpg','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (11,'images/BloonTD6.1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (11,'images/BloonTD6.2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (12,'images/FireIceim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (12,'images/FireIce1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (12,'images/FireIce2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (13,'images/rhythm1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (13,'images/rhythm2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (13,'images/Doctorim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (14,'images/MineJEim.jpg','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (14,'images/MineJE1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (14,'images/MineJE2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (15,'images/MineDu1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (15,'images/MineDu2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (15,'images/MineDuim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (16,'images/LoLim.jpg','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (16,'images/LOL1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (16,'images/LOL2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (17,'images/Valorant1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (17,'images/Valorant2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (17,'images/Valoim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (18,'images/GTA1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (18,'images/GTA2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (18,'images/GTA5im.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (19,'images/DeadRe1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (19,'images/DeadRe2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (19,'images/DeadReim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (20,'images/clashclan1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (20,'images/clashclan2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (20,'images/Clashim.png','img-po',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (21,'images/Brawl1-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (21,'images/Brawl2-GP.jpg','img-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (21,'images/BrawlStarsim.jpg','img-po',1);
--Background
INSERT INTO Galery (gId,link,[type],[status]) VALUES (1,'images/fo4_background.png','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (2,'images/madden_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (3,'images/animal_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (4,'images/Zelda_background.png','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (5,'images/supersmash_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (6,'images/tetris_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (7,'images/genshin_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (8,'images/honkai3_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (9,'images/osu_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (10,'images/bloons-tdbattle_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (11,'images/Bloons-TD-6_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (12,'images/adofai_background.png','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (13,'images/rhythm-doctor_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (14,'images/mcjava_background.jpeg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (15,'images/minecraft-dungeons_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (16,'images/lol_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (17,'images/valorant_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (18,'images/gta5_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (19,'images/red-dead-redemption-2_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (20,'images/clash-of-clans_background.jpg','img-bg',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (21,'images/brawlstars_background.jpg','img-bg',1);
--Video
INSERT INTO Galery (gId,link,[type],[status]) VALUES (1,'https://www.youtube.com/embed/nzJhovQ4M_s','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (1,'https://www.youtube.com/embed/sG9RGCngsCM','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (1,'https://www.youtube.com/embed/0ZB4prfOOS4','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (2,'https://www.youtube.com/embed/aNA0qA9-kqw','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (2,'https://www.youtube.com/embed/lbUJJtPeOeg','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (2,'https://www.youtube.com/embed/C1xnmWvo1pM','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (3,'https://www.youtube.com/embed/_3YNL0OWio0','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (3,'https://www.youtube.com/embed/8AkEFot5UF0','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (4,'https://www.youtube.com/embed/zw47_q9wbBE','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (4,'https://www.youtube.com/embed/Pi-MRZBP91I','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (5,'https://www.youtube.com/embed/WLu7e8RZoYc','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (5,'https://www.youtube.com/embed/WShCN-AYHqA','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (6,'https://www.youtube.com/embed/HT7ldEvV-1c','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (6,'https://www.youtube.com/embed/WX5ASLWIrNs','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (7,'https://www.youtube.com/embed/HLUY1nICQRY','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (7,'https://www.youtube.com/embed/qsHhaG86Sjw','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (8,'https://www.youtube.com/embed/a0YM0Wo2To4','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (8,'https://www.youtube.com/embed/gpXzQL-B8Wg','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (9,'https://www.youtube.com/embed/JeYCJIRi7iQ','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (9,'https://www.youtube.com/embed/JgU4FaiGM1I','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (10,'https://www.youtube.com/embed/yzYnX68LMS0','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (10,'https://www.youtube.com/embed/5IUhBl9hIQw','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (11,'https://www.youtube.com/embed/PvFaD6g6yzk','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (11,'https://www.youtube.com/embed/8zG-Zs2J_N0','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (12,'https://www.youtube.com/embed/Bqj-tnv5K2c','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (12,'https://www.youtube.com/embed/0qbkoXwVJVc','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (13,'https://www.youtube.com/embed/BaF2YFhLaok','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (13,'https://www.youtube.com/embed/7F8_Oc-rt_A','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (14,'https://www.youtube.com/embed/MmB9b5njVbA','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (14,'https://www.youtube.com/embed/VEAaORjTDTY','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (15,'https://www.youtube.com/embed/KCbE47v1qVk','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (15,'https://www.youtube.com/embed/Y-YaC5M4ois','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (16,'https://www.youtube.com/embed/7O21Z6vgtmY','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (16,'https://www.youtube.com/embed/vzHrjOMfHPY','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (16,'https://www.youtube.com/embed/PPWFSCWJL_0','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (17,'https://www.youtube.com/embed/KbFWhffLM-A','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (17,'https://www.youtube.com/embed/eMv-eAzaJYc','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (18,'https://www.youtube.com/embed/QkkoHAzjnUs','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (18,'https://www.youtube.com/embed/kEqBkggQoic','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (19,'https://www.youtube.com/embed/eaW0tYpxyp0','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (19,'https://www.youtube.com/embed/GU5vd5Z28UQ','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (20,'https://www.youtube.com/embed/Q6NkGf9nEvM','vid-trailer',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (20,'https://www.youtube.com/embed/jYWJt9LPXfc','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (21,'https://www.youtube.com/embed/ptRsyrfnLEg','vid-gp',1);
INSERT INTO Galery (gId,link,[type],[status]) VALUES (21,'https://www.youtube.com/embed/lqmZgIlB8PQ','vid-trailer',1);
-------------------------------------------
--dbo.[Category]
INSERT INTO Category (caName,[description],[status])	VALUES('Rhythm game','Rocking to the beat!',1);
INSERT INTO Category (caName,[description],[status])	VALUES('RPG','Role Playing Games',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Sport','Its like in real life sport, but games!',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Casual','Just relax',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Tower Defense','Dont let them in!',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Puzzle','Spice up your mind',1);
INSERT INTO Category (caName,[description],[status])	VALUES('MOBA','Multiplayer Online Battle Arena',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Battle Royale','Last man standing',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Horror','Watch your back!!!',0);
INSERT INTO Category (caName,[description],[status])	VALUES('Shooter','Pick up your gun and stand up, soldier!',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Fighting','Beating to the rock!',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Survival','Can you pass the nights?',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Online','You need internet bro!',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Offline','For the power-outage',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Singleplayer','Sad and alone, or just alone!',1);
INSERT INTO Category (caName,[description],[status])	VALUES('Multiplayer','Sad and not alone, or just sad!',1);
-------------------------------------------
--dbo.[Game_Category] 
--Rhythm
INSERT INTO Game_Category(caId,gId,[status]) VALUES(1,9,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(1,12,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(1,13,1);
--RPG
INSERT INTO Game_Category(caId,gId,[status]) VALUES(2,3,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(2,4,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(2,5,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(2,7,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(2,8,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(2,14,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(2,15,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(2,18,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(2,19,1);
--Sport
INSERT INTO Game_Category(caId,gId,[status]) VALUES(3,1,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(3,2,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(3,21,1);
--Casual
INSERT INTO Game_Category(caId,gId,[status]) VALUES(4,3,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(4,6,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(4,20,1);
-- TD
INSERT INTO Game_Category(caId,gId,[status]) VALUES(5,11,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(5,10,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(5,20,1);
--Puzzle
INSERT INTO Game_Category(caId,gId,[status])	VALUES(6,6,1);
--MOBA
INSERT INTO Game_Category(caId,gId,[status]) VALUES(7,16,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(7,21,1);
--Batle royale
INSERT INTO Game_Category(caId,gId,[status]) VALUES(8,21,1);
--Horror
--Shooter
INSERT INTO Game_Category(caId,gId,[status]) VALUES(10,17,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(10,21,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(10,18,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(10,19,1);
--Fighting
INSERT INTO Game_Category(caId,gId,[status]) VALUES(11,5,1);
--surv
INSERT INTO Game_Category(caId,gId,[status]) VALUES(12,14,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(12,15,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(12,19,1);
--onl
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,1,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,2,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,3,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,5,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,6,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,7,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,8,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,9,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,10,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,11,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,14,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,15,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,16,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,17,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,18,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,19,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,20,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(13,21,1);
--off
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,4,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,5,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,6,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,9,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,11,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,12,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,13,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,14,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,15,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,18,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(14,19,1);
--single
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,3,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,4,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,5,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,6,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,7,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,8,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,9,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,11,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,12,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,13,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,14,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,15,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,18,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,19,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(15,20,1);
--multi
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,1,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,2,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,3,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,5,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,6,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,7,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,9,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,10,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,11,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,14,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,15,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,16,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,17,1); 
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,18,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,19,1);
INSERT INTO Game_Category(caId,gId,[status]) VALUES(16,21,1);
-------------------------------------------
--dbo.[Platform]
INSERT INTO [Platform] (plName,[description],[status]) VALUES('PS','PlayStation',1);
INSERT INTO [Platform] (plName,[description],[status]) VALUES('XBox','Not PlayStation',1);
INSERT INTO [Platform] (plName,[description],[status]) VALUES('PC','Windows only, Mac get out',1);
INSERT INTO [Platform] (plName,[description],[status]) VALUES('Mobile','Android, IOS and Tablets',1);
INSERT INTO [Platform] (plName,[description],[status]) VALUES('NS','Nintendo Switch',1);
-------------------------------------------
--dbo.[Game_Platform] 
--PS
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(1,4,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(1,5,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(1,6,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(1,7,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(1,14,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(1,15,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(1,18,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(1,19,1);
--XBOX
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(2,5,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(2,4,1);
--PC
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,1,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,2,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,3,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,4,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,5,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,6,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,7,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,9,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,10,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,11,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,12,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,13,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,14,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,15,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,16,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,17,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,18,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(3,19,1);
--Mobile
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(4,7,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(4,8,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(4,10,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(4,11,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(4,12,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(4,20,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(4,21,1);
--NS
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(5,4,1);
INSERT INTO Game_Platform(plId,gId,[status]) VALUES(5,5,1);
-------------------------------------------
--dbo.[User]
INSERT INTO [User](username,system_role,uName,pass,[status],experience,uAddress,uMail,uPhone,wallet) VALUES ('vietndd0','Owner','Nguyen Dong Duc Viet','123456',1,100,'Hai Duong, Viet Nam','vietndd0@gmail.com','0123456789',69.69);
INSERT INTO [User](username,system_role,uName,pass,[status],experience,uAddress,uMail,uPhone,wallet) VALUES ('tuanpa0','Admin','Pham Anh Tuan','123456',1,200,'Ha Noi, Viet Nam','tuanpa0@gmail.com','0147852369',420.00);
INSERT INTO [User](username,system_role,uName,pass,[status],experience,uAddress,uMail,uPhone,wallet) VALUES ('duongvv0','Admin','Vu Van Duong','123456',1,300,'Hai Duong, Viet Nam','duongvv0@gmail.com','0951748263',714.30);
INSERT INTO [User](username,system_role,uName,pass,[status],experience,uAddress,uMail,uPhone,wallet) VALUES ('duongnh0','Admin','Nguyen Hoang Duong','123456',1,400,'Ha Noi, Viet Nam','duongnh0@gmail.com','0641523987',30.125);
INSERT INTO [User](username,system_role,uName,pass,[status],experience,uAddress,uMail,uPhone,wallet) VALUES ('chucnv0','Admin','Nguyen Van Chuc','123456',1,500,'Hai Duong, Viet Nam','chucnv0@gmail.com','0521346789',666.66);
INSERT INTO [User](username,system_role,uName,pass,[status],experience,uAddress,uMail,uPhone,wallet) VALUES ('tungnhh1','User','Nguyen Huu Hai Tung','123456',1,600,'Ca Mau, Viet Nam','tungnhh0@gmail.com','0154782369',999);
-------------------------------------------
--dbo.[Library]
INSERT INTO [Library]([uId],gId,type,[status]) VALUES(1,1,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(1,2,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(1,3,'owned',1);

INSERT INTO [Library]([uId],gId,type,[status]) VALUES(2,1,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(2,2,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(2,3,'owned',1);
INSERT INTO [Library]([uId],gId,type,[status]) VALUES(2,4,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(2,5,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(2,10,'owned',1);
INSERT INTO [Library]([uId],gId,type,[status]) VALUES(2,9,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(2,11,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(2,17,'owned',1);

INSERT INTO [Library]([uId],gId,type,[status]) VALUES(3,2,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(3,16,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(3,19,'owned',1);
INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,1,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,2,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,3,'owned',1);
INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,4,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,5,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,6,'owned',1);
INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,7,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,8,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,9,'owned',1);
INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,10,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,11,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,12,'owned',1);
INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,13,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,14,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,15,'owned',1);
INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,16,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,17,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,18,'owned',1);
INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,19,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,20,'owned',1);	INSERT INTO [Library]([uId],gId,type,[status]) VALUES(6,21,'owned',1);
-------------------------------------------
--dbo.[Order]
INSERT INTO [Order]([uId],total,orderdate,[status]) VALUES (1,99.99,'2020-1-26',1);
INSERT INTO [Order]([uId],total,orderdate,[status]) VALUES (2,46,'2021-6-12',1);
INSERT INTO [Order]([uId],total,orderdate,[status]) VALUES (2,78.56,'2021-3-30',1);
-------------------------------------------
--dbo.[Order_Detail]
INSERT INTO [Order_Detail](oId,gId,price,[status]) VALUES (1,3,20,1);INSERT INTO [Order_Detail](oId,gId,price,[status]) VALUES (1,5,59.99,1);INSERT INTO [Order_Detail](oId,gId,price,[status]) VALUES (1,20,20,1);
INSERT INTO [Order_Detail](oId,gId,price,[status]) VALUES (2,19,46,1);
INSERT INTO [Order_Detail](oId,gId,price,[status]) VALUES (3,17,28.56,1);INSERT INTO [Order_Detail](oId,gId,price,[status]) VALUES (3,9,50,1);
