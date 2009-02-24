create table LOGIN_DATA (
   SELLS_NO             varchar(20)         not null,
   LOGIN_ID             varchar(20)         null,
   PASSWD               varchar(20)         null,
   LOGIN_TP             varchar(5)          null,
   constraint PK_LOGIN_DATA primary key (SELLS_NO)
);
insert into LOGIN_DATA values('S0000000001','davide','856069','A');


/*==============================================================*/
/* Table: LOGIN_REC                                             */
/*==============================================================*/
create table LOGIN_REC (
   SEQ                  varchar(10)         not null,
   SELLS_NO             varchar(20)         null,
   LOGIN_DT             datetime             null,
   LOGIN_IP             varchar(20)         null,
   constraint PK_LOGIN_REC primary key nonclustered (SEQ)
);

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS (
   ORDER_NO             varchar(20)         not null,
   SELLS_NO             varchar(20)         null,
   ORDER_DT             datetime             null,
   IP                   varchar(20)         null,
   NAME                 varchar(50)         null,
   EMAIL                varchar(150)        null,
   TEL                  varchar(30)         null,
   MOBILE               varchar(30)         null,
   ZIP                  varchar(10)         null,
   ADDRESS              varchar(100)        null,
   constraint PK_ORDERS primary key (ORDER_NO)
);

/*==============================================================*/
/* Table: SELLS                                                 */
/*==============================================================*/
create table SELLS (
   SELLS_NO             varchar(20)         not null,
   SELLS_NM             varchar(30)         null,
   EMAIL                varchar(150)        null,
   STORE_NM             varchar(100)        null,
   HOMEPAGE             varchar(200)        null,
   PAY_TYPE1            varchar(1)          null,
   PAY_TYPE2            varchar(1)          null,
   PAY_TYPE3            varchar(1)          null,
   PAY_TYPE4            varchar(1)          null,
   JOIN_DT              varchar(10)         null,
   EXPIRED_DT           varchar(10)         null,
   SELLS_LV             varchar(1)          null,
   PAY_DESC             varchar(1000)       null,
   FREIGHT_FARE         int                  null,
   FREIGHT_TP           varchar(1)          null,
   NOFREIGHT_FARE       int                  null,
   NOFREIGHT_QTY        int                  null,
   LOW_ACCOUNT          int                  null,
   UPDATE_DT            datetime             null,
   constraint PK_SELLS primary key (SELLS_NO)
);
insert into SELLS values('S0000000001','','davide@ggogo.com','',
'http://localhost','1','1','0','0','2007/02/03','9999/12/31','Y','',0,0,0,0,0,'2007-02-03 00:00:00.000');

/*==============================================================*/
/* Table: SELLS_REC                                             */
/*==============================================================*/
create table SELLS_REC (
   SELLS_NO             varchar(20)         not null,
   PAY_ACCOUNT          varchar(5)          null,
   PAY_DATE             varchar(10)         null,
   UPDATE_DT            datetime             null,
   constraint PK_SELLS_REC primary key (SELLS_NO)
)

CREATE TABLE User_Seqs (
	LoginSeq int NULL,
	SellsNo int NULL,
	OrderNo int NULL
) ON [PRIMARY]

insert into User_Seqs values(10,10,10);