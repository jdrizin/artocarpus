#this file includes a script to build a xataface authentication system
CREATE TABLE xf_users (
  username VARCHAR(32) NOT NULL,
  password VARCHAR(64) NOT NULL,
  PRIMARY KEY (`username`)
);
