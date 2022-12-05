drop database if exists kolokvij5;
create database kolokvij5;
use kolokvij5;

create table zarucnik (
    sifra int not null auto_increment primary key,
    jmbag char(11),
    lipa decimal(12,8),
    indiferentno bit not null
);

create table svekar (
    sifra int not null auto_increment primary key,
    bojakose varchar(33),
    majica varchar(31),
    carape varchar(31) not null,
    haljina varchar(43),
    narukvica int,
    eura decimal(14,5) not null
);

create table cura (
    sifra int not null auto_increment primary key,
    carape varchar(41) not null,
    maraka decimal(17,10) not null,
    asocijalno bit,
    vesta varchar(47)
);

create table mladic (
    sifra int not null auto_increment primary key,
    kratkamajica varchar(48) not null,
    haljina varchar(30) not null,
    asocijalno bit,
    zarucnik int
);

create table svekar_cura (
    sifra int not null auto_increment primary key,
    svekar int not null,
    cura int not null
);

create table punac (
    sifra int not null auto_increment primary key,
    dukserica varchar(33),
    prviputa datetime not null,
    majica varchar(36),
    svekar int not null
);

create table punica (
    sifra int not null auto_increment primary key,
    hlace varchar(43) not null,
    nausnica int not null,
    ogrlica int,
    vesta varchar(49) not null,
    modelnaocala varchar(31) not null,
    trecputa datetime not null,
    punac int not null
);

create table ostavljena (
    sifra int not null auto_increment primary key,
    majica varchar(33),
    ogrlica int not null,
    carape varchar(44),
    stilfrizura varchar(42),
    punica int not null
);

alter table svekar_cura add foreign key(svekar) references svekar(sifra);
alter table svekar_cura add foreign key(cura) references cura(sifra);

alter table punac add foreign key(svekar) references svekar(sifra);

alter table punica add foreign key(punac) references punac(sifra);

alter table ostavljena add foreign key(punica) references punica(sifra);

alter table mladic add foreign key(zarucnik) references zarucnik(sifra);


insert into svekar(carape, eura)
values('crne', 15.6);
insert into svekar(carape, eura)
values('plave', 25.6);
insert into svekar(carape, eura)
values('zelene', 15.26);

insert into cura(carape, maraka, vesta)
values('crne',17.4,'pulover');
insert into cura(carape, maraka, vesta)
values('plave',17.14,'pulover2');
insert into cura(carape, maraka, vesta)
values('zelene',17.42,'pulover3');


insert into svekar_cura(svekar, cura)
values(1,2);
insert into svekar_cura(svekar, cura)
values(2,2);
insert into svekar_cura(svekar, cura)
values(1,1);

insert into punac (prviputa, svekar)
values(2022-01-01, 1);
insert into punac (prviputa, svekar)
values(2022-02-01, 1);
insert into punac (prviputa, svekar)
values(2022-01-03, 2);

insert into punica (hlace, nausnica, vesta, modelnaocala, trecputa, punac)
values('plave', 12, 'pulo','luxoria',2021-01-01,1);
insert into punica (hlace, nausnica, vesta, modelnaocala, trecputa, punac)
values('plave', 12, 'pulo','luxoria',2022-01-01,2);
insert into punica (hlace, nausnica, vesta, modelnaocala, trecputa, punac)
values('crvene', 12, 'pulo','luxoria',2022-01-01,1);

update mladic
set haljina = 'Osijek';

delete * from ostavljena
where ogrlica = 17;

select majica from punac
where prviputa is null;

select a.asocijalno, f.stilfrizura, e.nausnica
from cura a
inner join svekar_cura b
on a.sifra = b.cura
inner join svekar c
on c.sifra = b.svekar
inner join punac d
on d.svekar = c.sifra
inner join punica e
on e.punac = d.sifra
inner join ostavljena f
on f.punica = e.sifra
where d.prviputa is not null
and c.majica like '%ba%'
order by e.nausnica desc;

select a.majica, a.carape
from svekar a
inner join svekar_cura b 
on b.svekar = a.sifra 
where b.svekar is null;