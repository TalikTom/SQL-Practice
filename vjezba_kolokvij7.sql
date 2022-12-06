drop database if exists kolokvij7;
create database kolokvij7;
use kolokvij7;

create table cura (
    sifra int not null auto_increment primary key,
    lipa decimal(12,9) not null,
    introvertno bit,
    modelnaocala varchar(40),
    narukvica int,
    treciputa datetime,
    kuna decimal(14,9)
);

create table mladic (
    sifra int not null auto_increment primary key,
    prstena int,
    lipa decimal(14,5) not null,
    narukvica int not null,
    drugiputa datetime not null
);

create table zarucnik (
    sifra int not null auto_increment primary key,
    vesta varchar(34),
    asocijalno bit not null,
    modelnaocala varchar(43),
    narukvica int not null,
    novcica decimal(15,5) not null
);

create table punica (
    sifra int not null auto_increment primary key,
    majica varchar(40),
    eura decimal(12,6) not null,
    prstena int,
    cura int not null,
    foreign key (cura) references cura(sifra)
);


create table zarucnik_mladic (
    sifra int not null auto_increment primary key,
    zarucnik int not null,
    mladic int not null,
    foreign key (zarucnik) references zarucnik(sifra),
    foreign key (mladic) references mladic(sifra)
);

create table ostavljen (
    sifra int not null auto_increment primary key,
    lipa decimal(14,6),
    introvertno bit not null,
    kratkamajica varchar(38) not null,
    prstena int not null,
    zarucnik int not null,
    foreign key (zarucnik) references zarucnik(sifra)
);

create table prijateljica (
    sifra int not null auto_increment primary key,
    haljina varchar(45),
    gustoca decimal(15,10) not null,
    ogrlica int,
    novcica decimal(12,5),
    ostavljen int,
    foreign key (ostavljen) references ostavljen(sifra)
);

create table sestra (
    sifra int not null auto_increment primary key,
    bojakose varchar(34) not null,
    hlace varchar(36) not null,
    lipa decimal(15,6),
    stilfrizura varchar(40) not null,
    maraka decimal(12,8) not null,
    prijateljica int not null,
    foreign key (prijateljica) references prijateljica(sifra)
);

