class mux_monitor extends uvm_monitor;
  
  `uvm_component_utils(mux_monitor)
  function new(string name="",uvm_component parent);
    super.new(name,parent);
  endfunction
  mux_sequence_item  txn;
  
  virtual interface intf vif;
    uvm_analysis_port#(mux_sequence_item) ap_mon;
 
    function void build_phase(uvm_phase phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif)))
    begin
      `uvm_fatal("monitor","unable to get interface")
    end
    
    ap_mon=new("ap_mon",this);
    txn=mux_sequence_item::type_id::create("txn",this);
  endfunction
 
    task run_phase(uvm_phase phase);
    forever
    begin
     
      @(vif.in or vif.sel or vif.out);
      txn.in  = vif.in;
      txn.sel = vif.sel;
      txn.out = vif.out;
      ap_mon.write(txn);
      `uvm_info(get_type_name(),txn.convert2string(),UVM_MEDIUM)
    end
  endtask
 
endclass

