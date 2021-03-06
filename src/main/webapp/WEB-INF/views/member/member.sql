
show tables;
drop table kurly_member;

CREATE TABLE `member` (
	`mIDX` INT NOT NULL AUTO_INCREMENT,
	`mMID` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`mPWD` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`mNAME` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`mEMAIL` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`mPHONE` VARCHAR(15) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`mADDRESS` VARCHAR(60) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`mGENDER` CHAR(2) NULL DEFAULT '-' COLLATE 'utf8mb4_0900_ai_ci',
	`mBDAY` DATETIME NULL,
	`mJOINDAY` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
	`mEMONEY` INT NOT NULL DEFAULT '0',									/* 적립금 */
	`mLEVEL` VARCHAR(3) NULL DEFAULT '일반' COLLATE 'utf8mb4_0900_ai_ci', /* 일반, 화이트, 라벤더, 퍼플, 관리자 */	
	`mRECEIVEAD` CHAR(1) NULL DEFAULT 'N' COLLATE 'utf8mb4_0900_ai_ci', /* 광고성 이메일 수신 동의*/
	`mDROPOUT` CHAR(1) NULL DEFAULT 'N' COLLATE 'utf8mb4_0900_ai_ci', 	/* 회원탈퇴 */
	PRIMARY KEY (`mIDX`, `mMID`) USING BTREE,
	UNIQUE INDEX `mid` (`mMID`, `mEMAIL`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

DROP TABLE member; 

SELECT * FROM member;