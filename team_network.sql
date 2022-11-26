create database IF NOT exists net;
use net;
create table USER(
    user_id varchar(20) not null,
    password varchar(20) not null,
    name varchar(10) not null,
    email varchar(20) not null,
    birth date not null,
    phone_number varchar(20),
    git varchar(255),
    primary key (user_id)
);

create table STATE(
user_id varchar(20) not null,
saying text, /*상태 메시지*/
profile varchar(255),/*프사 이미지 url*/
access_time datetime not null, /*최종 접속 시간*/
login int, /*로그인 여부*/
primary key(user_id),
foreign key(user_id) references USER(user_id)
);

create table CHAT(
   chat_id varchar(20), /*채팅방 id*/
    user_id varchar(20), /*해당 채팅방에 채팅을 한 id*/
    chatting text, /*채팅 내용*/
    up_load datetime, /*채팅 시간*/
   primary key(chat_id),
    foreign key(user_id) references USER(user_id)
);

create table PARTICIPATE(
   user_id varchar(20), /*채팅방 id*/
    chat_id varchar(20), /*채팅방 참여자 id*/
    foreign key(user_id) references USER(user_id),
    foreign key(chat_id) references chat(chat_id),
    primary key(user_id, chat_id)
);

create table FOLLOW(/*user_id follow f_id*/
f_id varchar(20) not null, 
user_id varchar(20) not null,
 primary key(f_id,user_id),
 foreign key(user_id) references USER(user_id)
);