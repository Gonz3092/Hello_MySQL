-- relacion 1:1

CREATE TABLE dni(
	dni_id int AUTO_INCREMENT PRIMARY KEY,
    dni_number int NOT NULL,
    user_id int,
    UNIQUE(dni_number),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
)

-- relacion 1:n

CREATE TABLE companies(
	company_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(100) NOT NULL
)

ALTER TABLE users 
ADD CONSTRAINT fk_companies
FOREIGN KEY(company_id) REFERENCES companies(company_id)

-- relacion n:n

CREATE TABLE lengauges(
	lenguage_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(100) NOT NULL
)

CREATE TABLE user_languages(
	user_languages_id int AUTO_INCREMENT PRIMARY KEY,
	user_id int,
    languages_id int,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(languages_id) REFERENCES languages(languages_id),
    UNIQUE(user_id, languages_id)
);
