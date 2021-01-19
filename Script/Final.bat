@echo off
title Finalizing Outputs    2-4-6-Layers Edition

set ReadMeFile="_Read Me.txt"
set LayersNum=2
echo ----------------------------------------- Clearing root dir.
for /r %%x in (*.Dat) do (echo Delete "%%x"
del "%%x"
)
for /r %%x in (*.PrjPCBStructure) do (echo Delete "%%x"
del "%%x"
)
for /r %%x in (*.htm) do (echo Delete "%%x"
del "%%x"
)
echo ----------------------------------------- Clearing "__Previews" dir.
if not exist __Previews/*.* goto PreviewsDirClear
cd __Previews
for /r %%x in (*.PcbDocPreview) do (echo Delete "%%x"
del "%%x"
)
for /r %%x in (*.SchDocPreview) do (echo Delete "%%x"
del "%%x"
)
cd ..
:PreviewsDirClear
rd __Previews

echo ----------------------------------------- Clearing "Logs" dir.
if not exist Logs/*.* (
echo No "Logs" dir Found.
goto LogsClearEnd
)

cd Logs
for /r %%x in (*.LOG) do (echo Delete "%%x"
del "%%x"
)
cd ..
rd Logs

:LogsClearEnd
echo ----------------------------------------- Clearing "History" dir.
if not exist History/*.* (
echo No "History" dir Found.
goto HistoryClearEnd
)

cd History
for /r %%x in (*.Zip) do (echo Delete "%%x"
del "%%x"
)
cd ..
rd History

:HistoryClearEnd
echo ----------------------------------------- Clearing "Outputs" dir.
if not exist Outputs/*.* (
echo No "Outputs" dir Found.
goto LayerSetEnd
)
cd Outputs

if exist "Status Report.Txt" (echo Delete "Status Report.Txt"
del "Status Report.Txt")
)
echo ----------------------------------------- Clearing "Assembly" dir.
if not exist Assembly/*.* (
echo No "Assembly" dir Found.
goto LayerSetEnd
)
cd Assembly

if exist "Status Report.Txt" (echo Delete "Status Report.Txt"
del "Status Report.Txt")
)
echo ----------------------------------------- Clearing "KD" dir.
cd ..
if not exist KD/*.* (
echo No "KD" dir Found.
goto LayerSetEnd
)
cd KD

if exist "Status Report.Txt" (echo Delete "Status Report.Txt"
del "Status Report.Txt")
)
echo ----------------------------------------- Clearing "Outputs\Fabrication" dir.
cd ..
if not exist Fabrication/*.* (set LayersNum=0
echo No Fabrication Files Found.
goto LayerSetEnd
)

cd Fabrication

for /r %%x in (*.apr) do (echo Delete "%%x"
del "%%x"
)
for /r %%x in (*.DRR) do (echo Delete "%%x"
del "%%x"
)
for /r %%x in (*.EXTREP) do (echo Delete "%%x"
del "%%x"
)
for /r %%x in (*.LDP) do (echo Delete "%%x"
del "%%x"
)
for /r %%x in (*.REP) do (echo Delete "%%x"
del "%%x"
)
for /r %%x in (*.RUL) do (echo Delete "%%x"
del "%%x"
)
for /r %%x in (*.APR_LIB) do (echo Delete "%%x"
del "%%x"
)

if exist "*.G4" (set LayersNum=6
echo Layers Count = 6 !
goto LayerSet
)
if exist "*.G2" (set LayersNum=4
echo Layers Count = 4 !
goto LayerSet
)
if not exist "*.GM1" (set LayersNum=0
echo No Fabrication Files Found.
if exist %ReadMeFile% del %ReadMeFile%
cd ..
rd Fabrication
goto LayerSetEnd
)

if %LayersNum%==2 (
echo Default Layers Count = 2.
)
:LayerSet
echo ----------------------------------------- Generating %ReadMeFile% File.

if exist %ReadMeFile% (
echo File found. Deleted.
del %ReadMeFile%
)

if not exist %ReadMeFile% (

echo File not found, generating!

echo ��������� ����:>>%ReadMeFile%
echo *.GM1			- ������ �������� �����>>%ReadMeFile%
echo. >>%ReadMeFile%
echo ��������� �������� �����:>>%ReadMeFile%
echo *-Plated.TXT		- ��������������� ���������>>%ReadMeFile%
echo *-NonPlated.TXT		- �� ��������������� ���������>>%ReadMeFile%
echo.  >>%ReadMeFile%
echo ���� �������� �����������:>>%ReadMeFile%
echo *.GTL			- 1-� ���� TOP>>%ReadMeFile%
if %LayersNum%==2 echo *.GBL			- 2-� ���� BOTTOM>>%ReadMeFile%
if %LayersNum%==4 echo *.GBL			- 4-� ���� BOTTOM>>%ReadMeFile%
if %LayersNum%==6 echo *.GBL			- 6-� ���� BOTTOM>>%ReadMeFile%
echo.  >>%ReadMeFile%

if %LayersNum%==4 (
echo ���������� ���� �������� �����������:>>%ReadMeFile%
echo *.G1			- 2-� ���� MIDLAYER1>>%ReadMeFile%
echo *.G2			- 3-� ���� MIDLAYER2>>%ReadMeFile%
echo.  >>%ReadMeFile%
)

if %LayersNum%==6 (
echo *.G1			- 2-� ���� MIDLAYER1>>%ReadMeFile%
echo *.G2			- 3-� ���� MIDLAYER2>>%ReadMeFile%
echo *.G3			- 4-� ���� MIDLAYER3>>%ReadMeFile%
echo *.G4			- 5-� ���� MIDLAYER4>>%ReadMeFile%
echo.  >>%ReadMeFile%
)

echo �������� �����:>>%ReadMeFile%
echo *.GTS			- ������� ������� TOP>>%ReadMeFile%
echo *.GBS			- ������ ������� BOTTOM>>%ReadMeFile%
echo.  >>%ReadMeFile%
echo ���������� \ �����������:>>%ReadMeFile%
echo *.GTO 			- ������� ������� TOP>>%ReadMeFile%
echo *.GBO 			- ������ ������� BOTTOM>>%ReadMeFile%
echo. >>%ReadMeFile%
echo ����������:>>%ReadMeFile%
echo ���������� ������ ���� ����� ��� ������ ���� ��������� �� ���������� ��������� �������� ����� � ��������������� ����.>>%ReadMeFile%
)
:LayerSetEnd
echo ----------------------------------------- End.
echo Press any key to EXIT.
pause>nul