---Total Active sessions in db

set lines 136 pages 999
col OSUSER for a20
col USERNAME for a20
col MACHINE for a30
col STATUS for a9
col MIN_DATE for a20
col MAX_DATE for a20
col CNT for 999
break on status skip 1
compute sum of CNT on status


SELECT          OSUSER,
                USERNAME,
                MACHINE,
                STATUS,
                to_char(min(logon_time),'dd-MON-YYYY:HH24:mi:ss') MIN_DATE,
                to_char(max(logon_time),'dd-MON-YYYY:HH24:mi:ss') MAX_DATE,
/*              rpad(COUNT(*),3,' ') "CNT"      */
                COUNT(*) "CNT"
FROM            V$SESSION
GROUP BY        OSUSER,
                USERNAME,
                STATUS,
                MACHINE
ORDER BY        STATUS,
                to_char(min(logon_time),'dd-MON-YYYY:HH24:mi:ss'),
                to_char(max(logon_time),'dd-MON-YYYY:HH24:mi:ss')
/
