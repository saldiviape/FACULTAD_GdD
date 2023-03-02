--------------------------------------------------------
-- Archivo creado  - viernes-junio-03-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type REPCAT$_OBJECT_NULL_VECTOR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "SYSTEM"."REPCAT$_OBJECT_NULL_VECTOR" AS OBJECT
(
  -- type owner, name, hashcode for the type represented by null_vector
  type_owner      VARCHAR2(30),
  type_name       VARCHAR2(30),
  type_hashcode   RAW(17),
  -- null_vector for a particular object instance
  -- ROBJ REVISIT: should only contain the null image, and not version#
  null_vector     RAW(2000)
)

/
--------------------------------------------------------
--  DDL for Sequence UNITS_UNIT_CODE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "STORES7NEW"."UNITS_UNIT_CODE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CALL_TYPE
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."CALL_TYPE" 
   (	"CALL_CODE" CHAR(1 CHAR), 
	"CODE_DESCR" VARCHAR2(30 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CATALOG
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."CATALOG" 
   (	"CATALOG_NUM" NUMBER(5,0), 
	"STOCK_NUM" NUMBER(5,0), 
	"MANU_CODE" CHAR(3 CHAR), 
	"CAT_DESCR" CLOB, 
	"CAT_PICTURE" VARCHAR2(255 CHAR), 
	"CAT_ADVERT" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CAT_DESCR") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table CUST_CALLS
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."CUST_CALLS" 
   (	"CUSTOMER_NUM" NUMBER(5,0), 
	"CALL_DTIME" DATE, 
	"USER_ID" CHAR(32 CHAR), 
	"CALL_CODE" CHAR(1 CHAR), 
	"CALL_DESCR" VARCHAR2(240 CHAR), 
	"RES_DTIME" DATE, 
	"RES_DESCR" VARCHAR2(240 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."CUSTOMER" 
   (	"CUSTOMER_NUM" NUMBER(5,0), 
	"FNAME" VARCHAR2(15 CHAR), 
	"LNAME" VARCHAR2(15 CHAR), 
	"COMPANY" VARCHAR2(20 CHAR), 
	"ADDRESS1" VARCHAR2(20 CHAR), 
	"ADDRESS2" VARCHAR2(20 CHAR), 
	"CITY" VARCHAR2(15 CHAR), 
	"STATE" CHAR(2 CHAR), 
	"ZIPCODE" CHAR(5 CHAR), 
	"PHONE" VARCHAR2(18 CHAR), 
	"CUSTOMER_NUM_REFEREDBY" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ITEMS
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."ITEMS" 
   (	"ITEM_NUM" NUMBER(5,0), 
	"ORDER_NUM" NUMBER(5,0), 
	"STOCK_NUM" NUMBER(5,0), 
	"MANU_CODE" CHAR(3 CHAR), 
	"QUANTITY" NUMBER(5,0), 
	"TOTAL_PRICE" FLOAT(126)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MANUFACT
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."MANUFACT" 
   (	"MANU_CODE" CHAR(3 CHAR), 
	"MANU_NAME" VARCHAR2(15 CHAR), 
	"LEAD_TIME" NUMBER(5,0), 
	"STATE" CHAR(2 CHAR), 
	"F_ALTA_AUDIT" DATE, 
	"D_USUALTA_AUDIT" VARCHAR2(20 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MSGS
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."MSGS" 
   (	"LANG" VARCHAR2(32 CHAR), 
	"NUMBER_" NUMBER(5,0), 
	"MESAGE" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."ORDERS" 
   (	"ORDER_NUM" NUMBER(5,0), 
	"ORDER_DATE" DATE, 
	"CUSTOMER_NUM" NUMBER(5,0), 
	"SHIP_INSTRUCT" VARCHAR2(40 CHAR), 
	"BACKLOG" CHAR(1 CHAR), 
	"PO_NUM" VARCHAR2(10 CHAR), 
	"SHIP_DATE" DATE, 
	"SHIP_WEIGHT" FLOAT(126), 
	"SHIP_CHARGE" FLOAT(126), 
	"PAID_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."PRODUCTS" 
   (	"STOCK_NUM" NUMBER(5,0), 
	"MANU_CODE" CHAR(3 CHAR), 
	"UNIT_PRICE" FLOAT(126), 
	"UNIT_CODE" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT_TYPES
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."PRODUCT_TYPES" 
   (	"STOCK_NUM" NUMBER(5,0), 
	"DESCRIPTION" VARCHAR2(15 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STATE
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."STATE" 
   (	"CODE" CHAR(2 CHAR), 
	"SNAME" VARCHAR2(15 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table UNITS
--------------------------------------------------------

  CREATE TABLE "STORES7NEW"."UNITS" 
   (	"UNIT_CODE" NUMBER(5,0), 
	"UNIT" CHAR(4 CHAR), 
	"UNIT_DESCR" VARCHAR2(15 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQCALL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQCALL" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQCALL" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQCALL_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQCALL_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQCALL" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQERROR
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQERROR" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQERROR" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQERROR_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQERROR_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQERROR" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_EVALUATIONS"  IS 'This view gives DBA access to summary evaluation output';
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS 
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from SYSTEM.MVIEW$_ADV_EXCEPTIONS t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_EXCEPTIONS"  IS 'This view gives DBA access to dimension validation results';
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTER"  IS 'Workload filter records';
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filterinstance a;

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTERINSTANCE"  IS 'Workload filter instance records';
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS 
  select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_LOG"  IS 'Advisor session log';
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_RECOMMENDATIONS"  IS 'This view gives DBA access to summary recommendations';
--------------------------------------------------------
--  DDL for View MVIEW_WORKLOAD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_WORKLOAD" ("WORKLOADID", "IMPORT_TIME", "QUERYID", "APPLICATION", "CARDINALITY", "RESULTSIZE", "LASTUSE", "FREQUENCY", "OWNER", "PRIORITY", "QUERY", "RESPONSETIME") AS 
  select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_WORKLOAD"  IS 'This view gives DBA access to shared workload';
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS 
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID;
REM INSERTING into STORES7NEW.CALL_TYPE
SET DEFINE OFF;
Insert into STORES7NEW.CALL_TYPE (CALL_CODE,CODE_DESCR) values ('B','billing error');
Insert into STORES7NEW.CALL_TYPE (CALL_CODE,CODE_DESCR) values ('D','damaged goods');
Insert into STORES7NEW.CALL_TYPE (CALL_CODE,CODE_DESCR) values ('I','incorrect merchandise sent');
Insert into STORES7NEW.CALL_TYPE (CALL_CODE,CODE_DESCR) values ('L','late shipment');
Insert into STORES7NEW.CALL_TYPE (CALL_CODE,CODE_DESCR) values ('O','other');
REM INSERTING into STORES7NEW.CATALOG
SET DEFINE OFF;
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10001','1','HRO',' ','Your First Season s Baseball Glove');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10002','1','HSK',' ','All Leather');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10003','1','SMT',' ','A Sturdy Catcher s 
Mitt With the Perfect Pocket');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10004','2','HRO',' ',' used by National League.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10005','3','HSK',' ',' 32 33');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10006','3','SHM',' ',' 21 oz or 23 oz; 33"');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10007','4','HSK',' ','Quality Pigskin with Norm Van Brocklin 
Signature');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10008','4','HRO',' ','Highest Quality Football for High School and Collegiate 
Competitions');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10009','5','NRG',' ','Wide Body Amplifies Your Natural Abilities by 
Providing More Power Through Aerodynamic Design');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10010','5','SMT',' ','Mid-Sized Racquet for the Improving Player');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10011','5','ANZ',' ',' cat-gut strings.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10012','6','SMT',' ','High-Visibility Tennis');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10013','6','ANZ',' ',' green and pink.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10014','7','HRO',' ','Long-Life Basketballs for Indoor 
Gymnasiums');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10015','8','ANZ',' ','Professional Volleyballs for 
Indoor Competitions');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10016','9','ANZ',' ','Sanctioned Volleyball Netting for Indoor Professional and 
Collegiate Competition');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10017','101','PRC',' ',' hand-finished tubular. Polyurethane belted.  Effective against 
punctures. Mixed tread for super wear and road grip.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10018','101','SHM',' ','The 
Perfect Tire for Club Rides or Training');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10019','102','SHM',' ',' and cables.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10020','102','PRC',' ',' and 
cables.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10021','103','PRC',' ','Climb 
Any Mountain: ProCycle s Front Derailleur Adds Finesse to Your ATB');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10022','104','PRC',' ','Computer-Aided Design 
Engineers 100-Tooth Capacity into ProCycle s Rear Derailleur');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10023','105','PRC',' ','Durable Training Wheels That Hold 
True Under Toughest Conditions');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10024','105','SHM',' ',' quick-release hubs. Double-butted. Front wheels are laced 15 g/2-cross. Rear wheels are laced 15 g/3-cross.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10025','106','PRC',' ','ProCycle Stem with Pearl Finish');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10026','107','PRC',' ','The Ultimate in Riding Comfort');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10027','108','SHM',' ',' chainrings from 38-54 teeth. For triple crankset chainrings from 24-48 teeth.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10028','109','PRC',' ','Classic Toeclip Improved to Prevent Soreness at Clip Buckle');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10029','109','SHM',' ','Ingenious Pedal/Clip Design Delivers Maximum Power and Fast Unlocking');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10030','110','PRC',' ','Feather-Light');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10031','110','ANZ',' ','Minimum Chin Contact');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10032','110','SHM',' ',' no snagging on brush. Meets both ANSI and Snell standards for impact 
protection. 8.0 oz.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10033','110','HRO',' ','Lightweight Plastic with Vents Assures Cool Comfort Without Sacrificing Protection');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10034','110','HSK',' ','Teardrop Design Used by Yellow Jerseys; You Can Time the Difference');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10035','111','SHM',' ','Fully Equipped 
Bicycle Designed for the Serious Commuter Who Mixes Business with 
Pleasure');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10036','112','SHM',' ','We Selected the Ideal Combination of Touring Bike Equipment');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10037','113','SHM',' ','Designed for the Serious Competitor');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10038','114','PRC',' ',' and cream. Sizes S');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10039','201','NKL',' ','Full-Comfort');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10040','201','ANZ',' ',' bone brown');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10041','201','KAR',' ','Karsten s Top Quality Shoe Combines Leather and Leather Mesh');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10042','202','NKL',' ','Starter Set of Woods');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10043','202','KAR',' ','High-Quality Woods Appropriate for High School Competitions or Serious 
Amateurs');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10044','203','NKL',' ','Set of Irons Available from Factory at Tremendous Savings: Discontinued Line.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10045','204','KAR',' ','High-Quality Beginning Set of Irons Appropriate for High School Competitions');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10046','205','NKL',' ','Long Drive Golf Balls: Fluorescent Yellow');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10047','205','ANZ',' ','Long Drive Golf Balls: White');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10048','205','HRO',' ','HiFlier Golf Balls: Case Includes Fluorescent Yellow and Standard White');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10049','301','NKL',' ','Maximum Protection For High-Mileage Runners');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10050','301','HRO',' ',' size.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10051','301','SHM',' ',' supportive stable 
platform. Mesh/synthetic upper gives excellent moisture dissipation. Stability 
system uses rear antipronation platform and forefoot control plate for 
extended protection during high-intensity training. Specify 
mens/womens');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10052','301','PRC',' ',' stable racing flat. Plenty of forefoot cushioning with added motion 
control. Women s only. D widths available.  Specify size.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10053','301','KAR',' ',' ');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10054','301','ANZ',' ','Motion Control');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10055','302','KAR',' ','Finally');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10056','303','PRC',' ',' yellow green');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10057','303','KAR',' ','100% Nylon Blend Socks - No Cotton!');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10058','304','ANZ',' ',' dual display of lap/cumulative splits');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10059','304','HRO',' ',' waterproof to 50 m. Indicate color: hot pink mint green');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10060','305','HRO',' ',' anti-bacterial cream alcohol cleansing pads');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10061','306','PRC',' ','Enjoy Bicycling with Your Child on a Tandem; Make Your 
Family Outing Safer');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10062','306','SHM',' ','Consider a Touring Vacation For the Entire Family: A Lightweight');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10063','307','PRC',' ',' too. Fits children up to 21 pounds. Navy 
blue with black trim.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10064','308','PRC',' ','As Your Family Grows');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10065','309','HRO',' ','Swimmers Can Prevent Ear Infection All Season Long');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10066','309','SHM',' ','Swimmer s Ear Drops Specially Formulated for Children');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10067','310','SHM',' ','Exceptionally Durable');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10068','310','ANZ',' ','High-Quality Kickboard');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10069','311','SHM',' ','Hot Training Tool - Webbed Swim Gloves Build Arm 
Strength and Endurance');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10070','312','SHM',' ','Anti-Fog Swimmer s Goggles: Quantity Discount.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10071','312','HRO',' ',' grey or white.');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10072','313','SHM',' ',' silver or navy. Team logo 
imprinting available');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10073','313','ANZ',' ','Durable Squared-off 
Silicone Swim Cap');
Insert into STORES7NEW.CATALOG (CATALOG_NUM,STOCK_NUM,MANU_CODE,CAT_PICTURE,CAT_ADVERT) values ('10074','302','HRO',' ','Water Compartment Combines with Ice to 
Provide Optimal Orthopedic Treatment');
REM INSERTING into STORES7NEW.CUST_CALLS
SET DEFINE OFF;
Insert into STORES7NEW.CUST_CALLS (CUSTOMER_NUM,CALL_DTIME,USER_ID,CALL_CODE,CALL_DESCR,RES_DTIME,RES_DESCR) values ('106',to_date('14/06/08','DD/MM/RR'),'maryj                           ','D','Order was received, but two of the cans of ANZ tennis balls within the case were empty',to_date('13/06/15','DD/MM/RR'),'Authorized credit for two cans to customer, issued apology. Called ANZ buyer to report the QA problem.');
Insert into STORES7NEW.CUST_CALLS (CUSTOMER_NUM,CALL_DTIME,USER_ID,CALL_CODE,CALL_DESCR,RES_DTIME,RES_DESCR) values ('110',to_date('09/07/08','DD/MM/RR'),'richc                           ','L','Order placed one month ago (6/7) not received.',to_date('08/07/15','DD/MM/RR'),'Checked with shipping (Ed Smith). Order sent yesterday- we were waiting for goods from ANZ. Next time will call with delay if necessary.');
Insert into STORES7NEW.CUST_CALLS (CUSTOMER_NUM,CALL_DTIME,USER_ID,CALL_CODE,CALL_DESCR,RES_DTIME,RES_DESCR) values ('116',to_date('30/11/07','DD/MM/RR'),'mannyn                          ','I','Received plain white swim caps (313 ANZ) instead of navy with team logo (313 SHM)',to_date('28/11/15','DD/MM/RR'),'Shipping found correct case in warehouse and express mailed it in time for swim meet.');
Insert into STORES7NEW.CUST_CALLS (CUSTOMER_NUM,CALL_DTIME,USER_ID,CALL_CODE,CALL_DESCR,RES_DTIME,RES_DESCR) values ('116',to_date('23/12/07','DD/MM/RR'),'mannyn                          ','I','Second complaint from this customer! Received two cases right-handed outfielder gloves (1 HRO) instead of one case lefties.',to_date('27/12/15','DD/MM/RR'),'Memo to shipping (Ava Brown) to send case of left-handed gloves, pick up wrong case');
Insert into STORES7NEW.CUST_CALLS (CUSTOMER_NUM,CALL_DTIME,USER_ID,CALL_CODE,CALL_DESCR,RES_DTIME,RES_DESCR) values ('119',to_date('03/07/08','DD/MM/RR'),'richc                           ','B','Bill does not reflect credit from previous order',to_date('03/07/15','DD/MM/RR'),'Spoke with Jane Akant in Finance. She found the error and is sending new bill to customer');
Insert into STORES7NEW.CUST_CALLS (CUSTOMER_NUM,CALL_DTIME,USER_ID,CALL_CODE,CALL_DESCR,RES_DTIME,RES_DESCR) values ('121',to_date('12/07/08','DD/MM/RR'),'maryj                           ','O','Customer likes our merchandise. Requests that we stock more types of infant joggers. Will call back to place order.',to_date('11/07/15','DD/MM/RR'),'Sent note to marketing group of interest in infant joggers');
Insert into STORES7NEW.CUST_CALLS (CUSTOMER_NUM,CALL_DTIME,USER_ID,CALL_CODE,CALL_DESCR,RES_DTIME,RES_DESCR) values ('127',to_date('02/08/08','DD/MM/RR'),'maryj                           ','I','Received Hero watches (item # 304) instead of ANZ watches',to_date('04/12/14','DD/MM/RR'),'Sent memo to shipping to send ANZ item 304 to customer and pickup HRO watches. Should be done tomorrow, 8/1');
REM INSERTING into STORES7NEW.CUSTOMER
SET DEFINE OFF;
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('101','Ludwig','Pauli','All Sports Supplies','213 Erstwild Court',' ','Sunnyvale','CA','94086','408-789-8075',null);
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('102','Carole','Sadler','Sports Spot','785 Geary St',' ','San Francisco','CA','94117','415-822-1289','101');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('103','Philip','Currie','Phil s Sports','654 Poplar','P. O. Box 3498','Palo Alto','CA','94303','415-328-4543','101');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('104','Anthony','Higgins','Play Ball!','East Shopping Cntr.','422 Bay Road','Redwood City','CA','94026','415-368-1100','103');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('105','Raymond','Vector','Los Altos Sports','1899 La Loma Drive',' ','Los Altos','CA','94022','415-776-3249','103');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('106','George','Watson','Watson & Son','1143 Carver Place',' ','Mountain View','CA','94063','415-389-8789','103');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('107','Charles','Ream','Athletic Supplies','41 Jordan Avenue',' ','Palo Alto','CA','94304','415-356-9876',null);
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('108','Donald','Quinn','Quinn s Sports','587 Alvarado',' ','Redwood City','CA','94063','415-544-8729','107');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('109','Jane','Miller','Sport Stuff','Mayfair Mart','7345 Ross Blvd.','Sunnyvale','CA','94086','408-723-8789','107');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('110','Roy','Jaeger','AA Athletics','520 Topaz Way',' ','Redwood City','CA','94062','415-743-3611',null);
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('111','Frances','Keyes','Sports Center','3199 Sterling Court',' ','Sunnyvale','CA','94085','408-277-7245',null);
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('112','Margaret','Lawson','Runners & Others','234 Wyandotte Way',' ','Los Altos','CA','94022','415-887-7235','111');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('113','Lana','Beatty','Sportstown','654 Oak Grove',' ','Menlo Park','CA','94025','415-356-9982','111');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('114','Frank','Albertson','Sporting Place','947 Waverly Place',' ','Redwood City','CA','94062','415-886-6677','111');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('115','Alfred','Grant','Gold Medal Sports','776 Gary Avenue',' ','Menlo Park','CA','94025','415-356-1123',null);
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('116','Jean','Parmelee','Olympic City','1104 Spinosa Drive',' ','Mountain View','CA','94040','415-534-8822','115');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('117','Arnold','Sipes','Kids Korner','850 Lytton Court',' ','Redwood City','CA','94063','415-245-4578','115');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('118','Dick','Baxter','Blue Ribbon Sports','5427 College',' ','Oakland','CA','94609','415-655-0011','115');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('119','Bob','Shorter','The Triathletes Club','2405 Kings Highway',' ','Cherry Hill','NJ','8002 ','609-663-6079','115');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('120','Fred','Jewell','Century Pro Shop','6627 N. 17th Way',' ','Phoenix','AZ','85016','602-265-8754',null);
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('121','Jason','Wallack','City Sports','Lake Biltmore Mall','350 W. 23rd Street','Wilmington','DE','19898','302-366-7511','120');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('122','Cathy','O Brian','The Sporting Life','543 Nassau Street',' ','Princeton','NJ','8540 ','609-342-0054','121');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('123','Marvin','Hanlon','Bay Sports','10100 Bay Meadows Ro','Suite 1020','Jacksonville','FL','32256','904-823-4239','121');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('124','Chris','Putnum','Putnum s Putters','4715 S.E. Adams Blvd','Suite 909C','Bartlesville','OK','74006','918-355-2074','120');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('125','James','Henry','Total Fitness Sports','1450 Commonwealth Av',' ','Brighton','MA','2135 ','617-232-4159',null);
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('126','Eileen','Neelie','Neelie s Discount Sp','2539 South Utica Str',' ','Denver','CO','80219','303-936-7731','125');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('127','Kim','Satifer','Big Blue Bike Shop','Blue Island Square','12222 Gregory Street','Blue Island','NY','60406','312-944-5691','125');
Insert into STORES7NEW.CUSTOMER (CUSTOMER_NUM,FNAME,LNAME,COMPANY,ADDRESS1,ADDRESS2,CITY,STATE,ZIPCODE,PHONE,CUSTOMER_NUM_REFEREDBY) values ('128','Frank','Lessor','Phoenix University','Athletic Department','1817 N. Thomas Road','Phoenix','AZ','85008','602-533-1817','125');
REM INSERTING into STORES7NEW.ITEMS
SET DEFINE OFF;
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1001','1','HRO','1','250');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1002','4','HSK','1','960');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1003','9','ANZ','1','20');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1004','1','HRO','1','250');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1005','5','NRG','10','280');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1006','5','SMT','5','125');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1007','1','HRO','1','250');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1008','8','ANZ','1','840');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1009','1','SMT','1','450');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1010','6','SMT','1','36');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1011','5','ANZ','5','99');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1012','8','ANZ','1','840');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1013','5','ANZ','1','19,8');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1014','4','HSK','1','960');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1015','1','SMT','1','450');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1016','101','SHM','2','136');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1017','201','NKL','4','150');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1018','307','PRC','2','500');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1019','111','SHM','3','1499,97');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1020','204','KAR','2','90');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1021','201','NKL','2','75');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1022','309','HRO','1','40');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('1','1023','103','PRC','2','40');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1002','3','HSK','1','240');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1003','8','ANZ','1','840');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1004','2','HRO','1','126');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1005','5','ANZ','10','198');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1006','5','NRG','5','140');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1007','2','HRO','1','126');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1008','9','ANZ','5','100');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1010','6','ANZ','1','48');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1012','9','ANZ','10','200');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1013','6','SMT','1','36');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1014','4','HRO','1','480');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1016','109','PRC','3','90');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1017','202','KAR','1','230');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1018','302','KAR','3','15');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1020','301','KAR','4','348');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1021','201','ANZ','3','225');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1022','303','PRC','2','96');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('2','1023','104','PRC','2','116');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1003','5','ANZ','5','99');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1004','3','HSK','1','240');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1005','6','SMT','1','36');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1006','5','ANZ','5','99');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1007','3','HSK','1','240');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1013','6','ANZ','1','48');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1016','110','HSK','1','308');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1017','301','SHM','2','204');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1018','110','PRC','1','236');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1021','202','KAR','3','690');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1022','6','ANZ','2','96');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('3','1023','105','SHM','1','80');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('4','1004','1','HSK','1','800');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('4','1005','6','ANZ','1','48');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('4','1006','6','SMT','1','36');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('4','1007','4','HRO','1','480');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('4','1013','9','ANZ','2','40');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('4','1016','114','PRC','1','120');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('4','1018','5','SMT','4','100');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('4','1021','205','ANZ','2','624');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('4','1023','110','SHM','1','228');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('5','1006','6','ANZ','1','48');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('5','1007','7','HRO','1','600');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('5','1018','304','HRO','1','280');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('5','1023','304','ANZ','1','170');
Insert into STORES7NEW.ITEMS (ITEM_NUM,ORDER_NUM,STOCK_NUM,MANU_CODE,QUANTITY,TOTAL_PRICE) values ('6','1023','306','SHM','1','190');
REM INSERTING into STORES7NEW.MANUFACT
SET DEFINE OFF;
Insert into STORES7NEW.MANUFACT (MANU_CODE,MANU_NAME,LEAD_TIME,STATE,F_ALTA_AUDIT,D_USUALTA_AUDIT) values ('ANZ','Anza','5','CA',null,null);
Insert into STORES7NEW.MANUFACT (MANU_CODE,MANU_NAME,LEAD_TIME,STATE,F_ALTA_AUDIT,D_USUALTA_AUDIT) values ('HRO','Hero','4','CA',null,null);
Insert into STORES7NEW.MANUFACT (MANU_CODE,MANU_NAME,LEAD_TIME,STATE,F_ALTA_AUDIT,D_USUALTA_AUDIT) values ('HSK','Husky','5','CA',null,null);
Insert into STORES7NEW.MANUFACT (MANU_CODE,MANU_NAME,LEAD_TIME,STATE,F_ALTA_AUDIT,D_USUALTA_AUDIT) values ('KAR','Karsten','21','CA',null,null);
Insert into STORES7NEW.MANUFACT (MANU_CODE,MANU_NAME,LEAD_TIME,STATE,F_ALTA_AUDIT,D_USUALTA_AUDIT) values ('NKL','Nikolus','8','AZ',null,null);
Insert into STORES7NEW.MANUFACT (MANU_CODE,MANU_NAME,LEAD_TIME,STATE,F_ALTA_AUDIT,D_USUALTA_AUDIT) values ('NRG','Norge','7','AZ',null,null);
Insert into STORES7NEW.MANUFACT (MANU_CODE,MANU_NAME,LEAD_TIME,STATE,F_ALTA_AUDIT,D_USUALTA_AUDIT) values ('PRC','ProCycle','9','AZ',null,null);
Insert into STORES7NEW.MANUFACT (MANU_CODE,MANU_NAME,LEAD_TIME,STATE,F_ALTA_AUDIT,D_USUALTA_AUDIT) values ('SHM','Shimara','30','CO',null,null);
Insert into STORES7NEW.MANUFACT (MANU_CODE,MANU_NAME,LEAD_TIME,STATE,F_ALTA_AUDIT,D_USUALTA_AUDIT) values ('SMT','Smith','3','CO',null,null);
REM INSERTING into STORES7NEW.MSGS
SET DEFINE OFF;
REM INSERTING into STORES7NEW.ORDERS
SET DEFINE OFF;
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1001',to_date('16/05/15','DD/MM/RR'),'104','express','n','B77836',to_date('28/05/15','DD/MM/RR'),'20,4','10',to_date('18/07/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1002',to_date('17/05/15','DD/MM/RR'),'101','PO on box; deliver to back door only','n','9270',to_date('22/05/15','DD/MM/RR'),'50,6','15,3',to_date('30/05/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1003',to_date('18/05/15','DD/MM/RR'),'104','express','n','B77890',to_date('19/05/15','DD/MM/RR'),'35,6','10,8',to_date('10/06/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1004',to_date('18/05/15','DD/MM/RR'),'106','ring bell twice','y','8006',to_date('26/05/15','DD/MM/RR'),'95,8','19,2',null);
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1005',to_date('20/05/15','DD/MM/RR'),'116','call before delivery','n','2865',to_date('05/06/15','DD/MM/RR'),'80,8','16,2',to_date('17/06/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1006',to_date('26/05/15','DD/MM/RR'),'112','after 10 am','y','Q13557',null,'70,8','14,2',null);
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1007',to_date('27/05/15','DD/MM/RR'),'117',' ','n','278693',to_date('01/06/15','DD/MM/RR'),'125,9','25,2',null);
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1008',to_date('03/06/15','DD/MM/RR'),'110','closed Monday','y','LZ230',to_date('02/07/15','DD/MM/RR'),'45,6','13,8',to_date('17/07/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1009',to_date('10/06/15','DD/MM/RR'),'111','next door to grocery','n','4745',to_date('17/06/15','DD/MM/RR'),'20,4','10',to_date('17/08/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1010',to_date('13/06/15','DD/MM/RR'),'115','deliver 776 King St. if no answer','n','429Q',to_date('25/06/15','DD/MM/RR'),'40,6','12,3',to_date('18/08/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1011',to_date('14/06/15','DD/MM/RR'),'104','express','n','B77897',to_date('29/06/15','DD/MM/RR'),'10,4','5',to_date('25/08/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1012',to_date('14/06/15','DD/MM/RR'),'117',' ','n','278701',to_date('25/06/15','DD/MM/RR'),'70,8','14,2',null);
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1013',to_date('18/06/15','DD/MM/RR'),'104','express','n','B77930',to_date('06/07/15','DD/MM/RR'),'60,8','12,2',to_date('27/07/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1014',to_date('21/06/15','DD/MM/RR'),'106','ring bell kick door loudly','n',' ',null,'40,6','12,3',null);
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1015',to_date('23/06/15','DD/MM/RR'),'110','closed Mondays','n','MA003',to_date('12/07/15','DD/MM/RR'),'20,6','6,3',to_date('27/08/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1016',to_date('25/06/15','DD/MM/RR'),'119','delivery entrance off Camp St.','n','PC6782',to_date('08/07/15','DD/MM/RR'),'35','11,8',null);
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1017',to_date('05/07/15','DD/MM/RR'),'120','North side of clubhouse','n','DM354331',to_date('09/07/15','DD/MM/RR'),'60','18',null);
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1018',to_date('06/07/15','DD/MM/RR'),'121','SW corner of Biltmore Mall','n','S22942',to_date('09/07/15','DD/MM/RR'),'70,5','20',to_date('02/08/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1019',to_date('07/07/15','DD/MM/RR'),'122','closed til noon Mondays','n','Z55709',to_date('12/07/15','DD/MM/RR'),'90','23',to_date('02/08/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1020',to_date('07/07/15','DD/MM/RR'),'123','express','n','W2286',to_date('12/07/15','DD/MM/RR'),'14','8,5',to_date('16/09/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1021',to_date('19/07/15','DD/MM/RR'),'124','ask for Elaine','n','C3288',to_date('21/07/15','DD/MM/RR'),'40','12',to_date('18/08/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1022',to_date('20/07/15','DD/MM/RR'),'126','express','n','W9925',to_date('26/07/15','DD/MM/RR'),'15','13',to_date('29/08/15','DD/MM/RR'));
Insert into STORES7NEW.ORDERS (ORDER_NUM,ORDER_DATE,CUSTOMER_NUM,SHIP_INSTRUCT,BACKLOG,PO_NUM,SHIP_DATE,SHIP_WEIGHT,SHIP_CHARGE,PAID_DATE) values ('1023',to_date('20/07/15','DD/MM/RR'),'127','no deliveries after 3 p.m.','n','KF2961',to_date('26/07/15','DD/MM/RR'),'60','18',to_date('18/08/15','DD/MM/RR'));
REM INSERTING into STORES7NEW.PRODUCTS
SET DEFINE OFF;
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('1','HRO','250','6');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('1','HSK','800','6');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('1','SMT','450','6');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('2','HRO','126','13');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('3','HSK','240','9');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('3','SHM','280','9');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('4','HRO','480','13');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('4','HSK','960','13');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('5','ANZ','19,8','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('5','NRG','28','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('5','SMT','25','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('6','ANZ','48','12');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('6','SMT','36','12');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('7','HRO','600','13');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('8','ANZ','840','13');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('9','ANZ','20','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('101','PRC','88','5');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('101','SHM','68','5');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('102','PRC','480','15');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('102','SHM','220','15');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('103','PRC','20','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('104','PRC','58','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('105','PRC','53','20');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('105','SHM','80','20');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('106','PRC','23','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('107','PRC','70','20');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('108','SHM','45','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('109','PRC','30','17');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('109','SHM','200','14');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('110','ANZ','244','16');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('110','HRO','260','16');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('110','HSK','308','16');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('110','PRC','236','16');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('110','SHM','228','16');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('111','SHM','499,99','18');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('112','SHM','549','18');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('113','SHM','685,9','18');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('114','PRC','120','7');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('201','ANZ','75','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('201','KAR','90','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('201','NKL','37,5','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('202','KAR','230','10');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('202','NKL','174','10');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('203','NKL','670','10');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('204','KAR','45','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('205','ANZ','312','13');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('205','HRO','312','13');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('205','NKL','312','13');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('301','ANZ','95','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('301','HRO','42,5','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('301','KAR','87','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('301','NKL','97','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('301','PRC','75','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('301','SHM','102','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('302','HRO','4,5','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('302','KAR','5','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('303','KAR','36','3');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('303','PRC','48','3');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('304','ANZ','170','1');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('304','HRO','280','1');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('305','HRO','48','16');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('306','PRC','160','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('306','SHM','190','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('307','PRC','250','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('308','PRC','280','19');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('309','HRO','40','11');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('309','SHM','40','11');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('310','ANZ','84','9');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('310','SHM','80','8');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('311','SHM','48','4');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('312','HRO','72','2');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('312','SHM','96','2');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('313','ANZ','60','2');
Insert into STORES7NEW.PRODUCTS (STOCK_NUM,MANU_CODE,UNIT_PRICE,UNIT_CODE) values ('313','SHM','72','2');
REM INSERTING into STORES7NEW.PRODUCT_TYPES
SET DEFINE OFF;
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('1','baseball gloves');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('2','baseball');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('3','baseball bat');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('4','football');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('5','tennis racquet');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('6','tennis ball');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('7','basketball');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('8','volleyball');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('9','volleyball net');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('101','bicycle tires');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('102','bicycle brakes');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('103','frnt derailleur');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('104','rear derailleur');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('105','bicycle wheels');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('106','bicycle stem');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('107','bicycle saddle');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('108','crankset');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('109','pedal binding');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('110','helmet');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('111','10-spd assmbld');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('112','12-spd assmbld');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('113','18-spd assmbld');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('114','bicycle gloves');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('201','golf shoes');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('202','metal woods');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('203','irons/wedge');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('204','putter');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('205','3 golf balls');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('301','running shoes');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('302','ice pack');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('303','socks');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('304','watch');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('305','first-aid kit');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('306','tandem adapter');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('307','infant jogger');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('308','twin jogger');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('309','ear drops');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('310','kick board');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('311','water gloves');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('312','racer goggles');
Insert into STORES7NEW.PRODUCT_TYPES (STOCK_NUM,DESCRIPTION) values ('313','swim cap');
REM INSERTING into STORES7NEW.STATE
SET DEFINE OFF;
Insert into STORES7NEW.STATE (CODE,SNAME) values ('AK','Alaska');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('AL','Alabama');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('AR','Arkansas');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('AZ','Arizona');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('CA','California');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('CO','Colorado');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('CT','Connecticut');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('DC','D.C.');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('DE','Delaware');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('FL','Florida');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('GA','Georgia');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('HI','Hawaii');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('IA','Iowa');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('ID','Idaho');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('IL','Illinois');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('IN','Indiana');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('KS','Kansas');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('KY','Kentucky');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('LA','Louisiana');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('MA','Massachusetts');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('MD','Maryland');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('ME','Maine');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('MI','Michigan');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('MN','Minnesota');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('MO','Missouri');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('MS','Mississippi');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('MT','Montana');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('NC','North Carolina');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('ND','North Dakota');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('NE','Nebraska');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('NH','New Hampshire');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('NJ','New Jersey');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('NM','New Mexico');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('NV','Nevada');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('NY','New York');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('OH','Ohio');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('OK','Oklahoma');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('OR','Oregon');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('PA','Pennsylvania');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('PR','Puerto Rico');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('RI','Rhode Island');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('SC','South Carolina');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('SD','South Dakota');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('TN','Tennessee');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('TX','Texas');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('UT','Utah');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('VA','Virginia');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('VT','Vermont');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('WA','Washington');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('WI','Wisconsin');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('WV','West Virginia');
Insert into STORES7NEW.STATE (CODE,SNAME) values ('WY','Wyoming');
REM INSERTING into STORES7NEW.UNITS
SET DEFINE OFF;
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('1','box ','10/box');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('2','box ','12/box');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('3','box ','24 pairs/box');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('4','box ','4 pairs/box');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('5','box ','4/box');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('6','case','10 gloves/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('7','case','10 pairs/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('8','case','10/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('9','case','12/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('10','case','2 sets/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('11','case','20/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('12','case','24 cans/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('13','case','24/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('14','case','4 pairs/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('15','case','4 sets/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('16','case','4/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('17','case','6 pairs/case');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('18','each',' ');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('19','each','each');
Insert into STORES7NEW.UNITS (UNIT_CODE,UNIT,UNIT_DESCR) values ('20','pair','pair');
--------------------------------------------------------
--  DDL for Index CALL_CODE
--------------------------------------------------------

  CREATE INDEX "STORES7NEW"."CALL_CODE" ON "STORES7NEW"."CUST_CALLS" ("CALL_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_NUM
--------------------------------------------------------

  CREATE INDEX "STORES7NEW"."CUSTOMER_NUM" ON "STORES7NEW"."ORDERS" ("CUSTOMER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CUSTOMER_NUM_REFEREDBY
--------------------------------------------------------

  CREATE INDEX "STORES7NEW"."CUSTOMER_NUM_REFEREDBY" ON "STORES7NEW"."CUSTOMER" ("CUSTOMER_NUM_REFEREDBY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MANU_CODE
--------------------------------------------------------

  CREATE INDEX "STORES7NEW"."MANU_CODE" ON "STORES7NEW"."PRODUCTS" ("MANU_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ORDER_NUM
--------------------------------------------------------

  CREATE INDEX "STORES7NEW"."ORDER_NUM" ON "STORES7NEW"."ITEMS" ("ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY" ON "STORES7NEW"."CALL_TYPE" ("CALL_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_1
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY_1" ON "STORES7NEW"."ORDERS" ("ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_10
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY_10" ON "STORES7NEW"."PRODUCTS" ("STOCK_NUM", "MANU_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_2
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY_2" ON "STORES7NEW"."CATALOG" ("CATALOG_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_3
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY_3" ON "STORES7NEW"."CUSTOMER" ("CUSTOMER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_4
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY_4" ON "STORES7NEW"."PRODUCT_TYPES" ("STOCK_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_5
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY_5" ON "STORES7NEW"."CUST_CALLS" ("CUSTOMER_NUM", "CALL_DTIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_6
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY_6" ON "STORES7NEW"."ITEMS" ("ITEM_NUM", "ORDER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_7
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY_7" ON "STORES7NEW"."STATE" ("CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_8
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY_8" ON "STORES7NEW"."MANUFACT" ("MANU_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRIMARY_9
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORES7NEW"."PRIMARY_9" ON "STORES7NEW"."UNITS" ("UNIT_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index STATE
--------------------------------------------------------

  CREATE INDEX "STORES7NEW"."STATE" ON "STORES7NEW"."CUSTOMER" ("STATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index STATE_1
--------------------------------------------------------

  CREATE INDEX "STORES7NEW"."STATE_1" ON "STORES7NEW"."MANUFACT" ("STATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index STOCK_NUM
--------------------------------------------------------

  CREATE INDEX "STORES7NEW"."STOCK_NUM" ON "STORES7NEW"."CATALOG" ("STOCK_NUM", "MANU_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index STOCK_NUM_1
--------------------------------------------------------

  CREATE INDEX "STORES7NEW"."STOCK_NUM_1" ON "STORES7NEW"."ITEMS" ("STOCK_NUM", "MANU_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index UNIT_CODE
--------------------------------------------------------

  CREATE INDEX "STORES7NEW"."UNIT_CODE" ON "STORES7NEW"."PRODUCTS" ("UNIT_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CALL_TYPE
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."CALL_TYPE" ADD CONSTRAINT "PRIMARY" PRIMARY KEY ("CALL_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."CALL_TYPE" MODIFY ("CALL_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATALOG
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."CATALOG" ADD CONSTRAINT "PRIMARY_2" PRIMARY KEY ("CATALOG_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."CATALOG" MODIFY ("MANU_CODE" NOT NULL ENABLE);
  ALTER TABLE "STORES7NEW"."CATALOG" MODIFY ("STOCK_NUM" NOT NULL ENABLE);
  ALTER TABLE "STORES7NEW"."CATALOG" MODIFY ("CATALOG_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CUST_CALLS
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."CUST_CALLS" ADD CONSTRAINT "PRIMARY_5" PRIMARY KEY ("CUSTOMER_NUM", "CALL_DTIME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."CUST_CALLS" MODIFY ("CALL_DTIME" NOT NULL ENABLE);
  ALTER TABLE "STORES7NEW"."CUST_CALLS" MODIFY ("CUSTOMER_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CUSTOMER
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."CUSTOMER" ADD CONSTRAINT "PRIMARY_3" PRIMARY KEY ("CUSTOMER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."CUSTOMER" MODIFY ("CUSTOMER_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ITEMS
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."ITEMS" ADD CONSTRAINT "PRIMARY_6" PRIMARY KEY ("ITEM_NUM", "ORDER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."ITEMS" MODIFY ("MANU_CODE" NOT NULL ENABLE);
  ALTER TABLE "STORES7NEW"."ITEMS" MODIFY ("STOCK_NUM" NOT NULL ENABLE);
  ALTER TABLE "STORES7NEW"."ITEMS" MODIFY ("ORDER_NUM" NOT NULL ENABLE);
  ALTER TABLE "STORES7NEW"."ITEMS" MODIFY ("ITEM_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MANUFACT
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."MANUFACT" ADD CONSTRAINT "PRIMARY_8" PRIMARY KEY ("MANU_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."MANUFACT" MODIFY ("MANU_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."ORDERS" ADD CONSTRAINT "PRIMARY_1" PRIMARY KEY ("ORDER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."ORDERS" MODIFY ("CUSTOMER_NUM" NOT NULL ENABLE);
  ALTER TABLE "STORES7NEW"."ORDERS" MODIFY ("ORDER_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."PRODUCTS" ADD CONSTRAINT "PRIMARY_10" PRIMARY KEY ("STOCK_NUM", "MANU_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."PRODUCTS" MODIFY ("MANU_CODE" NOT NULL ENABLE);
  ALTER TABLE "STORES7NEW"."PRODUCTS" MODIFY ("STOCK_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT_TYPES
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."PRODUCT_TYPES" ADD CONSTRAINT "PRIMARY_4" PRIMARY KEY ("STOCK_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."PRODUCT_TYPES" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "STORES7NEW"."PRODUCT_TYPES" MODIFY ("STOCK_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STATE
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."STATE" ADD CONSTRAINT "PRIMARY_7" PRIMARY KEY ("CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."STATE" MODIFY ("CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UNITS
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."UNITS" ADD CONSTRAINT "PRIMARY_9" PRIMARY KEY ("UNIT_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STORES7NEW"."UNITS" MODIFY ("UNIT_CODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table MANUFACT
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."MANUFACT" ADD CONSTRAINT "MANUFACT_IBFK_1" FOREIGN KEY ("STATE")
	  REFERENCES "STORES7NEW"."STATE" ("CODE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."ORDERS" ADD CONSTRAINT "ORDERS_IBFK_1" FOREIGN KEY ("CUSTOMER_NUM")
	  REFERENCES "STORES7NEW"."CUSTOMER" ("CUSTOMER_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "STORES7NEW"."PRODUCTS" ADD CONSTRAINT "FK_PRODUCT_TYPES" FOREIGN KEY ("STOCK_NUM")
	  REFERENCES "STORES7NEW"."PRODUCT_TYPES" ("STOCK_NUM") ENABLE;
  ALTER TABLE "STORES7NEW"."PRODUCTS" ADD CONSTRAINT "PRODUCTS_IBFK_1" FOREIGN KEY ("MANU_CODE")
	  REFERENCES "STORES7NEW"."MANUFACT" ("MANU_CODE") ENABLE;
  ALTER TABLE "STORES7NEW"."PRODUCTS" ADD CONSTRAINT "PRODUCTS_IBFK_2" FOREIGN KEY ("UNIT_CODE")
	  REFERENCES "STORES7NEW"."UNITS" ("UNIT_CODE") ENABLE;
--------------------------------------------------------
--  DDL for Trigger UNITS_UNIT_CODE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "STORES7NEW"."UNITS_UNIT_CODE_TRG" BEFORE INSERT ON units
FOR EACH ROW
DECLARE 
v_newVal NUMBER(12) := 0;
v_incval NUMBER(12) := 0;
BEGIN
  IF INSERTING AND :new.unit_code IS NULL THEN
    SELECT  units_unit_code_SEQ.NEXTVAL INTO v_newVal FROM DUAL;
    -- If this is the first time this table have been inserted into (sequence == 1)
    IF v_newVal = 1 THEN 
      --get the max indentity value from the table
      SELECT NVL(max(unit_code),0) INTO v_newVal FROM units;
      v_newVal := v_newVal + 1;
      --set the sequence to that value
      LOOP
           EXIT WHEN v_incval>=v_newVal;
           SELECT units_unit_code_SEQ.nextval INTO v_incval FROM dual;
      END LOOP;
    END IF;
    --used to emulate LAST_INSERT_ID()
    --mysql_utilities.identity := v_newVal; 
   -- assign the value from the sequence to emulate the identity column
   :new.unit_code := v_newVal;
  END IF;
END;
/
ALTER TRIGGER "STORES7NEW"."UNITS_UNIT_CODE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Package DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
bf d6
0cfc6e4Sm6mfaMYwsbW2JygBepcwg/BKmJ4VZy/pO06UXsVUMejsissTcGWYR4qeK4TPqfDK
q7UPH+SmKP6nW9zmxMZnuK1VDzM0Iv9O4E4SvvsnHWn+EPF9hR+oBFe3fEro6RQ5R5Ejd1nr
e+fAK010dExf76gg/c6ZB3YxGPHDOqkGI4lV6HNsd57gKLwTd0bxan5UwJriIpt7Vjc=

/
--------------------------------------------------------
--  DDL for Package Body DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
b9d 39c
PBMGkNCh5NDAdLezCHsLvZaVi/swg5UrNSCDfI4Zvp0VB6GpRld+By6E2nVdlFHT2g2kK9zM
8jSnsuee7mkmJD+W3Mo36HQvUfOe7jH5vP7tu1i0jDykzR0pUhJZUcY6xVrSwNPoNVPcT72N
eHhGwyRBj2+0vKbgTmcZKBMJzETRfOl2YGDDVB3FvKBSixMMqfWSX8uh3wPGOi8W9vOASC3z
0UvPqL7KR78SykUEoBCxpMGmE8pgElC/dagmVpIIt7QA6sneMlNb2OO/1zTN44ACRsm+2JAo
zD41TcuGaNUqDYNDRbPEKzeRZeXxrx1UvOWsYTNaO6icaV/NrtZbmXpDuGA/sqnz4jnKFK8S
0VC+Yjh2iJEV5edD2+8pyMgx44NVDiAQ+sjjDkpGc0IxXrm/v52yduhnj/xnkualIm/RyAv0
Q/YzRAHy7NvyavbajIvCFoZWpbO3Jw8NwkoU25ysfgvXZJrw4vPjh4hHR4Mpto6jFMM+dZPW
3N9HL971bTBgyAL0BjASEFXe83D+IoBYX0VQVk5+t7p7iUsmfyK5t+cECNpNOL6UaACcsAYB
Le+yLOAqFHSvCXlWcECxG7wXjAA2/XmBwvKBNLcggXKVp3i9cNzab0Mq9qSAcIYgRFxRdAOe
sTDZNOx6HkJTbCRKCMiJzgjQQW476DlOZD+9Gwh+AA/Y3PIDOfyhlvXT6HsjW33mASJUuORB
la5Jb3rB4syO6QO2a5vSHu26Gwib2EflS8bqC1hZhpHsvM+mAaWJ2x72JyrPe8V7Ohjbre49
gRsjAtspIYfP5958sSnHdkz32nGAXnrEY95lEHGwkuXLlj9y6I21aAyd3/lJkuEAEBxzZVnm
IaNJBwl8u33+SqGLZzILy1QxmA+pF8yUaQ+yRU/5+3n1mY4=

/
--------------------------------------------------------
--  DDL for Procedure ORA$_SYS_REP_AUTH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."ORA$_SYS_REP_AUTH" as
begin
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repschema TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repprop TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_aqcall TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_calldest TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_error TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_destination TO SYS ' ||
                 'WITH GRANT OPTION';
end;

/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE" FOR "SYSTEM"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
--------------------------------------------------------
--  DDL for Queue DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQERROR',
     Queue_table         => 'SYSTEM.DEF$_AQERROR',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Error Queue for Deferred RPCs');
  END;
/
--------------------------------------------------------
--  DDL for Queue DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQCALL',
     Queue_table         => 'SYSTEM.DEF$_AQCALL',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Deferred RPC Queue');
  END;
/
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQCALL"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
/
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQERROR"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
/
