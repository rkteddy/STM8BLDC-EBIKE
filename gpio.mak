# ST Visual Debugger Generated MAKE File, based on gpio.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=E:\electric&mcu_development\stm8程序\CXSTM8
ToolsetBin=E:\electric&mcu_development\stm8程序\CXSTM8
ToolsetInc=E:\electric&mcu_development\stm8程序\CXSTM8\Hstm8
ToolsetLib=E:\electric&mcu_development\stm8程序\CXSTM8\Lib
ToolsetIncOpts=-iE:\electric&mcu_development\stm8程序\CXSTM8\Hstm8 
ToolsetLibOpts=-lE:\electric&mcu_development\stm8程序\CXSTM8\Lib 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))


# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=Debug
ProjectSFile=gpio
TargetSName=$(ProjectSFile)
TargetFName=$(ProjectSFile).elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +mods0 +debug -pxp -pp -l -imc_fwlib_scalar\param -imc_fwlib_scalar -i..\fwlib1.1\1.1.1\inc -istm8_mc_framework\param -istm8_mc_framework\inc -i..\fwlib1.1\stm8s_standard_peripherals_lib\includes -isrc\h $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) $(ProjectSFile).elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Debug\stm8s_adc1.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_adc1.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_adc1.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_awu.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_awu.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_awu.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_beep.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_beep.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_beep.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_clk.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_clk.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_clk.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_exti.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_exti.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_exti.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_flash.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_flash.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_flash.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_gpio.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_gpio.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_gpio.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_i2c.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_i2c.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_i2c.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_itc.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_itc.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_itc.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_iwdg.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_iwdg.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_iwdg.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_rst.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_rst.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_rst.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_spi.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_spi.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_spi.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim1.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_tim1.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_tim1.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim5.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_tim5.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_tim5.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim6.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_tim6.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_tim6.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_uart1.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_uart1.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_uart1.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h ..\fwlib1.1\1.1.1\inc\stm8s_clk.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_wwdg.$(ObjectExt) : ..\fwlib1.1\1.1.1\src\stm8s_wwdg.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_wwdg.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\mc_hall.$(ObjectExt) : stm8_mc_framework\src\mc_hall.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_lib.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h ..\fwlib1.1\1.1.1\inc\stm8s_adc1.h ..\fwlib1.1\1.1.1\inc\stm8s_adc2.h ..\fwlib1.1\1.1.1\inc\stm8s_awu.h ..\fwlib1.1\1.1.1\inc\stm8s_beep.h ..\fwlib1.1\1.1.1\inc\stm8s_clk.h ..\fwlib1.1\1.1.1\inc\stm8s_flash.h ..\fwlib1.1\1.1.1\inc\stm8s_exti.h ..\fwlib1.1\1.1.1\inc\stm8s_gpio.h ..\fwlib1.1\1.1.1\inc\stm8s_i2c.h ..\fwlib1.1\1.1.1\inc\stm8s_itc.h ..\fwlib1.1\1.1.1\inc\stm8s_iwdg.h ..\fwlib1.1\1.1.1\inc\stm8s_rst.h ..\fwlib1.1\1.1.1\inc\stm8s_spi.h ..\fwlib1.1\1.1.1\inc\stm8s_tim1.h ..\fwlib1.1\1.1.1\inc\stm8s_tim2.h ..\fwlib1.1\1.1.1\inc\stm8s_tim3.h ..\fwlib1.1\1.1.1\inc\stm8s_tim4.h ..\fwlib1.1\1.1.1\inc\stm8s_tim5.h ..\fwlib1.1\1.1.1\inc\stm8s_tim6.h ..\fwlib1.1\1.1.1\inc\stm8s_uart1.h ..\fwlib1.1\1.1.1\inc\stm8s_uart2.h ..\fwlib1.1\1.1.1\inc\stm8s_uart3.h ..\fwlib1.1\1.1.1\inc\stm8s_wwdg.h stm8_mc_framework\param\mc_stm8s_hall_param.h stm8_mc_framework\param\mc_stm8s_clk_param.h mc_fwlib_scalar\param\mc_bldc_drive_param.h stm8_mc_framework\inc\mc_vtimer.h stm8_mc_framework\inc\dev_type.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\mc_stm8s_clk.$(ObjectExt) : stm8_mc_framework\src\mc_stm8s_clk.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_lib.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h ..\fwlib1.1\1.1.1\inc\stm8s_adc1.h ..\fwlib1.1\1.1.1\inc\stm8s_adc2.h ..\fwlib1.1\1.1.1\inc\stm8s_awu.h ..\fwlib1.1\1.1.1\inc\stm8s_beep.h ..\fwlib1.1\1.1.1\inc\stm8s_clk.h ..\fwlib1.1\1.1.1\inc\stm8s_flash.h ..\fwlib1.1\1.1.1\inc\stm8s_exti.h ..\fwlib1.1\1.1.1\inc\stm8s_gpio.h ..\fwlib1.1\1.1.1\inc\stm8s_i2c.h ..\fwlib1.1\1.1.1\inc\stm8s_itc.h ..\fwlib1.1\1.1.1\inc\stm8s_iwdg.h ..\fwlib1.1\1.1.1\inc\stm8s_rst.h ..\fwlib1.1\1.1.1\inc\stm8s_spi.h ..\fwlib1.1\1.1.1\inc\stm8s_tim1.h ..\fwlib1.1\1.1.1\inc\stm8s_tim2.h ..\fwlib1.1\1.1.1\inc\stm8s_tim3.h ..\fwlib1.1\1.1.1\inc\stm8s_tim4.h ..\fwlib1.1\1.1.1\inc\stm8s_tim5.h ..\fwlib1.1\1.1.1\inc\stm8s_tim6.h ..\fwlib1.1\1.1.1\inc\stm8s_uart1.h ..\fwlib1.1\1.1.1\inc\stm8s_uart2.h ..\fwlib1.1\1.1.1\inc\stm8s_uart3.h ..\fwlib1.1\1.1.1\inc\stm8s_wwdg.h stm8_mc_framework\inc\mc_dev_clk.h stm8_mc_framework\param\mc_stm8s_clk_param.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\mc_stm8s_port.$(ObjectExt) : stm8_mc_framework\src\mc_stm8s_port.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_lib.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h ..\fwlib1.1\1.1.1\inc\stm8s_adc1.h ..\fwlib1.1\1.1.1\inc\stm8s_adc2.h ..\fwlib1.1\1.1.1\inc\stm8s_awu.h ..\fwlib1.1\1.1.1\inc\stm8s_beep.h ..\fwlib1.1\1.1.1\inc\stm8s_clk.h ..\fwlib1.1\1.1.1\inc\stm8s_flash.h ..\fwlib1.1\1.1.1\inc\stm8s_exti.h ..\fwlib1.1\1.1.1\inc\stm8s_gpio.h ..\fwlib1.1\1.1.1\inc\stm8s_i2c.h ..\fwlib1.1\1.1.1\inc\stm8s_itc.h ..\fwlib1.1\1.1.1\inc\stm8s_iwdg.h ..\fwlib1.1\1.1.1\inc\stm8s_rst.h ..\fwlib1.1\1.1.1\inc\stm8s_spi.h ..\fwlib1.1\1.1.1\inc\stm8s_tim1.h ..\fwlib1.1\1.1.1\inc\stm8s_tim2.h ..\fwlib1.1\1.1.1\inc\stm8s_tim3.h ..\fwlib1.1\1.1.1\inc\stm8s_tim4.h ..\fwlib1.1\1.1.1\inc\stm8s_tim5.h ..\fwlib1.1\1.1.1\inc\stm8s_tim6.h ..\fwlib1.1\1.1.1\inc\stm8s_uart1.h ..\fwlib1.1\1.1.1\inc\stm8s_uart2.h ..\fwlib1.1\1.1.1\inc\stm8s_uart3.h ..\fwlib1.1\1.1.1\inc\stm8s_wwdg.h stm8_mc_framework\inc\mc_dev_port.h stm8_mc_framework\param\mc_stm8s_port_param.h mc_fwlib_scalar\param\mc_powerstage_param.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\mc_stm8s_vtimer.$(ObjectExt) : stm8_mc_framework\src\mc_stm8s_vtimer.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_lib.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h ..\fwlib1.1\1.1.1\inc\stm8s_adc1.h ..\fwlib1.1\1.1.1\inc\stm8s_adc2.h ..\fwlib1.1\1.1.1\inc\stm8s_awu.h ..\fwlib1.1\1.1.1\inc\stm8s_beep.h ..\fwlib1.1\1.1.1\inc\stm8s_clk.h ..\fwlib1.1\1.1.1\inc\stm8s_flash.h ..\fwlib1.1\1.1.1\inc\stm8s_exti.h ..\fwlib1.1\1.1.1\inc\stm8s_gpio.h ..\fwlib1.1\1.1.1\inc\stm8s_i2c.h ..\fwlib1.1\1.1.1\inc\stm8s_itc.h ..\fwlib1.1\1.1.1\inc\stm8s_iwdg.h ..\fwlib1.1\1.1.1\inc\stm8s_rst.h ..\fwlib1.1\1.1.1\inc\stm8s_spi.h ..\fwlib1.1\1.1.1\inc\stm8s_tim1.h ..\fwlib1.1\1.1.1\inc\stm8s_tim2.h ..\fwlib1.1\1.1.1\inc\stm8s_tim3.h ..\fwlib1.1\1.1.1\inc\stm8s_tim4.h ..\fwlib1.1\1.1.1\inc\stm8s_tim5.h ..\fwlib1.1\1.1.1\inc\stm8s_tim6.h ..\fwlib1.1\1.1.1\inc\stm8s_uart1.h ..\fwlib1.1\1.1.1\inc\stm8s_uart2.h ..\fwlib1.1\1.1.1\inc\stm8s_uart3.h ..\fwlib1.1\1.1.1\inc\stm8s_wwdg.h stm8_mc_framework\inc\mc_vtimer.h stm8_mc_framework\inc\dev_type.h stm8_mc_framework\param\mc_stm8s_clk_param.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\mc_vtimer.$(ObjectExt) : stm8_mc_framework\src\mc_vtimer.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h stm8_mc_framework\inc\mc_vtimer.h stm8_mc_framework\inc\dev_type.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\main.$(ObjectExt) : main.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_lib.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h ..\fwlib1.1\1.1.1\inc\stm8s_adc1.h ..\fwlib1.1\1.1.1\inc\stm8s_adc2.h ..\fwlib1.1\1.1.1\inc\stm8s_awu.h ..\fwlib1.1\1.1.1\inc\stm8s_beep.h ..\fwlib1.1\1.1.1\inc\stm8s_clk.h ..\fwlib1.1\1.1.1\inc\stm8s_flash.h ..\fwlib1.1\1.1.1\inc\stm8s_exti.h ..\fwlib1.1\1.1.1\inc\stm8s_gpio.h ..\fwlib1.1\1.1.1\inc\stm8s_i2c.h ..\fwlib1.1\1.1.1\inc\stm8s_itc.h ..\fwlib1.1\1.1.1\inc\stm8s_iwdg.h ..\fwlib1.1\1.1.1\inc\stm8s_rst.h ..\fwlib1.1\1.1.1\inc\stm8s_spi.h ..\fwlib1.1\1.1.1\inc\stm8s_tim1.h ..\fwlib1.1\1.1.1\inc\stm8s_tim2.h ..\fwlib1.1\1.1.1\inc\stm8s_tim3.h ..\fwlib1.1\1.1.1\inc\stm8s_tim4.h ..\fwlib1.1\1.1.1\inc\stm8s_tim5.h ..\fwlib1.1\1.1.1\inc\stm8s_tim6.h ..\fwlib1.1\1.1.1\inc\stm8s_uart1.h ..\fwlib1.1\1.1.1\inc\stm8s_uart2.h ..\fwlib1.1\1.1.1\inc\stm8s_uart3.h ..\fwlib1.1\1.1.1\inc\stm8s_wwdg.h src\h\functions.h ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\stdio.h ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\string.h stm8_mc_framework\inc\mc_dev_clk.h stm8_mc_framework\inc\mc_vtimer.h stm8_mc_framework\inc\dev_type.h stm8_mc_framework\inc\mc_dev_vtimer.h stm8_mc_framework\inc\mc_hall.h stm8_mc_framework\param\mc_stm8s_hall_param.h stm8_mc_framework\inc\mc_dev_port.h stm8_mc_framework\param\mc_stm8s_port_param.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\functions.$(ObjectExt) : src\c\functions.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h ..\fwlib1.1\1.1.1\inc\stm8s_lib.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h ..\fwlib1.1\1.1.1\inc\stm8s_adc1.h ..\fwlib1.1\1.1.1\inc\stm8s_adc2.h ..\fwlib1.1\1.1.1\inc\stm8s_awu.h ..\fwlib1.1\1.1.1\inc\stm8s_beep.h ..\fwlib1.1\1.1.1\inc\stm8s_clk.h ..\fwlib1.1\1.1.1\inc\stm8s_flash.h ..\fwlib1.1\1.1.1\inc\stm8s_exti.h ..\fwlib1.1\1.1.1\inc\stm8s_gpio.h ..\fwlib1.1\1.1.1\inc\stm8s_i2c.h ..\fwlib1.1\1.1.1\inc\stm8s_itc.h ..\fwlib1.1\1.1.1\inc\stm8s_iwdg.h ..\fwlib1.1\1.1.1\inc\stm8s_rst.h ..\fwlib1.1\1.1.1\inc\stm8s_spi.h ..\fwlib1.1\1.1.1\inc\stm8s_tim1.h ..\fwlib1.1\1.1.1\inc\stm8s_tim2.h ..\fwlib1.1\1.1.1\inc\stm8s_tim3.h ..\fwlib1.1\1.1.1\inc\stm8s_tim4.h ..\fwlib1.1\1.1.1\inc\stm8s_tim5.h ..\fwlib1.1\1.1.1\inc\stm8s_tim6.h ..\fwlib1.1\1.1.1\inc\stm8s_uart1.h ..\fwlib1.1\1.1.1\inc\stm8s_uart2.h ..\fwlib1.1\1.1.1\inc\stm8s_uart3.h ..\fwlib1.1\1.1.1\inc\stm8s_wwdg.h src\h\functions.h ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\stdio.h ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\string.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h stm8s_it.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_it.$(ObjectExt) : stm8s_it.c ..\..\..\..\..\..\stm8程序\cxstm8\hstm8\mods0.h stm8s_it.h ..\fwlib1.1\1.1.1\inc\stm8s.h ..\fwlib1.1\1.1.1\inc\stm8s_type.h ..\fwlib1.1\1.1.1\inc\stm8s_conf.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

$(ProjectSFile).elf :  $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_iwdg.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim5.o $(OutputPath)\stm8s_tim6.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\mc_hall.o $(OutputPath)\mc_stm8s_clk.o $(OutputPath)\mc_stm8s_port.o $(OutputPath)\mc_stm8s_vtimer.o $(OutputPath)\mc_vtimer.o $(OutputPath)\main.o $(OutputPath)\functions.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_it.o $(OutputPath)\gpio.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 -m$(OutputPath)\$(TargetSName).map $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_iwdg.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim5.o
	-@erase $(OutputPath)\stm8s_tim6.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\mc_hall.o
	-@erase $(OutputPath)\mc_stm8s_clk.o
	-@erase $(OutputPath)\mc_stm8s_port.o
	-@erase $(OutputPath)\mc_stm8s_vtimer.o
	-@erase $(OutputPath)\mc_vtimer.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\functions.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\gpio.elf
	-@erase $(OutputPath)\gpio.elf
	-@erase $(OutputPath)\gpio.map
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_iwdg.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim5.ls
	-@erase $(OutputPath)\stm8s_tim6.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
	-@erase $(OutputPath)\mc_hall.ls
	-@erase $(OutputPath)\mc_stm8s_clk.ls
	-@erase $(OutputPath)\mc_stm8s_port.ls
	-@erase $(OutputPath)\mc_stm8s_vtimer.ls
	-@erase $(OutputPath)\mc_vtimer.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\functions.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_it.ls
endif

# 
# Release
# 
ifeq "$(CFG)" "Release"


OutputPath=Release
ProjectSFile=gpio
TargetSName=gpio
TargetFName=gpio.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  -imc_fwlib_scalar\param -imc_fwlib_scalar -i..\fwlib1.1\1.1.1\inc -istm8_mc_framework\param -istm8_mc_framework\inc -i..\fwlib1.1\stm8s_standard_peripherals_lib\includes -isrc\h +mods0 -pp $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) gpio.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Release\stm8s_adc1.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_awu.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_beep.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_clk.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_exti.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_flash.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_gpio.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_i2c.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_itc.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_iwdg.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_rst.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_spi.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim1.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim5.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim6.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_uart1.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_wwdg.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\mc_hall.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\mc_stm8s_clk.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\mc_stm8s_port.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\mc_stm8s_vtimer.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\mc_vtimer.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\main.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\functions.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8_interrupt_vector.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_it.$(ObjectExt) : 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

gpio.elf :  $(OutputPath)\stm8s_adc1.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_iwdg.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim5.o $(OutputPath)\stm8s_tim6.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\mc_hall.o $(OutputPath)\mc_stm8s_clk.o $(OutputPath)\mc_stm8s_port.o $(OutputPath)\mc_stm8s_vtimer.o $(OutputPath)\mc_vtimer.o $(OutputPath)\main.o $(OutputPath)\functions.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_it.o $(OutputPath)\gpio.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\stm8s_adc1.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_iwdg.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim5.o
	-@erase $(OutputPath)\stm8s_tim6.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\mc_hall.o
	-@erase $(OutputPath)\mc_stm8s_clk.o
	-@erase $(OutputPath)\mc_stm8s_port.o
	-@erase $(OutputPath)\mc_stm8s_vtimer.o
	-@erase $(OutputPath)\mc_vtimer.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\functions.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\gpio.elf
	-@erase $(OutputPath)\gpio.map
	-@erase $(OutputPath)\gpio.st7
	-@erase $(OutputPath)\gpio.s19
	-@erase $(OutputPath)\stm8s_adc1.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_iwdg.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim5.ls
	-@erase $(OutputPath)\stm8s_tim6.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
	-@erase $(OutputPath)\mc_hall.ls
	-@erase $(OutputPath)\mc_stm8s_clk.ls
	-@erase $(OutputPath)\mc_stm8s_port.ls
	-@erase $(OutputPath)\mc_stm8s_vtimer.ls
	-@erase $(OutputPath)\mc_vtimer.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\functions.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_it.ls
endif
