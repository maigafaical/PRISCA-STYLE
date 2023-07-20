/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  19/07/2023 16:26:43                      */
/*==============================================================*/


drop table if exists achats;

drop table if exists articles;

drop table if exists clients;

drop table if exists couture;

drop table if exists fournisseurs;

drop table if exists mesures;

drop table if exists modeles;

drop table if exists paiements;

drop table if exists personnels;

drop table if exists rendez_vous;

drop table if exists roles;

/*==============================================================*/
/* Table : achats                                               */
/*==============================================================*/
create table achats
(
   id_achat             int not null,
   id_fournisseur       int not null,
   id_articles          int not null,
   designation          varchar(254),
   quantite             int,
   prix_unitaire        float,
   date_achat           datetime,
   primary key (id_achat)
);

/*==============================================================*/
/* Table : articles                                             */
/*==============================================================*/
create table articles
(
   id_articles          int not null,
   nom                  varchar(254),
   type_produit         varchar(254),
   prix_unitaire        float,
   primary key (id_articles)
);

/*==============================================================*/
/* Table : clients                                              */
/*==============================================================*/
create table clients
(
   id_clients           int not null,
   nom_prenom           varchar(254),
   adresse              varchar(254),
   telephone            int,
   sexe                 varchar(254),
   primary key (id_clients)
);

/*==============================================================*/
/* Table : couture                                              */
/*==============================================================*/
create table couture
(
   id_couture           int not null,
   id_modele            int not null,
   id_mesure            int not null,
   id_clients           int not null,
   montant              float,
   date_depot           datetime,
   date_recuperation    datetime,
   primary key (id_couture)
);

/*==============================================================*/
/* Table : fournisseurs                                         */
/*==============================================================*/
create table fournisseurs
(
   id_fournisseur       int not null,
   nom_prenom           varchar(254),
   adresse              varchar(254),
   telephone            int,
   type_fournisseur     varchar(254),
   primary key (id_fournisseur)
);

/*==============================================================*/
/* Table : mesures                                              */
/*==============================================================*/
create table mesures
(
   id_mesure            int not null,
   id_modele            int not null,
   id_clients           int not null,
   poitrine             int,
   taille_robe          int,
   bassins              int,
   longueur_manche      int,
   dos                  int,
   date_mesure          datetime,
   primary key (id_mesure)
);

/*==============================================================*/
/* Table : modeles                                              */
/*==============================================================*/
create table modeles
(
   id_modele            int not null,
   type_modele          varchar(254),
   primary key (id_modele)
);

/*==============================================================*/
/* Table : paiements                                            */
/*==============================================================*/
create table paiements
(
   id_paiement          int not null,
   id_clients           int,
   montant              float,
   acompte              float,
   reste                float,
   mode_paiement        varchar(254),
   date_paiement        int,
   primary key (id_paiement)
);

/*==============================================================*/
/* Table : personnels                                           */
/*==============================================================*/
create table personnels
(
   id_personnel         int not null,
   nom_prenom           varchar(254),
   adresse              varchar(254),
   telephone            int,
   type_personnel       varchar(254),
   primary key (id_personnel)
);

/*==============================================================*/
/* Table : rendez_vous                                          */
/*==============================================================*/
create table rendez_vous
(
   id_rdv               int not null,
   id_clients           int not null,
   libelle              varchar(254),
   date_rdv             datetime,
   primary key (id_rdv)
);

/*==============================================================*/
/* Table : roles                                                */
/*==============================================================*/
create table roles
(
   id_roles             int not null,
   type_role            varchar(254),
   primary key (id_roles)
);

alter table achats add constraint FK_Association_5 foreign key (id_fournisseur)
      references fournisseurs (id_fournisseur) on delete restrict on update restrict;

alter table achats add constraint FK_Association_6 foreign key (id_articles)
      references articles (id_articles) on delete restrict on update restrict;

alter table couture add constraint FK_Association_10 foreign key (id_modele)
      references modeles (id_modele) on delete restrict on update restrict;

alter table couture add constraint FK_Association_8 foreign key (id_clients)
      references clients (id_clients) on delete restrict on update restrict;

alter table couture add constraint FK_Association_9 foreign key (id_mesure)
      references mesures (id_mesure) on delete restrict on update restrict;

alter table mesures add constraint FK_Association_1 foreign key (id_clients)
      references clients (id_clients) on delete restrict on update restrict;

alter table mesures add constraint FK_Association_2 foreign key (id_modele)
      references modeles (id_modele) on delete restrict on update restrict;

alter table paiements add constraint FK_Association_7 foreign key (id_clients)
      references clients (id_clients) on delete restrict on update restrict;

alter table rendez_vous add constraint FK_Association_3 foreign key (id_clients)
      references clients (id_clients) on delete restrict on update restrict;

