--1) Ver sessões
Select
      p.spid,
      p.addr,
      s.sid,
      s.serial#,
      s.username,
      s.osuser,
      s.status,
      s.server,
      s.logon_time,
      s.sql_hash_value,
      TO_CHAR (s.last_call_et / 3600, '009.99') inatividade,
      s.machine,
      s.program,
      p.pga_used_mem,
      p.pga_alloc_mem,
      p.pga_freeable_mem,
      pga_max_mem,
      sql.sql_text 
From v$session s, v$process p, v$sql sql 
Where s.username is not null 
  And s.paddr = p.addr (+) 
  And s.sql_address = sql.address;

--2) Quem está locando
 select substr(o.object_name,1,25)        as objeto,
       l.session_id                       as session_id,
       l.oracle_username                  as ora_user,
       l.os_user_name                     as os_user
from   dba_objects o, v$locked_object l
where  l.object_id = o.object_id
order by 1,3,4;

--3) Informações da sessão
 select
      sid,
      SERIAL#,
      USERNAME,
      status
from v$session where sid  = ???
 
--4) Primeiro o SID depois o serial
alter system kill session '<sid>, <serial>' immediate;
 