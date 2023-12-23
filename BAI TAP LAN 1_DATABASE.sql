create database baitap1; 
use baitap1; 

create table department (
departmentID int primary key auto_increment,
departmentNAME varchar(100)
 ); 
 create table positions (
 positionID int primary key auto_increment, 
 positionNAME enum ('Dev', 'Test', 'Scrum Master', 'PM')
); 
create table accounts ( 
 accountID int primary key auto_increment,
 email varchar(100), 
 username varchar(100), 
 fullname varchar(100), 
 departmentID int, 
 positionID int, 
 createDATE date,
     foreign key(departmentID) references department(departmentID), 
     foreign key(positionID) references positions(positionID)
 );
create table Groupp (
groupID int primary key auto_increment, 
groupNAME varchar(100), 
createID int, 
createDATE date
); 
create table GroupAccount (
groupID int, 
accountID int, 
joindate date, 
   foreign key(groupID) references Groupp(groupID), 
   foreign key(accountID) references accounts(accountID)
   ); 
create table TypeQuestion (
typeID int primary key auto_increment, 
typeNAME enum('Essay', 'Multiple-Choice')
); 
create table CategoryQuestion (
categoryID int primary key auto_increment, 
categoryNAME enum('Java', '.NET', 'SQL', 'Postman', 'Ruby')
); 
create table question (
questionID int primary key auto_increment, 
content varchar(500), 
categoryID int, 
typeID int, 
createID int, 
createdate date, 
  foreign key(categoryID) references CategoryQuestion(categoryID), 
  foreign key(typeID) references TypeQuestion(typeID)
);
create table answer ( 
answerID int primary key auto_increment, 
content varchar(500), 
questionID int, 
iscorrect boolean,
  foreign key(questionID) references question(questionID)
);
create table exam ( 
examID int primary key auto_increment, 
codes int, 
title varchar(200), 
categoryID int, 
duration varchar(50), 
creatorID int, 
createdate date, 
  foreign key(categoryID) references CategoryQuestion(categoryID)
  ); 
  create table Examquestion (
  examID int, 
  questionID int, 
    foreign key(examID) references exam(examID), 
    foreign key(questionID) references question(questionID) 
    ); 
