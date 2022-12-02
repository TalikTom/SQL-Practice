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


alter table cura add foreign key(decko) references decko(sifra);

alter table prijatelj add foreign key(svekar) references svekar(sifra);

alter table decko_zarucnica add foreign key(decko) references decko(sifra);
alter table decko_zarucnica add foreign key(zarucnica) references zarucnica(sifra);

alter table neprijatelj add foreign key(cura) references cura(sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);


insert into decko (asocijalno)
values (1);
insert into decko (asocijalno)
values (1);
insert into decko (asocijalno)
values (1);

insert into cura (haljina, drugiputa, majica)
values ('crvena', '1976-02-02', 'zuta');
insert into cura (haljina, drugiputa, majica)
values ('crvena', '1975-02-01', 'crvena');
insert into cura (haljina, drugiputa, majica)
values ('crvena', '1972-02-02', 'plava');

insert into zarucnica (bojakose, lipa, indiferentno)
values('crna', 15.1, 1);
insert into zarucnica (bojakose, lipa, indiferentno)
values('crna', 15.2, 1);
insert into zarucnica (bojakose, lipa, indiferentno)
values('crna', 15.3, 1);

insert into decko_zarucnica (decko, zarucnica)
values (2, 1);
insert into decko_zarucnica (decko, zarucnica)
values (1, 2);
insert into decko_zarucnica (decko, zarucnica)
values (2, 1);



insert into neprijatelj (haljina, modelnaocala, kuna, cura)
values ('plave', 'kockaste', 15.1, 1);
insert into neprijatelj (haljina, modelnaocala, kuna, cura)
values ('plave', 'kockaste', 15.3, 2);
insert into neprijatelj (haljina, modelnaocala, kuna, cura)
values ('plave', 'kockaste', 15.7, 3);

update prijatelj
set treciputa = '2020-04-30';

delete from brat
where not ogrlica = 14;

select suknja from cura
where drugiputa is null;

select a.novcica, f.neprijatelj, e.haljina
from zarucnica a
inner join decko_zarucnica b
on a.sifra = b.zarucnica
inner join decko c
on c.sifra = b.decko 
inner join cura d 
on d.decko = c.sifra 
inner join neprijatelj e
on e.cura = d.sifra 
inner join brat f 
on f.neprijatelj = e.sifra
where d.drugiputa is not null
and c.vesta like '%ba%'
order by e.haljina desc;