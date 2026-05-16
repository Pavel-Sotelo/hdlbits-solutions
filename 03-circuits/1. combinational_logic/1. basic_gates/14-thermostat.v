// Thermostat Control Logic
// Mode: 1 = Heating (Heater ON if too_cold), 0 = Cooling (AC ON if too_hot)
// Fan: ON if Heater is ON, AC is ON, or user overrides (fan_on = 1)
// Implementation: Combinational logic using only continuous assignments

module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    
    assign heater = mode & too_cold & ~aircon;
    assign aircon = ~mode & too_hot & ~heater;
    
    assign fan = aircon | heater | fan_on; 

endmodule