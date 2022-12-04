drop database if exists kolokvij4;
create database kolokvij4;
use kolokvij4;

create table mladic (
    sifra int not null auto_increment primary key,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura varchar(49),
    vesta varchar(34) not null
);

create table zena (
    sifra int not null auto_increment primary key,
    suknja varchar(39) not null,
    lipa decimal(18,7),
    prstena int not null
);

create table ostavljen (
    sifra int not null auto_increment primary key,
    modelnaocala varchar(43),
    introvertno bit,
    kuna decimal(14,10)
);

create table punac (
    sifra int not null auto_increment primary key,
    treciputa decimal,
    majica varchar(46),
    jmbag char(11) not null,
    novcica decimal(18,7) not null,
    maraka decimal(12,6) not null,
    ostavljen int not null
);

create table zena_mladic (
    sifra int not null auto_increment primary key,
    zena int not null,
    mladic int not null
);

create table snasa (
    sifra int not null auto_increment primary key,
    introvertno bit,
    treciput datetime,
    haljina varchar(44) not null,
    zena int not null
);

create table becar (
    sifra int not null auto_increment primary key,
    novcica decimal(14,8),
    kratkamajica varchar(48) not null,
    bojaociju varchar(36) not null,
    snasa int not null
);

create table prijatelj (
    sifra int not null auto_increment primary key,
    eura decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag char(11) not null,
    suknja varchar(47) not null,
    becar int not null
);


alter table punac add foreign key (ostavljen) references ostavljen(sifra);

alter table snasa add foreign key(zena) references zena(sifra);

alter table becar add foreign key(snasa) references snasa(sifra);

alter table prijatelj add foreign key(becar) references becar(sifra);


alter table zena_mladic add foreign key(mladic) references mladic(sifra);
alter table zena_mladic add foreign key(zena) references zena(sifra);