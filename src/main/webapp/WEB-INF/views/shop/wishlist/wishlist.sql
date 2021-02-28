create table wishlist(
	wIDX  	int not null auto increment primary key,
	mMID 	varchar(20) not null,
	gIDX	int not null,
	foreign key(mMID) references member(mMID),
	foreign key(gIDX) references goods(gIDX)
);

use javaspring;