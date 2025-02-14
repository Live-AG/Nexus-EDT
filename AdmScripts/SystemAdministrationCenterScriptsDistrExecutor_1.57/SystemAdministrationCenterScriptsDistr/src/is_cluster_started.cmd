@echo off
wmic process where "caption like '%%ragent.exe%%'" get processid,commandline,executablepath /Format:"%~dp0\..\external_utils\win_ext_files\csv.xsl"