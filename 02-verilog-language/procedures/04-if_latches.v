//The following code is a solution of a latch caused by the if statement. The latch is removed by assigning a value to the output in both branches of the if statement

module top_module (
    input cpu_overheated, arrived, gas_tank_empty,
    output reg shut_off_computer,
    output reg keep_driving  ); 

    always @(*) begin
        if (cpu_overheated) begin
           shut_off_computer = 1;
        end
            else begin
        	shut_off_computer = 0;
        end
    end

    always @(*) begin
        if (~arrived) begin
           keep_driving = ~gas_tank_empty;
    	end
    	else begin
            keep_driving = 0;         
        end
    end

endmodule