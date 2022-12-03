drop database if exists kolokvij3;
create database kolokvij3;
use kolokvij3;

create table cura (
    sifra int not null auto_increment primary key,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal(14,8),
    ogrlica int not null
);

create table brat (
    sifra int not null auto_increment primary key,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno bit not null
);

create table prijatelj_brat (
    sifra int not null auto_increment primary key,
    prijatelj int not null,
    brat int not null
);

create table prijatelj (
    sifra int not null auto_increment primary key,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno bit not null
);

create table ostavljena (
    sifra int not null auto_increment primary key,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36),
    modelnaocala varchar(31) not null,
    prijatelj int
);

create table snasa (
    sifra int not null auto_increment primary key,
    introvertno bit,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int not null
);

create table punica (
    sifra int not null auto_increment primary key,
    asocijalno bit,
    kratkamajica varchar(44),
    kuna decimal(13,8),
    vesta varchar(32),
    snasa int 
);

create table svekar (
    sifra int not null auto_increment primary key,
    novcica decimal(16,8),
    suknja varchar(44),
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int not null
);


alter table svekar add foreign key (cura) references cura(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table punica add foreign key (snasa) references snasa(sifra);
