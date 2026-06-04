

@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET publisher_jar=publisher.jar
SET input_cache_path=%CD%\input-cache
SET ig_ini=%CD%\ig.ini
SET txserver=https://tx.fhir.org/r4
SET txmode=online

REM Lee configuracion desde ig.ini (si existe)
IF EXIST "%ig_ini%" (
	FOR /F "tokens=1,* delims==" %%A IN ('findstr /R /C:"^[ ]*tx-server[ ]*=" "%ig_ini%"') DO SET "txserver=%%B"
	FOR /F "tokens=1,* delims==" %%A IN ('findstr /R /C:"^[ ]*tx-mode[ ]*=" "%ig_ini%"') DO SET "txmode=%%B"
)

REM Trim basico de espacios iniciales
FOR /F "tokens=*" %%A IN ("%txserver%") DO SET "txserver=%%A"
FOR /F "tokens=*" %%A IN ("%txmode%") DO SET "txmode=%%A"

REM Permite sobreescribir el servidor de terminologia desde entorno
IF NOT "%FHIR_TX_SERVER%"=="" SET txserver=%FHIR_TX_SERVER%
IF NOT "%FHIR_TX_MODE%"=="" SET txmode=%FHIR_TX_MODE%

IF /I "%txmode%"=="offline" (
	ECHO Terminology mode: offline ^(-tx n/a^)
	SET txoption=-tx n/a
) ELSE (
	ECHO Terminology mode: online
	ECHO Terminology server: %txserver%
	SET txoption=-tx %txserver%
)

:igpublish

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
SET JAVA_MEM_OPTS=-Xms512m -Xmx4096m -XX:MaxMetaspaceSize=512m -XX:HeapBaseMinAddress=1G

IF EXIST "%input_cache_path%\%publisher_jar%" (
	JAVA %JAVA_MEM_OPTS% -jar "%input_cache_path%\%publisher_jar%" -ig . %txoption% %*
) ELSE If exist "..\%publisher_jar%" (
	JAVA %JAVA_MEM_OPTS% -jar "..\%publisher_jar%" -ig . %txoption% %*
) ELSE (
	ECHO IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
)

PAUSE