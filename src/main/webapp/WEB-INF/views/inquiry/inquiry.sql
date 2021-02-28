CREATE TABLE `inquiry` (
	`iIDX` INT NOT NULL AUTO_INCREMENT,
	`mMID` VARCHAR(20) NOT NULL,
	`iTITLE` VARCHAR(100) NOT NULL,
	`iCATEGORY` VARCHAR(20) NOT NULL,
	`iWDATE` DATETIME NOT NULL DEFAULT now(),
	`oIDX` int,
	`iCONTENT` TEXT NOT NULL,
	`iFNAME` varchar(100),
	`iRFNAME` varchar(200),
	`iREPLY` varchar(10) DEFAULT '답변대기중',
	PRIMARY KEY (`iIDX`),
    FOREIGN KEY (mMID)
    REFERENCES member(mMID) ON UPDATE CASCADE
);

CREATE TABLE `inquiryReply` (
	irIDX 		INT NOT NULL AUTO_INCREMENT,
	iIDX 		INT NOT NULL ,
	irWDATE 		DATETIME NOT NULL DEFAULT now(),
	irCONTENT	TEXT NOT NULL,
	PRIMARY KEY (`irIDX`),
    FOREIGN KEY (iIDX)
    REFERENCES inquiry(iIDX)
);
drop table inquiryReply;

desc board;
drop table inquiry;

select * from inquiry;

select * 
	from board 
	where bIDX in (
		(select bIDX from board where bIDX < 3 order by bIDX desc limit 1),
		(select bIDX from board where bIDX > 3 order by bIDX limit 1)
	);		

	
alter table board add FOREIGN KEY(mMID) REFERENCES member(mMID);
ALTER TABLE `board` ADD CONSTRAINT `mMID` FOREIGN KEY (`mMID`) REFERENCES `member` (`mMID`) ON UPDATE CASCADE ON DELETE NO ACTION;