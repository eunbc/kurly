create table faq(
	fIDX 		INT not null auto_increment,
	fCATEGORY	varchar(20) not null,
	fTITLE 		varchar(50) not null,
	fCONTENT 	text not null,
	primary key(fIDX)
);

select gIDX,gIMAGE,gPRICE,gDISCOUNT,gNAME 
			from goods 
				where gNAME like concat('%','감자','%');