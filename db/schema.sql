/* important that we drop the files in the correct order in this case since candidates uses parties id you have to drop candidates first*/
DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS parties;
DROP TABLE IF EXISTS voters;

/* important that you set up the tables when using data from one and going into another to put the one on top that you are using data from  i.e. parties to candidates*/
CREATE TABLE parties (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE candidates(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    party_id INTEGER,
    industry_connected BOOLEAN NOT NULL,
    CONSTRAINT fk_party FOREIGN KEY (party_id) REFERENCES parties(id) ON DELETE SET NULL
);

CREATE TABLE voters (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP
);