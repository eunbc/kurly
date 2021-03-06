create table cart(
	cIDX  	int not null auto_increment primary key,
	mMID  	varchar(20) not null,
	gIDX  	int not null,
	odQTY 	int not null,
	goIDX 	int,
	cDATE 	datetime not null default now(),
	foreign key(mMID) references member(mMID),
	foreign key(gIDX) references goods(gIDX)
);


