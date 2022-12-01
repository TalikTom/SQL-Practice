drop database if exists kolokvij1;
create database kolokvij1;
use kolokvij1;

create table sestra(
    sifra int not null auto_increment primary key,
    introvertno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46),
    narukvica int not null
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
    suknja varchar(36),
    punac int
);

create table sestra_svekar (
    sifra int not null auto_increment primary key,
    sestra int not null,
    svekar int not null
);

alter table zena add foreign key(sestra) references sestra(sifra);
alter table muskarac add foreign key(zena) references zena(sifra);
alter table mladic add foreign key(muskarac) references muskarac(sifra);

alter table sestra_svekar add foreign key(svekar) references svekar(sifra);
alter table sestra_svekar add foreign key(sestra) references sestra(sifra);

alter table cura add foreign key(punac) references punac(sifra);


select * from sestra;

insert into sestra(haljina, hlace, narukvica)
values ('plava', 'somotne', 31);

insert into sestra(haljina, hlace, narukvica)
values ('crvena', 'levis', 12);

insert into sestra(haljina, hlace, narukvica)
values ('crvena', 'jeans', 11);

insert into zena (kratkamajica, jmbag, bojaociju, sestra)
values ('crvena', 12512514351, 'pink', 1);

insert into zena (kratkamajica, jmbag, bojaociju, sestra)
values ('plava', 14512513351, 'roza', 2);

insert into zena (kratkamajica, jmbag, bojaociju, sestra)
values ('zelena', 12512523351, 'lila', 3);

insert into muskarac (bojaociju, maraka, zena)
values ('bijele', 1.5, 1);

insert into muskarac (bojaociju, maraka, zena)
values ('plave', 1.2, 2);

insert into muskarac (bojaociju, maraka, zena)
values ('bijele', 1.2, 3);

select * from sestra_svekar;

insert into svekar (bojaociju, prstena, eura)
values ('plava', 3, 12.5);

insert into svekar (bojaociju, prstena, eura)
values ('plava', 3, 13.5);

insert into svekar (bojaociju, prstena, eura)
values ('plava', 3, 12.5);

insert into sestra_svekar (svekar, sestra)
values (1,1);

insert into sestra_svekar (svekar, sestra)
values (2,2);

insert into sestra_svekar (svekar, sestra)
values (3,1);

update cura
set gustoca = 15.77;

delete from mladic
where kuna > 15.78;

select kratkamajica from zena
where hlace like '%ana%';

select a.dukserica, f.asocijalno, e.hlace
from svekar a
inner join sestra_svekar b
on a.sifra = b.svekar
inner join sestra c
on c.sifra = b.sestra
inner join zena d 
on d.sestra = c.sifra 
inner join muskarac e 
on e.zena = d.sifra 
inner join mladic f 
on f.muskarac = e.sifra
where d.hlace like 'a%'
and c.haljina like '%ba%'
order by e.hlace desc;

select c.haljina, c.maraka 
from sestra c
where not exists
(select * from sestra_svekar where sestra_svekar.sestra = c.sifra);