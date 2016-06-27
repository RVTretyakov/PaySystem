create table PAYMENT.REGISTRATIONS
(
REG_ID NUMBER(10) not null,
SERVICE_ID NUMBER(10) not null,
REG_DATE DATE not null,
REG_VALUE VARCHAR2(20)
)
tablespace USERS
pctfree 10
initrans 1
maxtrans 255;
comment on table PAYMENT.REGISTRATIONS
is '��������� ���������';
comment on column PAYMENT.REGISTRATIONS.REG_ID
is 'ID ���������';
comment on column PAYMENT.REGISTRATIONS.REG_DATE
is '���� ������';
comment on column PAYMENT.REGISTRATIONS.REG_VALUE
is '��������';
comment on column PAYMENT.REGISTRATIONS.SERVICE_ID
is 'ID ������';
alter table PAYMENT.REGISTRATIONS
add constraint PK_REGISTRATIONS_REG_ID primary key (REG_ID)
using index 
tablespace USERS
pctfree 10
initrans 2
maxtrans 255;
alter table PAYMENT.REGISTRATIONS
add constraint FK_REGISTRATIONS_SERVICE_ID foreign key (SERVICE_ID)
references PAYMENT.SERVICES (SERVICE_ID);
/