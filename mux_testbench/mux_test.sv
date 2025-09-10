
class mux_any_test extends uvm_test;
    `uvm_component_utils(mux_any_test)
   function new(string name="",uvm_component parent);
	    super.new(name,parent);
    endfunction
   
  	int file_h;
  
    mux_env env_h;
	random_data seq;
  	mux_sel_000 seq000;
  	mux_sel_001 seq001;
    mux_sel_001 seq001_1; 
  	mux_sel_010 seq010;
  	mux_sel_011 seq011;
    mux_sel_100 seq100;
    mux_sel_101 seq101;
    mux_sel_110 seq110;
    mux_sel_111 seq111;
 
    function void build_phase(uvm_phase phase);
      env_h = mux_env::type_id::create("env_h",this);
    endfunction
   
  	function void start_of_simulation_phase(uvm_phase phase);
        file_h=$fopen("mux_report.log","w");
    	env_h.set_report_default_file_hier(file_h);
    	env_h.set_report_severity_action_hier(UVM_INFO,UVM_DISPLAY+UVM_LOG);
        env_h.set_report_verbosity_level_hier(UVM_LOW);
        print();
  	endfunction
    function void end_of_elobartion_phase(uvm_phase phase);
      $display("End of eleboration phase in agent");
    endfunction
   
    task run_phase(uvm_phase phase);

	   phase.raise_objection(this);
         
         seq001= mux_sel_001::type_id::create("seq01");
         seq001_1= mux_sel_001::type_id::create("seq01_1");
         seq000= mux_sel_000::type_id::create("seq00");
      	 seq010= mux_sel_010::type_id::create("seq010");
      	 seq011= mux_sel_011::type_id::create("seq011");
      	 seq100= mux_sel_100::type_id::create("seq100");
      	 seq101= mux_sel_101::type_id::create("seq101");
      	 seq110= mux_sel_110::type_id::create("seq110");
       	 seq111= mux_sel_111::type_id::create("seq111");
         seq= random_data::type_id::create("seq");

      
      	 seq001.start(env_h.agent_h.sequencer_h); 
         seq001_1.start(env_h.agent_h.sequencer_h);
         seq000.start(env_h.agent_h.sequencer_h);   
         seq010.start(env_h.agent_h.sequencer_h);   
         seq011.start(env_h.agent_h.sequencer_h);
         seq100.start(env_h.agent_h.sequencer_h);
         seq101.start(env_h.agent_h.sequencer_h);
         seq110.start(env_h.agent_h.sequencer_h);
         seq111.start(env_h.agent_h.sequencer_h);
         seq.start(env_h.agent_h.sequencer_h);
	    
      phase.drop_objection(this);
       
    endtask
  
endclass

