CLS

PRINT "IDM Operating System V ver.0.0.1"

PRINT "FOR SYSTEM New 3DSLL Copylight by STD Corporation"

WAIT 180 

OPTION STRICT

VAR LOGINNAME$
VAR LOGINPASS$


VAR UNAME1$
VAR UPASS1$

'MAIN PROGRAM
GOSUB @LOGINPROCESSING
'ここでログイン処理がリターンしてくる。
'このとき、次にユーザが処理を実行するためのプロンプトを提供してあげる。

CLS





@LOGINPROCESSING
INPUT "login:";LOGINNAME$
INPUT "passw:";LOGINPASS$

IF(LOGINNAME$ == UNAME1$) GOSUB @EVALPASS
ELSE GOTO @LOGINPROCESSING
ENDIF

RETURN



'EVALUATION LOGIN PASSWORD
@EVALPASS
IF(LOGINPASS$ == UPASS1$) THEN RETURN
ELSE GOTO @LOGINPROCESSING
ENDIF



'LOGIN MANAGEMENT PROGRAM


END
