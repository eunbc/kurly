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

