`include "interface.sv"
`include "tb_pkg.sv"

module top;
  import uvm_pkg::*;
  import tb_pkg::*;
   
  intf i_intf();
  
  mux_8_1 DUT(.sel(i_intf.sel),.in(i_intf.in),.out(i_intf.out));
  
  initial begin    
    $dumpfile("dump1.vcd");
    $dumpvars(0,top);
  end
  
  initial begin
    uvm_config_db#(virtual intf)::set(uvm_root::get(),"","vif",i_intf);
  end

  initial begin
    run_test("mux_any_test");
  end
  
endmodule


