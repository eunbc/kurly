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

create table goods_option (
	goIDX  int not null auto_increment primary key,
	gIDX   int not null,
	goNAME varchar(50) not null,
	goPRICE int,
	foreign key(gIDX) references goods(gIDX)
);

select * from cart c
	left outer join goods g on c.gIDX = g.gIDX
	left outer join goods_option go on c.gIDX= g.gIDX and c.goIDX=go.goIDX 
	where c.mMID = 'marketkurly';


select * from order_detail od 
			left join goods g
				on od.gIDX = g.gIDX;

select * from order_detail od 
			left join goods g on od.gIDX = g.gIDX
			left join goods_option go on od.gIDX=go.gIDX and od.goIDX=go.goIDX;

select count(mIDX) from member where DATE(mJOINDAY)=DATE(NOW()); 
			
		