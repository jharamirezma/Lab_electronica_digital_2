module semaforo #(parameter T_RED = 500_000_000, 
                            T_GREEN = 750_000_000, 
                            T_YELLOW = 100_000_000) (
    input clk,
    input rst,
    output reg red_veh,
    output reg yellow_veh,
    output reg green_veh,
    output reg red_p,
    output reg green_p
);

    localparam RED = 2'b00;
	localparam RED_TO_YELLOW = 2'b01;
    localparam GREEN = 2'b10;
	localparam GREEN_TO_YELLOW = 2'b11;

    reg [1:0] fsm_state;
    reg [1:0] next_state;

    reg [$clog2(T_GREEN)-1:0] counter; 

    initial begin
        fsm_state = RED;
        red_veh = 0; 
        yellow_veh = 0; 
        green_veh = 0;
        counter = 0;
        red_p = 0;
        green_p = 0;
    end

    always @(posedge clk)begin
        if(rst)begin
            fsm_state <= RED;
        end else begin
            fsm_state <= next_state;
        end
    end

    always @(*) begin
        case (fsm_state)
            RED: next_state = (counter == T_RED - 1)? RED_TO_YELLOW: RED;
			RED_TO_YELLOW: next_state = (counter == T_YELLOW - 1) ? GREEN : RED_TO_YELLOW;
            GREEN: next_state = (counter == T_GREEN - 1)? GREEN_TO_YELLOW : GREEN;
            GREEN_TO_YELLOW: next_state = (counter == T_YELLOW - 1)? RED : GREEN_TO_YELLOW;
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin
            counter <= 0;
        end else if (
            (fsm_state == RED           && counter == T_RED - 1) ||
            (fsm_state == GREEN         && counter == T_GREEN - 1) ||
            ((fsm_state == RED_TO_YELLOW || fsm_state == GREEN_TO_YELLOW) && counter == T_YELLOW - 1)
        ) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
		  end
    end

    always @(posedge clk) begin
        if (rst) begin
            red_veh<= 0;
            green_veh  <= 0;
            yellow_veh <= 0;
            red_p <= 0;
            green_p  <= 0;
        end else begin
            case(fsm_state)
                RED: begin
                    red_veh <= 1; yellow_veh <= 0; green_veh <= 0;
                    red_p <= 0; green_p <=1;
                end
                RED_TO_YELLOW: begin
                    red_veh <= 0; yellow_veh <= 1; green_veh <= 0;
                    red_p <= 1; green_p <=0;
                end
                GREEN: begin
                    red_veh <= 0; yellow_veh <= 0; green_veh <= 1;
                    red_p <= 1; green_p <=0;
                end
                GREEN_TO_YELLOW: begin
                    red_veh <= 0; yellow_veh <= 1; green_veh <= 0;
                    red_p <= 1; green_p <=0;
                end
            endcase
        end
    end

endmodule
