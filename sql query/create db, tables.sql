

use MyLibrary

Create table Author
(
id_author int identity(1,1) not null, 
author_name_ru nvarchar(100) not null,
author_name_eng nvarchar(100) constraint df_author_name_eng default null,
link nvarchar(max) constraint df_author_link  default null,
constraint pk_id_author primary key (id_author), 
constraint uq_author_name_ru unique (author_name_ru),
constraint uq_author_name_eng unique (author_name_eng)
)

Create table L_Group
(
id_group int identity not null,
groupe_title_ru nvarchar(100) not null,
groupe_title_eng nvarchar(100) constraint df_l_group_title_eng default null,
id_author int not null,
link nvarchar(max) constraint df_g_author_link  default null,
constraint pk_id_group primary key (id_group),
constraint fk_L_Group_Author foreign key (id_author) references Author (id_author),
constraint uq_groupe_title_ru unique (groupe_title_ru), 
constraint uq_groupe_title_eng unique (groupe_title_eng)
) 

Create table L_Status
(
id_status  int identity(1,1) not null,
title nvarchar(50) not null,
constraint pk_l_id_status primary key (id_status),
constraint uq_l_Status_title unique (title) 
)


Create table Series
(
id_series int identity(1,1) not null,
series_name_ru nvarchar(100) not null,
series_name_eng nvarchar(100) constraint df_series_name_eng default null,
id_author int not null,
id_status int not null,
id_group int constraint df_s_id_grup default null,
n_in_group int constraint df_b_s_in_serias default null,
link nvarchar(max) constraint df_Series_link null,
constraint pk_id_series primary key (id_series),
constraint uq_series_name_ru unique (series_name_ru),
constraint uq_series_name_eng unique (series_name_eng),
constraint fk_Series_Author foreign key (id_author) references Author (id_author), 
constraint fk_Series_L_Status foreign key (id_status) references L_Status(id_status),
constraint fk_Series_L_Group foreign key (id_group) references L_Group(id_group)
)

Create table Books
(
id_book int identity(1,1) not null,
book_name_ru nvarchar(100) not null,
book_name_eng nvarchar(100) constraint df_book_name_eng default null,
id_author int not null,
id_series int constraint df_b_id_serias default null,
id_status int not null,
id_group int constraint df_b_id_gruop default null,
n_in_serias int constraint df_n_in_serias default null,
n_in_group int constraint df_b_n_in_serias default null,
link nvarchar(max) constraint df_book_link default null,
constraint pk_id_book primary key (id_book),
constraint uq_book_name_ru unique (book_name_ru),
constraint uq_book_name_eng unique (book_name_eng),
constraint fk_Books_Author foreign key (id_author) references Author (id_author),
constraint fk_Books_Series foreign key (id_series) references Series(id_series), 
constraint fk_Books_L_Status foreign key (id_status) references L_Status (id_status),
constraint fk_Books_L_Group foreign key (id_group) references L_Group(id_group)
)
