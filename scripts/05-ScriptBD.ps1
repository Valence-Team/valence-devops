sqlcmd -S "$SQLSERVER.database.windows.net" -d $SQLDB -U $SQLUSER -P $SQLPASS -i scripts\script-bd.sql
