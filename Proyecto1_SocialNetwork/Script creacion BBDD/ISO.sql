USE ISOII;
DROP TABLE IF EXISTS Notification;
DROP TABLE IF EXISTS Message;
DROP TABLE IF EXISTS PublisherReviewer;
DROP TABLE IF EXISTS Follows;
DROP TABLE IF EXISTS ArticleReview;
DROP TABLE IF EXISTS ReviewerTag;
DROP TABLE IF EXISTS ArticleTag;
DROP TABLE IF EXISTS Tag;
DROP TABLE IF EXISTS Article;
DROP TABLE IF EXISTS Publisher;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Reviewer;
DROP TABLE IF EXISTS User;

-- -----------------------------------------------------
-- Creamos la base de datos, cargándonos la anterior ---
-- -----------------------------------------------------

DROP DATABASE ISOII; 
CREATE DATABASE ISOII; 
USE ISOII; 

-- -------------
-- -  CREATES  -
-- -------------
 
CREATE TABLE User (
    email VARCHAR (50),
    name VARCHAR (50),
    second_name VARCHAR (50),
    birth_date DATE,
    city VARCHAR (50),
    pass VARCHAR (50),
    rol VARCHAR (10),
    PRIMARY KEY (email)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE Author (
    email VARCHAR (50),
    karma INT,
    PRIMARY KEY(email),
    FOREIGN KEY (email) REFERENCES User(email) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE Reviewer(
    email VARCHAR (50),
    karma INT,
	VIP TINYINT,
    PRIMARY KEY(email),
    FOREIGN KEY (email) REFERENCES User(email) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE Publisher (
    email VARCHAR (50),
    journal VARCHAR (50),
    web VARCHAR(100),
    PRIMARY KEY(email),
    FOREIGN KEY (email) REFERENCES User(email) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE Article (
    idArticle INT AUTO_INCREMENT,
    title VARCHAR (100),
    publishing_date DATE,
    idAuthor VARCHAR (50),
    commentAuthor VARCHAR(1000),
    state VARCHAR(15),
    mark INT,
	body VARCHAR (999),
    PRIMARY KEY (idArticle),
    FOREIGN KEY (idAuthor) REFERENCES Author(email) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE Tag (
    idTag INT AUTO_INCREMENT,
    issue VARCHAR (50),
    PRIMARY KEY (idTag)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE ArticleTag (
    idArticle INT,
    idTag INT,
    PRIMARY KEY (idArticle, idTag),
    FOREIGN KEY (idArticle) REFERENCES Article(idArticle) ON DELETE CASCADE,
    FOREIGN KEY (idTag) REFERENCES Tag(idTag) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE ReviewerTag (
    reviewer_mail VARCHAR (50),
    idTag INT,
    PRIMARY KEY (reviewer_mail, idTag),
    FOREIGN KEY (reviewer_mail) REFERENCES User(email) ON DELETE CASCADE,
    FOREIGN KEY (idTag) REFERENCES Tag(idTag) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE ArticleReview (
    idArticle INT,
    reviewer_mail VARCHAR (50),
    comment VARCHAR (1000),
    review_date DATE,
	state_review VARCHAR(15),
	mark INT,
    PRIMARY KEY (idArticle, reviewer_mail),
    FOREIGN KEY (idArticle) REFERENCES Article(idArticle) ON DELETE CASCADE,
    FOREIGN KEY (reviewer_mail) REFERENCES User(email) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE Follows (
    follower_mail VARCHAR (50),
    followed_mail VARCHAR (50),
    PRIMARY KEY (follower_mail, followed_mail),
    FOREIGN KEY (follower_mail) REFERENCES User(email) ON DELETE CASCADE,
    FOREIGN KEY (followed_mail) REFERENCES User(email) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE PublisherReviewer (
    publisher_mail VARCHAR (50),
    reviewer_mail VARCHAR (50),
    PRIMARY KEY (publisher_mail, reviewer_mail),
    FOREIGN KEY (publisher_mail) REFERENCES Publisher(email) ON DELETE CASCADE,
    FOREIGN KEY (reviewer_mail) REFERENCES Reviewer(email) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 
COLLATE = utf8_spanish_ci;
 
CREATE TABLE Message (
    idMessage INT AUTO_INCREMENT,
    mail_from VARCHAR (50),
    mail_to VARCHAR (50),
    body VARCHAR (1000),
    send_date DATE,
    PRIMARY KEY (idMessage),
    FOREIGN KEY (mail_from) REFERENCES User(email) ON DELETE NO ACTION,
    FOREIGN KEY (mail_to) REFERENCES User(email) ON DELETE NO ACTION
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
 
CREATE TABLE Notification (
    idNotification INT AUTO_INCREMENT,
    mail_notified VARCHAR (50),
    note VARCHAR (100),
    state VARCHAR (15),
    notification_date DATE,
    PRIMARY KEY (idNotification),
    FOREIGN KEY (mail_notified) REFERENCES User(email) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------
-- - INSERTS - 
-- -----------

#AUTORES
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('1@autor.com', 'Javier', 'Garcia', '1985-09-09', 'La Solana', 'autor1', 'A');
insert into Author (email, karma) values ('1@autor.com', '7');
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('2@autor.com', 'Raul', 'Saez', '1985-10-10', 'Valdepeñas', 'autor2', 'A');
insert into Author (email, karma) values ('2@autor.com', '8');
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('3@autor.com', 'Javier', 'Ortega', '1985-11-11', 'La Solana', 'autor3', 'A');
insert into Author (email, karma) values ('3@autor.com', '9');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('4@autor.com', 'Eduardo', 'Garcia', '1985-11-11', 'El Viso', 'autor4', 'A');
insert into Author (email, karma) values ('4@autor.com', '9');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('5@autor.com', 'Manuel', 'Sanchez', '1985-11-11', 'Miguelturra', 'autor5', 'A');
insert into Author (email, karma) values ('5@autor.com', '9');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('6@autor.com', 'Roberto', 'Rodriguez', '1985-11-11', 'El moral', 'autor6', 'A');
insert into Author (email, karma) values ('6@autor.com', '9');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('7@autor.com', 'Alejandro', 'Aviles', '1985-11-11', 'Infantes', 'autor7', 'A');
insert into Author (email, karma) values ('7@autor.com', '9');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('8@autor.com', 'Juan', 'Alfonso', '1985-11-11', 'Alatoz', 'autor8', 'A');
insert into Author (email, karma) values ('8@autor.com', '9');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('9@autor.com', 'Daniel', 'Leon', '1985-11-11', 'Olias', 'autor9', 'A');
insert into Author (email, karma) values ('9@autor.com', '9');
 
 
#EDITORES
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('1@Publisher.com', 'Raul', 'Reguillo', '1985-01-01', 'La Solana', 'editor1', 'E');
insert into Publisher (email, journal, web) values ('1@Publisher.com', 'revista1', 'http://revista1.com');
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('2@Publisher.com', 'Sergio', 'Del Cerro', '1985-01-03', 'La Solana', 'editor2', 'E');
insert into Publisher (email, journal, web) values ('2@Publisher.com', 'revista2', 'http://revista2.com');
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('3@Publisher.com', 'Ramon', 'Chaparro', '1985-02-02', 'Las Casas', 'editor3', 'E');
insert into Publisher (email, journal, web) values ('3@Publisher.com', 'revista3', 'http://revista3.com');
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('4@Publisher.com', 'Carmen', 'Alcaide', '1985-02-02', 'Castellar', 'editor4', 'E');
insert into Publisher (email, journal, web) values ('4@Publisher.com', 'revista4', 'http://revista4.com');
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('5@Publisher.com', 'Joaquin', 'Navarro', '1985-02-02', 'El Pozo', 'editor5', 'E');
insert into Publisher (email, journal, web) values ('5@Publisher.com', 'revista5', 'http://revista5.com');
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('6@Publisher.com', 'Antonio', 'Martin', '1985-02-02', 'Castellar', 'editor6', 'E');
insert into Publisher (email, journal, web) values ('6@Publisher.com', 'revista6', 'http://revista6.com');
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('7@Publisher.com', 'Alberto', 'Guitierrez', '1985-02-02', 'Santa Cruz', 'editor7', 'E');
insert into Publisher (email, journal, web) values ('7@Publisher.com', 'revista7', 'http://revista7.com');
 
 
#REVISORES
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('1@revisor.com', 'Laura', 'Del Río', '1985-07-07', 'Valdepeñas', 'revisor1', 'R');
insert into Reviewer (email, karma,VIP) values ('1@revisor.com', '8', '1');
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('2@revisor.com', 'Cristian', 'Del Cerro', '1985-04-04', 'Navahermosa', 'revisor2', 'R');
insert into Reviewer (email, karma,VIP) values ('2@revisor.com', '9','1');
 
insert into User (email, name, second_name, birth_date, city, pass, rol) values ('3@revisor.com', 'Natalia', 'Muñoz', '1985-03-03', 'La Solana', 'revisor3', 'R');
insert into Reviewer (email, karma,VIP) values ('3@revisor.com', '5','0');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('4@revisor.com', 'Ruben', 'De la Rubia', '1985-03-03', 'Ciudad Real', 'revisor4', 'R');
insert into Reviewer (email, karma,VIP) values ('4@revisor.com', '2','0');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('5@revisor.com', 'Jesus', 'Gonzalez', '1985-03-03', 'Torrenueva', 'revisor5', 'R');
insert into Reviewer (email, karma,VIP) values ('5@revisor.com', '5','1');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('6@revisor.com', 'Alvaro', 'Rincon', '1985-03-03', 'Yebenes', 'revisor6', 'R');
insert into Reviewer (email, karma,VIP) values ('6@revisor.com', '5','0');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('7@revisor.com', 'David', 'Pedros', '1985-03-03', 'Sonseca', 'revisor7', 'R');
insert into Reviewer (email, karma,VIP) values ('7@revisor.com', '5','0');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('8@revisor.com', 'Revi5', 'num5', '1985-03-03', 'Manzanares', 'revisor8', 'R');
insert into Reviewer (email, karma,VIP) values ('8@revisor.com', '5','0');

insert into User (email, name, second_name, birth_date, city, pass, rol) values ('9@revisor.com', 'Revi5', 'num5', '1985-03-03', 'Villanueva', 'revisor9', 'R');
insert into Reviewer (email, karma,VIP) values ('9@revisor.com', '5','0');


-- --------------
-- - Especiales -
-- --------------

INSERT INTO PublisherReviewer (publisher_mail, reviewer_mail) VALUES ('2@Publisher.com', '2@revisor.com');
INSERT INTO PublisherReviewer (publisher_mail, reviewer_mail) VALUES ('7@Publisher.com', '1@revisor.com');
INSERT INTO PublisherReviewer (publisher_mail, reviewer_mail) VALUES ('1@Publisher.com', '3@revisor.com');
INSERT INTO PublisherReviewer (publisher_mail, reviewer_mail) VALUES ('2@Publisher.com', '4@revisor.com');
INSERT INTO PublisherReviewer (publisher_mail, reviewer_mail) VALUES ('3@Publisher.com', '5@revisor.com');
INSERT INTO PublisherReviewer (publisher_mail, reviewer_mail) VALUES ('4@Publisher.com', '6@revisor.com');
INSERT INTO PublisherReviewer (publisher_mail, reviewer_mail) VALUES ('5@Publisher.com', '7@revisor.com');
INSERT INTO PublisherReviewer (publisher_mail, reviewer_mail) VALUES ('3@Publisher.com', '8@revisor.com');
INSERT INTO PublisherReviewer (publisher_mail, reviewer_mail) VALUES ('6@Publisher.com', '9@revisor.com');


INSERT INTO Follows (follower_mail, followed_mail) VALUES ('2@autor.com', '1@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('3@autor.com', '1@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('4@autor.com', '3@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('5@autor.com', '2@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('6@autor.com', '3@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('7@autor.com', '5@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('3@autor.com', '7@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('2@autor.com', '5@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('1@autor.com', '3@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('8@autor.com', '4@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('9@autor.com', '8@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('1@autor.com', '7@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('1@autor.com', '2@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('4@autor.com', '1@autor.com');
INSERT INTO Follows (follower_mail, followed_mail) VALUES ('7@autor.com', '3@autor.com');

INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('1', 'Titulo1', '1@autor.com', 'el mejor de todos', 'sent', '0', 'Erase una vez un hombre a una nariz pegada');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('2', 'Titulo2', '1@autor.com', 'un gran articulo', 'halfreviewed', '5','Un gato en un arbol');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('3', 'Titulo3', '2@autor.com', 'valorado en 10', 'reviewed', '10','El agua de la piscina esta verde');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('4', 'Titulo4', '1@autor.com', 'impresionante', 'sent', '0','Bonita vista la que tengo desde mi ventana');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('5', 'Titulo5', '3@autor.com', 'pensamientos', 'halfreviewed', '6','Las agujetas de jugar al tenis');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('6', 'Titulo6', '4@autor.com', 'me costo mucho', 'reviewed', '8','El perro de San Roque no tiene rabo');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('7', 'Titulo7', '6@autor.com', 'trabalenguas', 'sent', '0','Tres tristes tigres');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('8', 'Titulo8', '1@autor.com', 'un juego', 'halfreviewed', '10','A Cuesta le cuesta subir la cuesta');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('9', 'Titulo9', '2@autor.com', 'triunfa', 'reviewed', '2','Tonterias que se me pasan por la cabeza');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('10', 'Titulo10', '3@autor.com', 'dedicado', 'sentVIP', '0','Son sueños, que son de verdad');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('11', 'Titulo12', '4@autor.com', 'miopinion', 'halfreviewed', '5','Unas cervecitas :)');
INSERT INTO Article (idArticle, title, idAuthor, commentAuthor, state, mark, body) VALUES ('12', 'Titulo12', '1@autor.com', 'descriptivo', 'reviewed', '2','viajar a ver mundo');

INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('1', '1@revisor.com', 'comentario1','2012-10-12','unresolved','0');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('2', '1@revisor.com', 'comentarioR','2012-10-12','unresolved','0');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('1', '2@revisor.com', 'comentario2','2012-10-12','unreviewed','3');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('2', '3@revisor.com', 'comentario','2012-10-12','unresolved','5');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('3', '4@revisor.com', 'comentario1','2012-10-12','unresolved','0');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('3', '5@revisor.com', 'Coment','2012-10-12','unresolved','0');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('5', '7@revisor.com', 'comentario2','2012-10-12','reviewed','3');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('3', '9@revisor.com', 'comentario','2012-10-12','reviewed','8');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('5', '5@revisor.com', 'comentario1','2012-10-12','unresolved','0');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('4', '4@revisor.com', 'perfecto','2012-10-12','unresolved','0');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('4', '2@revisor.com', 'comentario2','2012-10-12','reviewed','9');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('6', '3@revisor.com', 'comentario','2012-10-12','unresolved','3');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('6', '1@revisor.com', 'comentario1','2012-10-12','unresolved','0');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('7', '6@revisor.com', 'perfecto','2012-10-12','unresolved','0');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('7', '8@revisor.com', 'comentario2','2012-10-12','reviewed','3');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('8', '8@revisor.com', 'comentario','2012-10-12','unresolved','5');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('9', '1@revisor.com', 'comentario2','2012-10-12','reviewed','3');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('8', '3@revisor.com', 'comentario','2012-10-12','unresolved','5');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('9', '2@revisor.com', 'comentario2','2012-10-12','reviewed','7');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('10', '1@revisor.com', 'comentario','2012-10-12','unresolved','5');
INSERT INTO ArticleReview (idArticle, reviewer_mail, comment,review_date,state_review,mark) VALUES ('10', '2@revisor.com', 'comentario2','2012-10-12','reviewed','8');


INSERT INTO Tag (issue) VALUES ('NOTICIAS');
INSERT INTO Tag (issue) VALUES ('DEPORTES');
INSERT INTO Tag (issue) VALUES ('CIENCIAS');
INSERT INTO Tag (issue) VALUES ('OCIO');
INSERT INTO Tag (issue) VALUES ('OPINION');

INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('1@revisor.com', 1); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('1@revisor.com', 3);
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('1@revisor.com', 4);
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('2@revisor.com', 1);  
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('2@revisor.com', 5);  
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('2@revisor.com', 3); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('3@revisor.com', 1);
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('3@revisor.com', 3);  
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('5@revisor.com', 5); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('4@revisor.com', 5); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('4@revisor.com', 3); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('4@revisor.com', 4); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('4@revisor.com', 1); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('4@revisor.com', 2); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('7@revisor.com', 3); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('7@revisor.com', 4);
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('7@revisor.com', 5);
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('6@revisor.com', 1); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('6@revisor.com', 2); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('6@revisor.com', 3); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('6@revisor.com', 4); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('8@revisor.com', 5);  
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('8@revisor.com', 1); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('9@revisor.com', 2); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('9@revisor.com', 3); 
INSERT INTO ReviewerTag (reviewer_mail, idTag) VALUES ('9@revisor.com', 4); 
 
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('1','1');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('2','2');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('3','3');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('4','4');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('5','5');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('6','5');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('7','2');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('8','3');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('9','1');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('10','1');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('11','2');
INSERT INTO ArticleTag (idArticle, idTag) VALUES ('12','4 ');
