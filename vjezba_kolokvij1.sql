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

create table zena (
    sifra int not null auto_increment primary key,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null    
);

create table muskarac (
    sifra int not null auto_increment primary key,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

create table mladic (
    sifra int not null auto_increment primary key,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugipita datetime,
    asocijalno bit,
    ekstroventno bit not null,
    dukserica varchar(48) not null,
    muskarac int not null
);

create table cura (
    sifra int not null auto_increment primary key,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    oglica int not null,
    bojakose varchar(38),
    suknja varchar(36)
);

create table sestra_svekar (
    sifra int not null auto_increment primary key,
    sestra int not null,
    svekar int not null
);

alter table zena add foreign key(sestra) references sestra(sifra);
alter table muskarac add foreign key(zena) references zena(sifra);
alter table mladic add foreign key(mladic) references muskarac(sifra);

alter table sestra_svekar add foreign key(svekar) references svekar(sifra);
alter table sestra_svekar add foreign key(sestra) references sestra(sifra);

alter table cura add foreign key(punac) references punac(sifra);


