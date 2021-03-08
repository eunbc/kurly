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

select * from review;

select * from order_detail od
	left join orderinfo o on o.mMID='testuser' and od.oNVOICE=o.oNVOICE
	where gIDX='15';

select od.odIDX, od.oNVOICE, od.gIDX, od.odREVIEW
	from order_detail od
		left join orderinfo o on od.oNVOICE=o.oNVOICE
				where od.gIDX='15' 
					and o.mMID='testuser' 
					and od.odREVIEW='N'
					and date(now()) < date_add(o.oDATE, interval +1 month);


