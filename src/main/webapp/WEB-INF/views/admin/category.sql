create table category(
	cCODE 	char(3) not null primary key,
	cNAME 	varchar(30) not null
);

select * from category;

create table subcategory(
	scCODE  char(3) not null,
	scNAME  varchar(30) not null,
	cCODE 	char(3) not null,
	foreign key(cCODE) references category(cCODE)
	on update cascade
);

/*중분류가 딸려있는 대분류는 삭제 불가*/
drop table subcategory;

update category set cNAME='채소' where cCODE='907';

create table goods(
	gIDX 	int not null auto_increment primary key,
	gNAME 	varchar(50) not null,
	gSHORT  varchar(50)
	cCODE 	char(3) not null,
	scCODE  char(3) not null,
	gPRICE 	int not null,
	gDISCOUNT int default 0,
	gSTOCK int,
	gIMAGE varchar(100) not null,
	gDETAIL text not null,
	gWDATE datetime default now(),
	gSALES int default 0,
	foreign key(cCODE) references category(cCODE)
);

