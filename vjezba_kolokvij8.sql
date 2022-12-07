drop database if exists kolokvij8;
create database kolokvij8;
use kolokvij8;

create table prijateljica(
    sifra int not null auto_increment primary key,
    vesta varchar(50),
    nausnica int not null,
    introvertno bit not null
);

create table decko (
    sifra int not null auto_increment primary key,
    kuna decimal(12,10),
    lipa decimal(17,10),
    bojakose varchar(44),
    treciputa datetime not null,
    ogrlica int not null,
    ekstrovertno int not null
);

create table muskarac (
    sifra int not null auto_increment primary key,
    haljina varchar(47),
    drugiputa datetime not null,
    treciputa datetime
);

create table muskarac_decko (
    sifra int not null auto_increment primary key,
    muskarac int not null,
    decko int not null,
    foreign key (muskarac) references muskarac(sifra),
    foreign key (decko) references decko(sifra)
);

create table becar (
    sifra int not null auto_increment primary key,
    eura decimal(15,10) not null,
    treciputa datetime,
    prviputa datetime,
    muskarac int not null,
    foreign key (muskarac) references muskarac(sifra)
);

create table neprijatelj (
    sifra int not null auto_increment primary key,
    kratkamajica varchar(44),
    introvertno bit,
    indiferentno bit,
    ogrlica int not null,
    becar int not null,
    foreign key (becar) references becar(sifra)
);

create table brat (
    sifra int not null auto_increment primary key,
    introvertno bit,
    novcica decimal(14,7) not null,
    treciputa datetime,
    neprijatelj int not null
);

create table cura (
    sifra int not null auto_increment primary key,
    nausnica int not null,
    indiferentno bit,
    ogrlica int not null,
    gustoca decimal(12,6),
    drugiputa datetime,
    vesta varchar(33),
    prijateljica int
);