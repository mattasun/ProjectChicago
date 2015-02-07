
--drop table www_theaters cascade constraints;
--drop table www_theater_screens cascade constraints;
--drop table www_screen cascade constraints;
--drop table www_movie cascade constraints;
--drop table www_screen_seating cascade constraints;
--drop table www_address cascade constraints;
--drop table www_operational_hours cascade constraints;


create table www_theaters (
	theater_id	varchar2(40)	not null,
	type	integer null,
	name	varchar2(40)	null,
	description	varchar2(254)	null,
	creation_date	timestamp	null,
	last_modified_date	timestamp	null,
	screens_info	varchar2(40)	null, 		--This should be screen_id in www_screen table
	address_info	varchar2(40)	null,		--This should be address_id in www_address table
	hours_of_operation	varchar2(40)	null,
	longitude	number	null,
	latitude	number	null,
	is_active	number(1)	null
,constraint www_theaters_p primary key (theater_id));

create index theater_lastmod_idx on www_theaters (last_modified_date);
create index theater_create_idx on www_theaters (creation_date);

--The following table holds one to many relationship between a theater and screens
create table www_theater_screens(
		theater_id varchar2(40) not null,
		sequence_num number(10)	not null,
		screen_id varchar2(40) not null
,constraint www_theater_screens_pk primary key (theater_id,sequence_num)
,constraint www_theater_screens_f1 foreign key (theater_id) references www_theaters (theater_id)
,constraint www_theater_screens_f2 foreign key (screen_id) references www_screen (screen_id));

--The following table holds information about a screen
create table www_screen (
	screen_id	varchar2(40)	not null,
	type	integer null,
	name	varchar2(40)	null,
	description	varchar2(254)	null,
	current_movie_end_date	timestamp	null,
	current_movie_start_date	timestamp	null,
	last_movie	varchar2(40)	null,					--This is movie_id
	current_movie	varchar2(40)	null,				--This should be movie_id
	next_movie	varchar2(40)	null,					--This should be movie_id
	movie_wholesale_price	number(19,7)	null,
	movie_list_price	number(19,7)	null,
	movie_sale_price	number(19,7)	null,
	on_sale	number(1,0)	null,
	is_active	number(1)	null,
	hours_of_operation varchar2(40) null,
	screen_seating varchar2(40) null					--This should be sreen_seating_id
,constraint www_screen_p primary key (screen_id));
create index current_movie_end_date_idx on www_screen (current_movie_end_date);
create index movie_lstprice_idx on www_screen (movie_list_price);
create index movie_sleprice_idx on www_screen (movie_sale_price);
create index current_movie_start_date_idx on www_screen (current_movie_start_date);

create table www_movie (
	movie_id	varchar2(40)	not null,
	type	integer not null,
	name	varchar2(40)	null,
	description	varchar2(254)	null,
	release_date	timestamp	null,
	movie_rating	varchar2(40)	null,
	movie_cast	varchar2(40)	null,
	movie_length	number	null
,constraint www_movie_p primary key (movie_id));

create table www_screen_seating (
	screen_seating_id	varchar2(40)	not null,
	screen_id	varchar2(40)	null,
	seats_per_row	varchar2(40)	null,
	seats_per_column	varchar2(40)	null,
	total_rows	varchar2(40)	null,
	total_columns	varchar2(40)	null,
	row_number_type	number	null,  				--should be alphabatic or neumeric
	column_number_type number null
,constraint www_screen_seating_p primary key (screen_seating_id)
,constraint www_screen_seating_f1 foreign key (screen_id) references www_screen (screen_id));

create table www_address (
	address_id	varchar2(40)	not null,
	address_1	varchar2(50)	null,
	address_2	varchar2(50)	null,
	address_3	varchar2(50)	null,
	city	varchar2(40)	null,
	county	varchar2(40)	null,
	state	varchar2(40)	null,
	postal_code	varchar2(10)	null,
	country	varchar2(40)	null,
	phone_number	varchar2(40)	null,
	fax_number	varchar2(40)	null,
	email	varchar2(255)	null
,constraint www_address_p primary key (address_id));

create table www_operational_hours (
	hour_id	varchar2(40)	not null,
	sunday_open_time	timestamp	null,
	sunday_close_time	timestamp	null,
	monday_open_time	timestamp	null,
	monday_close_time	timestamp	null,
	tuesday_open_time	timestamp	null,
	tuesday_close_time	timestamp	null,
	wednesday_open_time	timestamp	null,
	wednesday_close_time timestamp	null,
	thursday_open_time	timestamp	null,
	thursday_close_time	timestamp	null,
	friday_open_time	timestamp	null,
	friday_close_time	timestamp	null,
	saturday_open_time	timestamp	null,
	saturday_close_time	timestamp	null
,constraint www_operational_hours_p primary key (hour_id));



