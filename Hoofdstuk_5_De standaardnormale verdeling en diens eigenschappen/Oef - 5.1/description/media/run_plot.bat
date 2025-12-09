@echo off
REM Navigate to the media folder and run the R script
cd /d "%~dp0"
echo Running R script to generate normal distribution plot...
Rscript generate_plot.R
pause