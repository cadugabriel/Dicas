SELECT
      Banco         = banco.name
    , Processo		= process.spid
    , Computador	= process.hostname
    , Usuario		= process.loginame
    , Status		= process.status
    , BloqueadoPor	= process.blocked
    , TipoComando	= process.cmd
    , Aplicativo	= process.program_name
	, DTHLogado   	= process.login_time
	, DTHUltimoCMD  = process.last_batch
FROM
    sysprocesses    (NOLOCK) process
LEFT JOIN 
    sys.databases   (NOLOCK) banco on banco.database_id = process.dbid
WHERE
    process.status in ('runnable', 'suspended')
and banco.name     <> 'master'
ORDER BY
    process.blocked desc, process.status, process.spid
