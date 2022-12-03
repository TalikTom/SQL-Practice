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

insert into prijatelj (haljina, indiferentno)
values('crvena', 1);
insert into prijatelj (haljina, indiferentno)
values('plava', 0);
insert into prijatelj (haljina, indiferentno)
values('crvena', 0);

insert into brat (ogrlica, ekstroventno)
values(123, 1);
insert into brat (ogrlica, ekstroventno)
values(1223, 0);
insert into brat (ogrlica, ekstroventno)
values(1213, 1);

insert into ostavljena(modelnaocala, prijatelj)
values('kockaste', 1);
insert into ostavljena(modelnaocala, prijatelj)
values('okrugle', 2);
insert into ostavljena(modelnaocala, prijatelj)
values('kockaste', 1);

insert into prijatelj_brat (prijatelj, brat)
values(1,1);
insert into prijatelj_brat (prijatelj, brat)
values(1,2);
insert into prijatelj_brat (prijatelj, brat)
values(2,1);

insert into snasa (kuna, eura, ostavljena)
values(12.4,51.2,1);
insert into snasa (kuna, eura, ostavljena)
values(12.44,51.22,2);
insert into snasa (kuna, eura, ostavljena)
values(12.24,52.2,1);

update svekar
set suknja = 'Osijek';

delete * from punica
where kratkamajica = 'AB';

select majica from ostavljena
where majica not in (9,10,20,30,35);

select c.ekstroventno, f.vesta, e.kuna
from prijatelj a
inner join prijatelj_brat b
on a.sifra = b.prijatelj
inner join brat c
on c.sifra = b.brat
inner join ostavljena d
on a.sifra = d.prijatelj
inner join snasa e
on d.sifra = e.ostavljena
inner join punica f
on e.sifra = f.snasa
where not d.lipa = 91
and where a.haljina like '%ba%'
order by e.kuna desc;

select a.haljina, a.lipa
from prijatelj a
where not exists
(select * from prijatelj_brat b  
where b.prijatelj = a.sifra);

