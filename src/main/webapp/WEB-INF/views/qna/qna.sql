create table qna(
	qIDX	int not null auto_increment primary key,
	gIDX    int	not null,
	qNAME   varchar(20) not null,
	qTITLE  varchar(50) not null,
	qCONTENT text,
	qSECRET char(1),
	qWDATE  datetime default now(),
	qPUBLIC char(1) default 'Y',
	qREPLY  varchar(10) default '답변대기중',
	foreign key(gIDX) references goods(gIDX)
);


