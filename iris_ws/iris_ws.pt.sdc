# L0 merged design timing constraints
# Board input clocks

create_clock -period 40.000 -name CLK_25M [get_ports {CLK_25M}]
create_clock -period 37.037 -name gpio_clk_27m [get_ports {gpio_clk_27m}]
