create table wishlist(
	wIDX  	int not null auto increment primary key,
	mMID 	varchar(20) not null,
	gIDX	int not null,
	foreign key(mMID) references member(mMID),
	foreign key(gIDX) references goods(gIDX)
);

use javaspring;


select * from cart c
	left outer join goods g on c.gIDX = g.gIDX
	left outer join goods_option go on c.gIDX= g.gIDX and c.goIDX=go.goIDX 
	where c.mMID = 'marketkurly';


select * from order_detail od 
			left join goods g on od.gIDX = g.gIDX
			left join goods_option go on od.gIDX=go.gIDX and od.goIDX=go.goIDX;
		