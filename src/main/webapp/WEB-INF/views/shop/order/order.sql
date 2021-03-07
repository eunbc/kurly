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

select * from coupon where DATE(cpSTARTDATE) =< DATE(NOW()) AND DATE(cpENDDATE) >= DATE(NOW());
select * from coupon;

SELECT * FROM coupon
	WHERE DATE(NOW()) BETWEEN DATE(cpSTARTDATE) AND 
		DATE(cpENDDATE) 
		AND mMID= 'rena1234';
		
create table order_detail(
	odIDX  	int not null auto_increment primary key,
	oNVOICE varchar(30) not null,
	gIDX 	INT not null,
	goIDX 	INT,
	odQTY	int not null,
	odREVIEW char(1) default 'N',
	foreign key(gIDX) references goods(gIDX)
);	

drop table order_detail;

select * from order_detail od left outer join orderinfo o on od.oNVOICE = o.oNVOICE;

select * from order_detail od 
	left join goods g on od.gIDX=g.gIDX
	left join goods_option go on od.gIDX=go.gIDX and od.goIDX=go.goIDX;
	