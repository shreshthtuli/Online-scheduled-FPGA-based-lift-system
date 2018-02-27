@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim lab8_elevator_control_behav -key {Behavioral:sim_1:Functional:lab8_elevator_control} -tclbatch lab8_elevator_control.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
