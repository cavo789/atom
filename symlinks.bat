@ECHO OFF

REM This script should be started from a CMD prompt **BUT** launched
REM with admin privileges. The mklink command requires indeed admin rights.
REM
REM BTW : %cd%\ is the current directory

if exist %USERPROFILE%\.atom\config.cson (
	del %USERPROFILE%\.atom\config.cson
)
mklink %USERPROFILE%\.atom\config.cson %cd%\config.cson

if exist %USERPROFILE%\.atom\init.coffee (
	del %USERPROFILE%\.atom\init.coffee
)
mklink %USERPROFILE%\.atom\init.coffee %cd%\init.coffee

if exist %USERPROFILE%\.atom\keymap.cson (
	del %USERPROFILE%\.atom\keymap.cson
)
mklink %USERPROFILE%\.atom\keymap.cson %cd%\keymap.cson

if exist %USERPROFILE%\.atom\projects.cson (
	del %USERPROFILE%\.atom\projects.cson
)
mklink %USERPROFILE%\.atom\projects.cson %cd%\projects.cson

if exist %USERPROFILE%\.atom\snippets.cson (
	del %USERPROFILE%\.atom\snippets.cson
)
mklink %USERPROFILE%\.atom\snippets.cson %cd%\snippets.cson

if exist %USERPROFILE%\.atom\styles.less (
	del %USERPROFILE%\.atom\styles.less
)
mklink %USERPROFILE%\.atom\styles.less %cd%\styles.less
