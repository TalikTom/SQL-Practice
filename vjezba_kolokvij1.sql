drop database if exists kolokvij1;
create database kolokvij1;
use kolokvij1;

create table sestra(
    sifra int not null auto_increment primary key,
    introvertno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46)
);

create table punac (
    sifra int not null auto_increment primary key,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41)
);

create table svekar (
    sifra int not null auto_increment primary key,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

