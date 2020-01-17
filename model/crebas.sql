/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     2018/11/20 15:00:17                          */
/*==============================================================*/


drop table t_app;

drop table t_app_attr;

drop table t_binding_phone_history;

drop table t_button;

drop table t_certification_info;

drop table t_login_info;

drop table t_menu;

drop table t_module;

drop table t_operator;

drop table t_operator_attr;

drop table t_operator_role;

drop table t_organization;

drop table t_people;

drop table t_privilege;

drop table t_role;

/*==============================================================*/
/* Table: t_app                                                 */
/*==============================================================*/
create table t_app (
   id                   VARCHAR(32)          not null,
   secret               VARCHAR(32)          null,
   name                 VARCHAR(32)          null,
   organization_id      VARCHAR(32)          null,
   constraint PK_T_APP primary key (id)
);

comment on table t_app is
'ʵ�����
Ӧ��';

comment on column t_app.id is
'app_id';

comment on column t_app.secret is
'��Կ';

comment on column t_app.name is
'Ӧ����';

comment on column t_app.organization_id is
'��֯ID';

/*==============================================================*/
/* Table: t_app_attr                                            */
/*==============================================================*/
create table t_app_attr (
   app_id               VARCHAR(32)          null,
   name                 VARCHAR(32)          null,
   type                 VARCHAR(32)          null,
   required             BOOL                 null,
   default_value        VARCHAR(32)          null,
   sort                 INT2                 null,
   constraint PK_T_APP_ATTR primary key ()
);

comment on table t_app_attr is
'ֵ����
Ӧ������';

/*==============================================================*/
/* Table: t_binding_phone_history                               */
/*==============================================================*/
create table t_binding_phone_history (
   people_id            VARCHAR(32)          null,
   phone                VARCHAR(11)          null,
   create_time          TIMESTAMP            null,
   binding_type         VARCHAR(11)          null,
   constraint PK_T_BINDING_PHONE_HISTORY primary key ()
);

comment on table t_binding_phone_history is
'ֵ����
���ֻ��ż�¼';

comment on column t_binding_phone_history.binding_type is
'BINDING,
UNBINDING';

/*==============================================================*/
/* Table: t_button                                              */
/*==============================================================*/
create table t_button (
   id                   VARCHAR(32)          not null,
   btn_no               VARCHAR(45)          null,
   btn_name             VARCHAR(50)          null,
   btn_type             VARCHAR(32)          null,
   btn_icon             VARCHAR(32)          null,
   menu_id              VARCHAR(32)          null,
   init_status          BOOL                 null,
   constraint PK_T_BUTTON primary key (id)
);

comment on table t_button is
'ʵ�����
��ť';

comment on column t_button.btn_no is
'��ť����';

comment on column t_button.btn_name is
'��ť����';

comment on column t_button.btn_type is
'��ť����';

comment on column t_button.btn_icon is
'��ť��';

comment on column t_button.menu_id is
'�˵�ID';

comment on column t_button.init_status is
'1����,0������';

/*==============================================================*/
/* Table: t_certification_info                                  */
/*==============================================================*/
create table t_certification_info (
   id_card_number       VARCHAR(20)          not null,
   name                 VARCHAR(45)          null,
   card_front           VARCHAR(200)         null,
   card_back            VARCHAR(200)         null,
   people_id            VARCHAR(32)          null,
   constraint PK_T_CERTIFICATION_INFO primary key (id_card_number)
);

comment on table t_certification_info is
'ֵ����
ʵ����֤';

/*==============================================================*/
/* Table: t_login_info                                          */
/*==============================================================*/
create table t_login_info (
   people_id            VARCHAR(32)          not null,
   source               VARCHAR(32)          null,
   mark                 VARCHAR(32)          null,
   status               VARCHAR(32)          null,
   constraint PK_T_LOGIN_INFO primary key (people_id)
);

comment on table t_login_info is
'ֵ����
��¼��ʽ';

comment on column t_login_info.source is
'PASSWORD,
PHONE,
QQ,
WECHART,
ALIPAY,
FACEBOOK,
GOOGLE
';

comment on column t_login_info.status is
'normal,
disable
';

/*==============================================================*/
/* Table: t_menu                                                */
/*==============================================================*/
create table t_menu (
   id                   VARCHAR(32)          not null,
   menu_no              VARCHAR(45)          null,
   module_id            VARCHAR(32)          null,
   parent_id            VARCHAR(32)          null,
   order_list           INT2                 null,
   name                 VARCHAR(50)          null,
   url                  VARCHAR(200)         null,
   icon                 VARCHAR(200)         null,
   is_visible           BOOL                 null,
   is_leaf              INT2                 null,
   constraint PK_T_MENU primary key (id)
);

comment on table t_menu is
'ʵ�����
�˵�';

comment on column t_menu.menu_no is
'�˵�����';

comment on column t_menu.module_id is
'ģ��ID';

comment on column t_menu.parent_id is
'�ϼ�ID';

comment on column t_menu.order_list is
'����';

comment on column t_menu.name is
'�˵�����';

comment on column t_menu.url is
'�˵���ַ';

comment on column t_menu.icon is
'�˵�ͼ��';

comment on column t_menu.is_visible is
'�Ƿ�����';

comment on column t_menu.is_leaf is
'�Ƿ�ΪҶ�ӽڵ�';

/*==============================================================*/
/* Table: t_module                                              */
/*==============================================================*/
create table t_module (
   id                   VARCHAR(32)          not null,
   module_code          VARCHAR(45)          null,
   module_name          VARCHAR(50)          null,
   module_desc          VARCHAR(32)          null,
   module_icon          VARCHAR(32)          null,
   module_url           VARCHAR(32)          null,
   app_id               VARCHAR(32)          null,
   constraint PK_T_MODULE primary key (id)
);

comment on table t_module is
'ʵ�����
ϵͳģ��';

comment on column t_module.module_code is
'����';

comment on column t_module.module_name is
'����';

comment on column t_module.module_desc is
'����';

comment on column t_module.module_icon is
'ͼ��';

comment on column t_module.module_url is
'��ַ';

comment on column t_module.app_id is
'Ӧ��ID';

/*==============================================================*/
/* Table: t_operator                                            */
/*==============================================================*/
create table t_operator (
   id                   VARCHAR(20)          not null,
   people_id            VARCHAR(32)          null,
   app_id               VARCHAR(32)          null,
   constraint PK_T_OPERATOR primary key (id)
);

comment on table t_operator is
'ʵ�����
ϵͳ����Ա';

/*==============================================================*/
/* Table: t_operator_attr                                       */
/*==============================================================*/
create table t_operator_attr (
   operator_id          VARCHAR(32)          not null,
   name                 VARCHAR(32)          null,
   value                VARCHAR(255)         null,
   sort                 INT2                 null,
   constraint PK_T_OPERATOR_ATTR primary key (operator_id)
);

comment on table t_operator_attr is
'����Ա����';

/*==============================================================*/
/* Table: t_operator_role                                       */
/*==============================================================*/
create table t_operator_role (
   role_id              VARCHAR(32)          not null,
   operator_id          VARCHAR(32)          null,
   constraint PK_T_OPERATOR_ROLE primary key (role_id)
);

comment on table t_operator_role is
'ֵ����
��ɫ';

/*==============================================================*/
/* Table: t_organization                                        */
/*==============================================================*/
create table t_organization (
   id                   VARCHAR(32)          not null,
   name                 VARCHAR(32)          null,
   organization_type    VARCHAR(32)          null,
   register_number      VARCHAR(32)          null,
   zip_code             VARCHAR(32)          null,
   address              VARCHAR(200)         null,
   organization_code    VARCHAR(32)          null,
   business_scope       VARCHAR(300)         null,
   business_license     VARCHAR(32)          null,
   license_type         VARCHAR(32)          null,
   legal_person_name    VARCHAR(45)          null,
   legal_person_id_number VARCHAR(45)          null,
   legal_person_id_front VARCHAR(200)         null,
   legal_person_id_back VARCHAR(200)         null,
   constraint PK_T_ORGANIZATION primary key (id)
);

comment on table t_organization is
'ʵ�����
��֯����';

/*==============================================================*/
/* Table: t_people                                              */
/*==============================================================*/
create table t_people (
   id                   VARCHAR(32)          not null,
   phone                VARCHAR(11)          null,
   constraint PK_T_PEOPLE primary key (id)
);

comment on table t_people is
'ʵ�����   
��
';

/*==============================================================*/
/* Table: t_privilege                                           */
/*==============================================================*/
create table t_privilege (
   id                   VARCHAR(32)          not null,
   master_type          VARCHAR(45)          null,
   maser_id             VARCHAR(32)          null,
   access_type          VARCHAR(45)          null,
   access_id            VARCHAR(32)          null,
   is_operatation       BOOL                 null,
   app_id               VARCHAR(32)          null,
   constraint PK_T_PRIVILEGE primary key (id)
);

comment on table t_privilege is
'ʵ�����
Ȩ�޹����';

comment on column t_privilege.master_type is
'Ȩ������ 1 ��ɫ 2 �û� ';

comment on column t_privilege.maser_id is
'����ID';

comment on column t_privilege.access_type is
'Ȩ�޷������� 1 �˵� 2 ��ť 3 ģ��';

comment on column t_privilege.access_id is
'Ȩ�޷���id menu_id����button_id����module_id';

comment on column t_privilege.is_operatation is
'��ֹʹ�� Ĭ��false';

comment on column t_privilege.app_id is
'Ӧ��ID';

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role (
   id                   VARCHAR(20)          not null,
   name                 VARCHAR(45)          null,
   "desc"               VARCHAR(200)         null,
   constraint PK_T_ROLE primary key (id)
);

comment on table t_role is
'ʵ�����
��ɫ';

