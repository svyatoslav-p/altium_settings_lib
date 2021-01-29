@echo off
title Clean project

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
goto End
)
cd Outputs

if exist "Status Report.Txt" (echo Delete "Status Report.Txt"
del "Status Report.Txt")
)
echo ----------------------------------------- Clearing "Outputs\Assembly" dir.
if not exist Assembly/*.* (
echo No "Outputs\Assembly" dir Found.
goto End
)
cd Assembly

if exist "Status Report.Txt" (echo Delete "Status Report.Txt"
del "Status Report.Txt")
)
echo ----------------------------------------- Clearing "Outputs\KD" dir.
cd ..
if not exist KD/*.* (
echo No "Outputs\KD" dir Found.
goto End
)
cd KD

if exist "Status Report.Txt" (echo Delete "Status Report.Txt"
del "Status Report.Txt")
)
echo ----------------------------------------- Clearing "Outputs\Fabrication" dir.
cd ..
if not exist Fabrication/*.* (
echo No Fabrication Files Found.
goto End
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

:End
echo ----------------------------------------- End.
echo Press any key to EXIT.
pause>nul