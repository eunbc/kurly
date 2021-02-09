create table kurly_board(
	board_idx	int not null auto_increment,
	mid 		varchar(20) not null,
	name		varchar(20) not null,
	title		varchar(100) not null,
	wdate 		datetime default now(),
	viewCnt		int default 0,
	content		text not null,
	primary key(board_idx)
);

select * from kurly_board;