@echo on
set PROJECT_DIR=%~dp0
set TOOLS=%PROJECT_DIR%tools
set JAVA_HOME=%TOOLS%\java\jdk_7u65_windows_x64
set CATALINA_HOME=%PROJECT_DIR%build\apache-tomcat-8.0.21
set PATH=%PATH%;%JAVA_HOME%\bin;%TOOLS%\gradle-2.2.1\bin;

gradle %* 