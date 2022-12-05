drop database if exists kolokvij6;
create database kolokvij6;
use kolokvij6;

create table punac (
    sifra int not null auto_increment primary key,
    ekstroventno bit not null,
    suknja varchar(30) not null,
    majica varchar(44) not null,
    prviputa datetime not null
);

create table ostavljena (
    sifra int not null auto_increment primary key,
    prviputa datetime not null,
    kratkamajica varchar(39) not null,
    drugiputa datetime,
    maraka decimal(14,10)
);

create table prijatelj (
    sifra int not null auto_increment primary key,
    haljina varchar(35),
    prstena int not null,
    introvertno bit,
    stilfrizura varchar(36) not null
);

create table svekrva (
    sifra int not null auto_increment primary key,
    hlace varchar(48) not null,
    suknja varchar(42) not null,
    ogrlica int not null,
    treciputa datetime not null,
    dukserica varchar(32) not null,
    narukvcica int not null,
    punac int not null,
    foreign key (punac) references punac(sifra) 
);

create table prijatelj_ostavljena (
    sifra int not null auto_increment primary key,
    prijatelj int not null,
    ostavljena int not null,
    foreign key (prijatelj) references prijatelj(sifra),
    foreign key (ostavljena) references ostavljena(sifra) 
);

create table brat (
    sifra int not null auto_increment primary key,
    nausnica int not null,
    treciputa datetime not null,
    narukvica int not null,
    hlace varchar(31),
    prijatelj int not null,
    foreign key (prijatelj) references prijatelj(sifra) 
);

create table zena (
    sifra int not null auto_increment primary key,
    novcica decimal(14,8) not null,
    narukvica int not null,
    dukserica varchar(40) not null,
    haljina varchar(30),
    hlace varchar(32),
    brat int not null,
    foreign key (brat) references brat(sifra) 
);

create table decko (
    sifra int not null auto_increment primary key,
    prviputa datetime,
    modelnaocala varchar(41),
    nausnica int,
    zena int not null,
    foreign key (zena) references zena(sifra)
);