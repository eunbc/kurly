create table orderinfo(
	oIDX 	int not null auto_increment primary key,
	mMID 	varchar(20) not null,
	oDATE 	datetime not null default now(),
	oNAME 	varchar(20) not null,
	oPHONE	varchar(20) not null,
	oADDRESS varchar(100) not null,
	oAMOUNT  int not null,
	oEMONEY  int,
	cIDX 	 int,
	oPAYMENT varchar(10) not null,
	nNVOICE  varchar(20) not null,
	oSTATUS  varchar(10) default '결제완료', 
	foreign key(mMID) references member(mMID)
);

create table coupon(
	cpIDX		int not null auto_increment primary key,
	mMID		varchar(20) not null,
	cpNAME		varchar(30) not null,
	cpPRICE		int,
	cpMINIMUM	int,
	cpWDATE		datetime default now(),
	cpSTARTDATE datetime,
	cpENDDATE	datetime,
	cpUSE		char(1) default 'N',
	foreign key(mMID) references member(mMID)
);

drop table coupon;