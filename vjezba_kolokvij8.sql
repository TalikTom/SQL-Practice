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

#neprijatelj becar muskarac_decko

insert into decko (treciputa, ogrlica, ekstrovertno)
values (2022-01-01, 123, 1);
insert into decko (treciputa, ogrlica, ekstrovertno)
values (2022-01-02, 1223, 1);
insert into decko (treciputa, ogrlica, ekstrovertno)
values (2022-01-01, 1243, 1);

insert into muskarac (drugiputa)
values (2021-05-05);
insert into muskarac (drugiputa)
values (2021-05-02);
insert into muskarac (drugiputa)
values (2021-05-01);

insert into muskarac_decko (muskarac, decko)
values (1,1);
insert into muskarac_decko (muskarac, decko)
values (1,2);
insert into muskarac_decko (muskarac, decko)
values (2,1);

insert into becar (eura, muskarac)
values (12.2, 1);
insert into becar (eura, muskarac)
values (12.2, 2);
insert into becar (eura, muskarac)
values (12.3, 1);

insert into neprijatelj (ogrlica, becar)
values (122, 1);
insert into neprijatelj (ogrlica, becar)
values (122, 2);
insert into neprijatelj (ogrlica, becar)
values (1223, 1);

update cura
set indiferentno = false;

delete from brat
where not novcica = 12.75;

select prviputa from becar
where treciputa is null;

select a.drugiputa, a.treciputa
from muskarac a
inner join muskarac_decko b 
on a.sifra = b.muskarac 
where b.muskarac is null;


select a.bojakose, f.neprijatelj, e.introvertno
from decko a 
inner join muskarac_decko b 
on a.sifra = b.decko 
inner join muskarac c 
on c.sifra = b.muskarac
inner join becar d 
on d.muskarac - c.sifra 
inner join neprijatelj e 
on e.becar = d.sifra
inner join brat f 
on f.neprijatelj = e.sifra 
where d.treciputa is not null
and c.drugiputa is not null 
order by e.introvertno desc;

