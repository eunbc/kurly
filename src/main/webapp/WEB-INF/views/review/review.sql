create table review(
	rIDX		int not null auto_increment primary key,
	oNVOICE		varchar(30) not null,
	gIDX		int not null,
	rNAME		varchar(10) not null,
	mMID		varchar(20) not null,
	rTITLE		varchar(50) not null,
	rCONTENT	text,
	rWDATE		datetime default now(),
	rVIEW		int default 0,
	rHELP 		int default 0,
	rFNAME		varchar(100),
	rRFNAME		varchar(100),
	foreign key(gIDX) references goods(gIDX),
	foreign key(mMID) references member(mMID)
);