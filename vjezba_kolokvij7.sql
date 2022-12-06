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

#prijateljica ostavljen i zarucnik?mladic

insert into prijateljica (gustoca)
values(14.3);
insert into prijateljica (gustoca)
values(14.1);
insert into prijateljica (gustoca)
values(14.2);

insert into zarucnik (asocijalno, narukvica, novcica)
values (1, 124, 15.5);
insert into zarucnik (asocijalno, narukvica, novcica)
values (1, 1242, 15.5);
insert into zarucnik (asocijalno, narukvica, novcica)
values (1, 1244, 25.5);

insert into ostavljen (introvertno, kratkamajica, prstena, zarucnik)
values (1, 'crvena', 123, 1);
insert into ostavljen (introvertno, kratkamajica, prstena, zarucnik)
values (1, 'crvena', 1232, 2);
insert into ostavljen (introvertno, kratkamajica, prstena, zarucnik)
values (1, 'plava', 1243, 1);



insert into mladic (lipa, narukvica, drugiputa)
values (14.4, 64, 2022-01-01);
insert into mladic (lipa, narukvica, drugiputa)
values (14.4, 64, 2022-01-02);
insert into mladic (lipa, narukvica, drugiputa)
values (14.5, 624, 2022-01-03);

insert into zarucnik_mladic (zarucnik, mladic)
values (1,2);
insert into zarucnik_mladic (zarucnik, mladic)
values (2,2);
insert into zarucnik_mladic (zarucnik, mladic)
values (2,1);

update punica
set eura = 15.77;

delete from sestra
where hlace < 'AB';

select kratkamajica from ostavljen
where introvertno is null;

select a.asocijalno, a.modelnaocala
from zarucnik a
inner join zarucnik_mladic b 
on a.sifra = b.zarucnik
where b.zarucnik is null

#mladic, sestra, prijateljica

select f.narukvica, a.stilfrizura, a.gustoca
from sestra a 
inner join prijateljica b 
on b.sifra = a.prijateljica
inner join ostavljen c 
on c.sifra = b.ostavljen
inner join zarucnik d 
on d.zarucnik = c.sifra 
inner join zarucnik_mladic e 
on e.zarucnik = d.sifra 
inner join mladic f 
on f.sifra = e.mladic 
where c.introvertno is not null 
and d.asocijalno is not null
order by b.gustoca desc;