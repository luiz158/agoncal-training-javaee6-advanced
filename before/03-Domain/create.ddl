create table Author (id bigint generated by default as identity, bio varchar(5000), date_of_birth date, first_name varchar(50), last_name varchar(50), preferred_language integer, version integer, primary key (id))
create table Category (id bigint generated by default as identity, name varchar(100), version integer, primary key (id))
create table Customer (id bigint generated by default as identity, date_of_birth date, email varchar(255), first_name varchar(255), city varchar(255), country varchar(255), state varchar(255), street1 varchar(255), street2 varchar(255), zip_code varchar(255), last_name varchar(255), telephone varchar(255), version integer, primary key (id))
create table Genre (id bigint generated by default as identity, name varchar(100), version integer, primary key (id))
create table Item (discriminator char(31) not null, id bigint generated by default as identity, description varchar(3000), image_url varchar(255), price float, title varchar(50), version integer, isbn varchar(15), language integer, nb_of_pages integer, publication_date date, total_duration float, author_id bigint, category_id bigint, publisher_id bigint, genre_id bigint, label_id bigint, primary key (id))
create table Item_Musician (Item_id bigint not null, musicians_id bigint not null, primary key (Item_id, musicians_id))
create table MajorLabel (id bigint generated by default as identity, name varchar(30), version integer, primary key (id))
create table Musician (id bigint generated by default as identity, bio varchar(5000), date_of_birth date, first_name varchar(50), last_name varchar(50), preferred_instrument varchar(255), version integer, primary key (id))
create table OrderLine (id bigint generated by default as identity, quantity integer, version integer, item_id bigint, primary key (id))
create table Publisher (id bigint generated by default as identity, name varchar(30), version integer, primary key (id))
create table PurchaseOrder (id bigint generated by default as identity, credit_card_expiry_date varchar(255), credit_card_number varchar(255), credit_card_type integer, city varchar(255), country varchar(255), state varchar(255), street1 varchar(255), street2 varchar(255), zip_code varchar(255), order_date date, quantity integer, version integer, customer_id bigint, primary key (id))
create table PurchaseOrder_OrderLine (PurchaseOrder_id bigint not null, orderLines_id bigint not null, primary key (PurchaseOrder_id, orderLines_id))

alter table PurchaseOrder_OrderLine add constraint UK_2il8k1fa4ocwhknp0nilrbusb  unique (orderLines_id)
alter table Item add constraint FK_3l936squa2jyegmpfdmwdjxve foreign key (author_id) references Author
alter table Item add constraint FK_59pwuale7q0ni8w5wtq0i0sp9 foreign key (category_id) references Category
alter table Item add constraint FK_69mtted1ntbtu6uem7r2oeqcr foreign key (publisher_id) references Publisher
alter table Item add constraint FK_5grk9vh95m6dn4hxfcqep37rf foreign key (genre_id) references Genre
alter table Item add constraint FK_9nees2bb8k5ekvfkw191v5b53 foreign key (label_id) references MajorLabel
alter table Item_Musician add constraint FK_hehk2l0jdnr6mmfow8e2cihjh foreign key (musicians_id) references Musician
alter table Item_Musician add constraint FK_6c7n156icts4eurpb228ovemy foreign key (Item_id) references Item
alter table OrderLine add constraint FK_5m5mt76jhwi3oay9io04agi6p foreign key (item_id) references Item
alter table PurchaseOrder add constraint FK_931tsmy9p34wiglc3k8c40t91 foreign key (customer_id) references Customer
alter table PurchaseOrder_OrderLine add constraint FK_2il8k1fa4ocwhknp0nilrbusb foreign key (orderLines_id) references OrderLine
alter table PurchaseOrder_OrderLine add constraint FK_fflqvkxksae9h98plotgdsia foreign key (PurchaseOrder_id) references PurchaseOrder
