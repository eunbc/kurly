CREATE TABLE `board` (
	`bIDX` INT NOT NULL AUTO_INCREMENT,
	`mMID` VARCHAR(20) NOT NULL,
	`bNAME` VARCHAR(20) NOT NULL ,
	`bTITLE` VARCHAR(100) NOT NULL,
	`bWDATE` DATETIME NOT NULL DEFAULT now(),
	`bVIEWCNT` INT NOT NULL DEFAULT '0',
	`bCONTENT` TEXT NOT NULL,
	PRIMARY KEY (`bIDX`),
    FOREIGN KEY (mMID)
    REFERENCES member(mMID) ON UPDATE CASCADE
);

desc board;
drop table board;

select * from board;

select * 
	from board 
	where bIDX in (
		(select bIDX from board where bIDX < 3 order by bIDX desc limit 1),
		(select bIDX from board where bIDX > 3 order by bIDX limit 1)
	);		

SELECT bIDX,bNAME from board where bIDX < 3 order by bIDX LIMIT 1;

SELECT
    bIDX,bTITLE
 FROM
    BOARD
 WHERE
  bIDX IN (
    (SELECT bIDX FROM BOARD WHERE bIDX < 5  ORDER BY bIDX DESC LIMIT 1),
    (SELECT bIDX FROM BOARD WHERE bIDX > 5  ORDER BY bIDX LIMIT 1)
   );

	
alter table board add FOREIGN KEY(mMID) REFERENCES member(mMID);
ALTER TABLE `board` ADD CONSTRAINT `mMID` FOREIGN KEY (`mMID`) REFERENCES `member` (`mMID`) ON UPDATE CASCADE ON DELETE NO ACTION;