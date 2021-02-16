CREATE TABLE `board` (
	`bIDX` INT NOT NULL AUTO_INCREMENT,
	`mMID` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`bNAME` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`bTITLE` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`bWDATE` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
	`bVIEWCNT` INT NULL DEFAULT '0',
	`bCONTENT` TEXT NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`bIDX`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
AUTO_INCREMENT=4
;

desc board;


select * from board;

select * 
	from board 
	where bIDX in (
		(select bIDX from board where bIDX < 3 order by bIDX desc limit 1),
		(select bIDX from board where bIDX > 3 order by bIDX limit 1)
	);		


