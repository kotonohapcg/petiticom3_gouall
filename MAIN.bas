'OPTION STRICTを有効化し、全ての変数に型付けを強制させる。
OPTION STRICT

'画面初期化
CLS

PRINT "IDM Operating System V ver.0.0.1"

PRINT "FOR SYSTEM New 3DSLL Copylight by STD Corporation"

WAIT 180 

'ログイン用の各種変数定義
VAR LOGINNAME$
VAR LOGINPASS$

'ログイン情報用の変数定義
VAR UNAME1$ = "root"
VAR UPASS1$ = "root"

'コマンド入力用変数
VAR IN$
VAR IN1$
VAR IN2$

'MAIN PROGRAM(LOGIN PROCESS)
GOTO @LOGINPROCESSING

@MAINPRG

'コマンドの受付
'IN$は、全てのコマンド入力のルートとなる変数である。IN$が非0である場合に、@COMPROCESSが呼び出され、各種コマンドが実行される形になる。このとき、オプション変数としてIN1$、IN2$の２つを取ることができる。この2つは、共に@COMPROCESSとその呼び出し先において有効化される。
INPUT ">",IN$
IF(IN$ != "") THEN
 GOSUB @COMPROCESS
ELSE
 GOTO @MAINPRG
ENDIF







@LOGINPROCESSING
INPUT "loginname";LOGINNAME$

'loginnameが正しいかどうかを判定してから、次のloginpass入力処理に進ませる。
'loginname/loginpassの判断用フラグLOGINDEXを設定する。初期値は0。
VAR LOGINDEX% = 0

IF(LOGINNAME$ == UNAME1$) THEN
 LOGINDEX%=0
ELSE
 LOGINDEX%=1
ENDIF

'loginname入力後のLOGINDEX値の評価
IF(LOGINDEX% == 0) THEN
 INPUT "loginpass";LOGINPASS$
ELSE
 GOTO @LOGINPROCESSING
ENDIF

'loginpass入力後のLOGINDEXの値を評価。0→0ならログイン。0→1なら@LOGINPROCESSINGに飛ばす。
IF(LOGINPASS$ == UPASS1$) THEN
 LOGINDEX%=0
ELSE
 LOGINDEX%=1
ENDIF
IF(LOGINDEX% == 0) THEN
 GOTO @MAINPRG
ELSE
 GOTO @LOGINPROCESSING
ENDIF


'command input process

@COMPROCESS
IF(IN$ == "shutdown") THEN
 INPUT "_>",IN1$
 INPUT "_>",IN2$

 'SWITCH ~ CASEをIF ~ THEN ~ ELSEで実装してみる
 IF(IN1$ == "-r") THEN
  IF(IN2$ == "now") THEN
   GOTO @END
  ELSE
   WAIT IN2$
   GOTO @END
  ENDIF
 ENDIF
ENDIF





@END
END
