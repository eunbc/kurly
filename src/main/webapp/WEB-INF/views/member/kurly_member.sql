create table kurly_member(
	member_idx 	int not null auto_increment,
	mid 		varchar(20) not null,
	pwd 		varchar(100) not null,
	name		varchar(20) not null,	
	email		varchar(50) not null,
	phone		varchar(15) not null,
	address 	varchar(60) not null,
	gender 		char(2) default '-',
	birthday 	datetime,
	joinday 	datetime default now(),
	point		int not null default 0,   /* 적립금 */
	level		varchar(3) default '일반', /* 일반, 화이트, 라벤더, 퍼플, 관리자 */	
	recieveAd	char(1) default 'N',	  /* 광고성 이메일 수신 동의*/
	dropout   	char(1) default 'N',     /* 회원탈퇴 */
	primary key(member_idx,mid),
	unique key(mid,email)	/*중복불허키*/	
);

show tables;
drop table kurly_member;