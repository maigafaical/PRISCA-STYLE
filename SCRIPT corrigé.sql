/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  20/07/2023 17:01:51                      */
/*==============================================================*/


drop table if exists clients;

drop table if exists couture;

drop table if exists depenses;

drop table if exists mesures;

drop table if exists modeles;

drop table if exists paiements;

drop table if exists personnels;

drop table if exists rendez_vous;

drop table if exists roles;

drop table if exists utilisateurs;

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
   id_utilisateur       int not null,
   id_modele            int not null,
   id_clients           int not null,
   montant              float,
   date_depot           datetime,
   date_recuperation    datetime,
   primary key (id_couture)
);

/*==============================================================*/
/* Table : depenses                                             */
/*==============================================================*/
create table depenses
(
   id_depense           int not null,
   id_personnel         int,
   id_utilisateur       int not null,
   libelle              int,
   montant              float,
   date_                datetime,
   primary key (id_depense)
);

/*==============================================================*/
/* Table : mesures                                              */
/*==============================================================*/
create table mesures
(
   id_mesure            int not null,
   id_modele            int not null,
   id_utilisateur       int not null,
   poitrine             int,
   taille_robe          int,
   bassins              int,
   longueur_manche      int,
   dos                  int,
   tour_taille          int,
   epaule               int,
   longueur_jupe        int,
   longue_chemise       int,
   longueur_pantalon    int,
   date_enregistrement_ datetime,
   primary key (id_mesure)
);

/*==============================================================*/
/* Table : modeles                                              */
/*==============================================================*/
create table modeles
(
   id_modele            int not null,
   id_utilisateur       int not null,
   type_modele          varchar(254),
   nom_modele           varchar(254),
   primary key (id_modele)
);

/*==============================================================*/
/* Table : paiements                                            */
/*==============================================================*/
create table paiements
(
   id_paiement          int not null,
   id_utilisateur       int not null,
   id_couture           int,
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
   id_utilisateur       int not null,
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
   id_utilisateur       int not null,
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
   nom_role             varchar(254),
   primary key (id_roles)
);

/*==============================================================*/
/* Table : utilisateurs                                         */
/*==============================================================*/
create table utilisateurs
(
   id_utilisateur       int not null,
   id_roles             int not null,
   nom_prenom           varchar(254),
   telephone            int,
   sexe                 varchar(254),
   email                varchar(254),
   mot_de_passe         varchar(254),
   primary key (id_utilisateur)
);

alter table couture add constraint FK_Association_13 foreign key (id_utilisateur)
      references utilisateurs (id_utilisateur) on delete restrict on update restrict;

alter table couture add constraint FK_Association_20 foreign key (id_modele)
      references modeles (id_modele) on delete restrict on update restrict;

alter table couture add constraint FK_Association_8 foreign key (id_clients)
      references clients (id_clients) on delete restrict on update restrict;

alter table depenses add constraint FK_Association_12 foreign key (id_personnel)
      references personnels (id_personnel) on delete restrict on update restrict;

alter table depenses add constraint FK_Association_15 foreign key (id_utilisateur)
      references utilisateurs (id_utilisateur) on delete restrict on update restrict;

alter table mesures add constraint FK_Association_17 foreign key (id_utilisateur)
      references utilisateurs (id_utilisateur) on delete restrict on update restrict;

alter table mesures add constraint FK_Association_19 foreign key (id_modele)
      references modeles (id_modele) on delete restrict on update restrict;

alter table modeles add constraint FK_Association_18 foreign key (id_utilisateur)
      references utilisateurs (id_utilisateur) on delete restrict on update restrict;

alter table paiements add constraint FK_Association_14 foreign key (id_utilisateur)
      references utilisateurs (id_utilisateur) on delete restrict on update restrict;

alter table paiements add constraint FK_Association_7 foreign key (id_couture)
      references couture (id_couture) on delete restrict on update restrict;

alter table personnels add constraint FK_Association_16 foreign key (id_utilisateur)
      references utilisateurs (id_utilisateur) on delete restrict on update restrict;

alter table rendez_vous add constraint FK_Association_3 foreign key (id_clients)
      references clients (id_clients) on delete restrict on update restrict;

alter table rendez_vous add constraint FK_Association_9 foreign key (id_utilisateur)
      references utilisateurs (id_utilisateur) on delete restrict on update restrict;

alter table utilisateurs add constraint FK_Association_11 foreign key (id_roles)
      references roles (id_roles) on delete restrict on update restrict;

