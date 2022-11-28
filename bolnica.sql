drop database if exists bolnica;
create database bolnica charset utf8mb4;
use bolnica;

create table odjel (
    odjel_id int not null auto_increment primary key,
    naziv varchar(50) not null,
    broj_soba int
);

create table pacijent (
    pacijent_id int not null auto_increment primary key,
    ime varchar(50),
    prezime varchar(50),
    adresa varchar(255),
    oib char(11),
    doktor_id int
);

create table doktor (
    doktor_id int not null auto_increment primary key,
    ime varchar(50),
    prezime varchar(50),
    specijalizacija varchar(50),
    oib char(11),
    odjel_id int
);

create table medicinski_karton (
    medicinski_karton_id int not null auto_increment primary key,
    datum_pregleda datetime,
    dijagnoza varchar(255),
    pacijent_id int
);

create table posjeta (
    posjeta_id int not null auto_increment primary key,
    datum datetime,
    pacijent_id int,
    posjetitelj_id int
);

create table posjetitelj (
    posjetitelj_id int not null auto_increment primary key,
    ime varchar(50),
    prezime varchar(50),
    adresa varchar(50),
    telefonski_broj int
);

alter table pacijent add foreign key (doktor_id) references doktor(doktor_id);

alter table posjeta add foreign key (pacijent_id) references pacijent(pacijent_id);
alter table posjeta add foreign key (posjetitelj_id) references posjetitelj(posjetitelj_id);

alter table medicinski_karton add foreign key (pacijent_id) references pacijent(pacijent_id);

alter table doktor add foreign key (odjel_id) references odjel(odjel_id);