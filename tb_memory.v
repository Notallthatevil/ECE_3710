module tb_memory();

   reg [11 : 0] a_address, b_address;
	reg [15 : 0] a_writeData, b_writeData;
	reg a_we, b_we, clk;
	wire [15 : 0] a_out, b_out;

   ram_block dut(.a_address(a_address), .b_address(b_address), .a_writeData(a_writeData), .b_writeData(b_writeData), .a_we(a_we), .b_we(b_we), .clk(clk), .a_out(a_out), .b_out(b_out));

   initial 
   begin 
		clk = 0;
		a_address = 0;
      b_address = 0;
      a_writeData = 0;
      b_writeData = 0;
      a_we = 0;
      b_we = 0;
		forever 
      begin
   		#20 clk = ~clk;
		end 
	end


   initial
   begin
      #40
      a_address = 12'h400;
      a_writeData = 16'h000F;
      a_we = 1;

      b_address = 12'h410;
      b_writeData = 16'hF000;
      b_we = 1;

      #40
      $display("a_out expected %h, actual %h, b_out expected %h, actual %h", a_writeData, a_out, b_writeData, b_out);

      a_we = 0;
      b_we = 0;
      a_address = 12'h410;
      b_address = 12'h400;

      #40
      $display("a_out expected %h, actual %h, b_out expected %h, actual %h", b_writeData, a_out, a_writeData, b_out);



   end


endmodule