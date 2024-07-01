CREATE TABLE AccidentType(
   AccidentTypeID VARCHAR(1) NOT NULL PRIMARY KEY
  ,AccidentType   VARCHAR(9) NOT NULL
);
INSERT INTO AccidentType(AccidentTypeID,AccidentType) VALUES ('0','Vandalism');
INSERT INTO AccidentType(AccidentTypeID,AccidentType) VALUES ('1','Theft');
INSERT INTO AccidentType(AccidentTypeID,AccidentType) VALUES ('2','Fire');
INSERT INTO AccidentType(AccidentTypeID,AccidentType) VALUES ('3','Collision');
