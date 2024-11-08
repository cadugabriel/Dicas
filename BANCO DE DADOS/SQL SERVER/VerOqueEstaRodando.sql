SELECT
     spid
    ,hostname
    ,loginame
    ,status
    ,blocked
    ,cmd
    ,program_name
	,login_time
FROM
    master..sysprocesses
WHERE
    status in ('runnable', 'suspended')
ORDER BY
    blocked desc, status, spid
