
class mux_driver extends uvm_driver #(mux_sequence_item);
  
  `uvm_component_utils(mux_driver)
  
  uvm_analysis_port #(mux_sequence_item) drv2sb;

  function new(string name="",uvm_component parent);
    super.new(name,parent);
    drv2sb=new("drv2sb",this);
  endfunction
  
  virtual interface intf vif;
  
  function void build_phase(uvm_phase phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif))) begin    
      $display("ERROR");
    end
  endfunction
 
  task run_phase(uvm_phase phase);
    mux_sequence_item txn;
    forever begin
      seq_item_port.get_next_item(txn);
      vif.sel =txn.sel;
      vif.in  =txn.in;
      drv2sb.write(txn);
      `uvm_info(get_type_name(),txn.convert2string(),UVM_MEDIUM)
      seq_item_port.item_done();
    end
  endtask
 
endclass

