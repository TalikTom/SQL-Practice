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


insert into prijatelj (prstena, stilfrizura)
values(12, 'nakratko');
insert into prijatelj (prstena, stilfrizura)
values(13, 'nakratko2');
insert into prijatelj (prstena, stilfrizura)
values(11, 'nakratko3');

insert into ostavljena (prviputa, kratkamajica)
values(2022-01-01, 'crvena');

insert into ostavljena (prviputa, kratkamajica)
values(2022-01-02, 'crvena2');

insert into ostavljena (prviputa, kratkamajica)
values(2022-01-03, 'crvena3');

insert into prijatelj_ostavljena(prijatelj, ostavljena)
values(1,1);
insert into prijatelj_ostavljena(prijatelj, ostavljena)
values(1,2);
insert into prijatelj_ostavljena(prijatelj, ostavljena)
values(2,1);

insert into brat (nausnica, treciputa, narukvica, prijatelj)
values (11, 2021-01-01, 51, 1);
insert into brat (nausnica, treciputa, narukvica, prijatelj)
values (112, 2021-01-01, 52, 2);
insert into brat (nausnica, treciputa, narukvica, prijatelj)
values (111, 2021-01-01, 53, 1);

insert into zena (novcica, narukvica, dukserica, brat)
values(11.2,11, 'plava', 1);
insert into zena (novcica, narukvica, dukserica, brat)
values(11.2,11, 'plava', 2);
insert into zena (novcica, narukvica, dukserica, brat)
values(11.2,11, 'plava', 1);

update svekrva
set suknja = 'Osijek';

delete from decko
where modelnaocala < 'AB';

select narukvica from brat 
where treciputa is null;

select a.drugiputa, f.zena, e.narukvica
from ostavljena a
inner join prijatelj_ostavljena b
on a.sifra = b.prijatelj
inner join prijatelj c
on c.sifra = b.prijatelj
inner join brat d
on d.prijatelj = c.sifra
inner join zena e
on e.brat = d.sifra
inner join decko f
on f.zena = e.sifra
where d.treciputa is not null 
and c.prstena = 219
order by e.narukvica desc;

select a.prstena, a.introvertno
from prijatelj a 
inner join prijatelj_ostavljena b
where not a.sifra = b.prijatelj;

