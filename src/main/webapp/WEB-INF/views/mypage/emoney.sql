create table emoney(
	eIDX 	int not null auto_increment primary key,
	mMID	varchar(20) not null,
	ePLUS   int,
	eMINUS 	int,
	eDATE	datetime default now(),
	eCONTENT varchar(100),
	foreign key(mMID) references member(mMID)
);


