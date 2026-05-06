@ECHO OFF
SET publisher_jar=publisher.jar
SET input_cache_path=%CD%\input-cache
SET FHIR_PACKAGE_CACHE_FOLDER=D:\.fhir

ECHO Checking internet connection...
PING tx.fhir.org -4 -n 1 -w 1000 | FINDSTR TTL && GOTO isonline
ECHO We're offline...
SET txoption=-tx n/a
GOTO igpublish

:isonline
ECHO We're online
SET txoption=

:igpublish

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%publisher_jar%" (
	JAVA -jar "%input_cache_path%\%publisher_jar%" -ig . %txoption% %*
) ELSE If exist "..\%publisher_jar%" (
	JAVA -jar "..\%publisher_jar%" -ig . %txoption% %*
) ELSE (
	ECHO IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
)

PAUSE

*---------------------------------------------------------------------------------------*
Sin serviodor de terminologia y con mas memoria


@ECHO OFF
SET publisher_jar=publisher.jar
SET input_cache_path=%CD%\input-cache

ECHO Checking internet connection...
PING tx.fhir.org -4 -n 1 -w 1000 | FINDSTR TTL && GOTO isonline
ECHO We're offline...
SET txoption=-tx n/a
GOTO igpublish

:isonline
ECHO We're online - checking HTTP connectivity...
curl -s --max-time 5 http://tx.fhir.org/r4/metadata >nul 2>&1
IF ERRORLEVEL 1 (
    ECHO tx.fhir.org HTTP timeout - using offline mode
    SET txoption=-tx n/a
) ELSE (
    SET txoption=
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
*---------------------------------------------------------------------------------------*
