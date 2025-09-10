`uvm_analysis_imp_decl( _drv )
`uvm_analysis_imp_decl( _mon )

class mux_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(mux_scoreboard)
  
  uvm_analysis_imp_drv #(mux_sequence_item, mux_scoreboard) aport_drv;
  uvm_analysis_imp_mon #(mux_sequence_item, mux_scoreboard) aport_mon;
  
  uvm_tlm_fifo #(mux_sequence_item) expfifo;
  uvm_tlm_fifo #(mux_sequence_item) outfifo;
  
  int VECT_CNT, PASS_CNT, ERROR_CNT;

  
  function new(string name="mux_scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	aport_drv = new("aport_drv", this);
	aport_mon = new("aport_mon", this);
	expfifo= new("expfifo",this);
	outfifo= new("outfifo",this);
  endfunction

  reg t_out;
  function void write_drv(mux_sequence_item tr);
    `uvm_info("write_drv STIM", tr.convert2string(), UVM_MEDIUM)
   // static logic exp_out;
    t_out=tr.in[tr.sel];
    tr.out=t_out;
    void'(expfifo.try_put(tr));
  endfunction

  function void write_mon(mux_sequence_item tr);
    `uvm_info("write_mon OUT ", tr.convert2string(), UVM_MEDIUM)
	void'(outfifo.try_put(tr));
  endfunction
  
  task run_phase(uvm_phase phase);
	mux_sequence_item exp_tr, out_tr;
	forever begin
		`uvm_info("scoreboard run task","WAITING for expected output", UVM_DEBUG)
		expfifo.get(exp_tr);
		`uvm_info("scoreboard run task","WAITING for actual output", UVM_DEBUG)
		outfifo.get(out_tr);
        
      if (out_tr.compare(exp_tr)) begin
			PASS();
        `uvm_info ("PASS ",out_tr.convert2string() , UVM_LOW)
		end
      
      	else begin
			ERROR();
          `uvm_info ("ERROR [ACTUAL_OP]",out_tr.convert2string() , UVM_LOW)
          `uvm_info ("ERROR [EXPECTED_OP]",exp_tr.convert2string() , UVM_LOW)
          `uvm_warning("ERROR",exp_tr.convert2string())
		end
    end
  endtask

  function void PASS();
	VECT_CNT++;
	PASS_CNT++;
  endfunction

  function void ERROR();
  	VECT_CNT++;
  	ERROR_CNT++;
  endfunction

      
endclass
