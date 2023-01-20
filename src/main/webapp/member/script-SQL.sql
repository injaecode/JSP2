/*
 * 회원정보를 저장하는 테이블
 */
create Table mbTbl(
	idx number not null,
	id varchar2(100) not null,
	passwd varchar2(100) not null,
	name varchar2(100) not null,
	email varchar2(100) not null,
	city varchar2(100) null,
	phone varchar2(100) null
);

alter table mbTbl
add constraint mbTbl_id_PK primary key (id);

/* 01: statement , 02: preparedstatement
 * insert01.jsp : 사용자 정보 입력
 * list01.jsp : 사용자 정보 출력
 * read01.jsp : 사용자 정보 읽기
 * delete01.jsp : 사용자 정보 삭제
 * update01.jsp :사용자 정보 수정
 * 
 */
