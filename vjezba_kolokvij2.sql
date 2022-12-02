drop database if exists kolokvij2;
create database kolokvij2;
use kolokvij2;

create table decko (
    sifra int not null auto_increment primary key,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit not null
);

create table svekar (
    sifra int not null auto_increment primary key,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);

create table zarucnica (
    sifra int not null auto_increment primary key,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno bit not null
);

create table cura (
    sifra int not null auto_increment primary key,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvca int,
    introvertno bit,
    majica varchar(40) not null,
    decko int
);

create table neprijatelj(
    sifra int not null auto_increment primary key,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int not null
);

create table brat (
    sifra int not null auto_increment primary key,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

create table prijatelj (
    sifra int not null auto_increment primary key,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstroventno bit not null,
    prviputa datetime,
    svekar int
);

create table decko_zarucnica (
    sifra int not null auto_increment primary key,
    decko int not null,
    zarucnica int not null
);