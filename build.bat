@echo off
rem Bien dich goi model + dao vao WebContent\WEB-INF\classes roi chep web sang Tomcat cua XAMPP
cd /d "%~dp0"
if not exist WebContent\WEB-INF\classes mkdir WebContent\WEB-INF\classes
javac --release 8 -encoding UTF-8 -nowarn -d WebContent\WEB-INF\classes src\model\*.java src\dao\*.java
if errorlevel 1 (
    echo Bien dich that bai.
    exit /b 1
)
xcopy /E /I /Y /Q WebContent C:\xampp\tomcat\webapps\garaman >nul
echo Da bien dich va chep web vao C:\xampp\tomcat\webapps\garaman
