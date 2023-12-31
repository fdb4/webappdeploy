drop schema schema2;
create schema schema2;
CREATE TABLE schema2.state (
  stateID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  state VARCHAR(45) NOT NULL,
  PRIMARY KEY (stateID),
  UNIQUE INDEX stateID_UNIQUE (stateID ASC) VISIBLE);
CREATE TABLE schema2.location (
  locationID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  gym VARCHAR(45) NOT NULL,
  town VARCHAR(45) NOT NULL,
  stateID INT UNSIGNED NOT NULL,
  lastmodified TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (locationID),
  UNIQUE INDEX stateID_UNIQUE (locationID ASC) VISIBLE,
  INDEX stateID_idx (stateID ASC) VISIBLE,
  CONSTRAINT stateID
    FOREIGN KEY (stateID)
    REFERENCES schema2.state (stateID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE schema2.coachexp (
  coachexpID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  price DOUBLE NOT NULL,
  rating SMALLINT UNSIGNED NOT NULL,
  locationID INT UNSIGNED NOT NULL,
  experience DATE NOT NULL,
  bio LONGTEXT NOT NULL,
  lastmodified TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (coachexpID),
  UNIQUE INDEX coachexpID_UNIQUE (coachexpID ASC) VISIBLE,
  INDEX locationID_idx (locationID ASC) VISIBLE,
  CONSTRAINT locationID
    FOREIGN KEY (locationID)
    REFERENCES schema2.location (locationID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE TABLE schema2.workoutgoal (
  workoutgoalID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  cycling TINYINT NULL DEFAULT NULL,
  strength TINYINT NULL DEFAULT NULL,
  running TINYINT NULL DEFAULT NULL,
  sports TINYINT NULL DEFAULT NULL,
  yoga TINYINT NULL DEFAULT NULL,
  swimming TINYINT NULL DEFAULT NULL,
  martialarts TINYINT NULL DEFAULT NULL,
  other VARCHAR(45) NULL DEFAULT NULL,
  lastmodified TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (workoutgoalID),
  UNIQUE INDEX workoutgoalID_UNIQUE (workoutgoalID ASC) VISIBLE);
CREATE TABLE schema2.generalinfo (
  geninfoID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  height DOUBLE NULL DEFAULT NULL,
  weight DOUBLE NULL DEFAULT NULL,
  goalweight INT NULL DEFAULT NULL,
  movement VARCHAR(45) NULL DEFAULT NULL,
  age INT NULL DEFAULT NULL,
  gender TINYINT NULL DEFAULT NULL,
  lastmodified TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (geninfoID),
  UNIQUE INDEX geninfoID_UNIQUE (geninfoID ASC) VISIBLE);
CREATE TABLE schema2.clients (
  clientID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(45) NOT NULL,
  password VARCHAR(128) NOT NULL,
  profilepic BLOB default null,
  firstname VARCHAR(45) NOT NULL,
  lastname VARCHAR(45) NOT NULL,
  workoutgoalID INT UNSIGNED NULL DEFAULT NULL,
  geninfoID INT UNSIGNED NULL DEFAULT NULL,
  coachexpID INT UNSIGNED NULL DEFAULT NULL,
  lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (clientID),
  UNIQUE INDEX clientID_UNIQUE (clientID ASC) VISIBLE,
  UNIQUE INDEX geninfoID_UNIQUE (geninfoID ASC) VISIBLE,
  UNIQUE INDEX coachexpID_UNIQUE (coachexpID ASC) VISIBLE,
  UNIQUE INDEX workoutgoalID_UNIQUE (workoutgoalID ASC) VISIBLE,
  CONSTRAINT coachexpID
    FOREIGN KEY (coachexpID)
    REFERENCES schema2.coachexp (coachexpID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT geninfoID
    FOREIGN KEY (geninfoID)
    REFERENCES schema2.generalinfo (geninfoID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT workoutgoalID
    FOREIGN KEY (workoutgoalID)
    REFERENCES schema2.workoutgoal (workoutgoalID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    CREATE TABLE schema2.clientcoaches (
  requestID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  clientID INT UNSIGNED NOT NULL,
  request TINYINT NULL DEFAULT NULL,
  coachexpID INT UNSIGNED NOT NULL,
  lastmodified TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (requestID),
  UNIQUE INDEX requestID_UNIQUE (requestID ASC) VISIBLE,
  INDEX clientID_idx (clientID ASC) VISIBLE,
  INDEX coachexp_idx (coachexpID ASC) VISIBLE,
  CONSTRAINT clientID
    FOREIGN KEY (clientID)
    REFERENCES schema2.clients (clientID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT coachexp
    FOREIGN KEY (coachexpID)
    REFERENCES schema2.clients (coachexpID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
