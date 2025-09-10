class mux_coverage extends uvm_subscriber #(mux_sequence_item);

 `uvm_component_utils(mux_coverage)
  
  function new(string name="",uvm_component parent);
    super.new(name,parent);
    cg=new();
  endfunction
  
  function void build_phase(uvm_phase phase);
  endfunction

  mux_sequence_item txn;
  real cov;
  
  covergroup cg;
    IN:coverpoint txn.in {   
      bins in1_1={[0:7]};
      bins in2_1={[8:15]};
      bins in3_1={[16:23]};
      bins in4_1={[24:31]};
      bins in5_1={[32:39]};
      bins in6_1={[40:47]};
      bins in7_1={[48:55]};
      bins in8_1={[56:63]};
    }
    SEL:coverpoint txn.sel{  
        bins sel1_2={0};
        bins sel2_2={1};
      	bins sel3_2={2};
     	bins sel4_2={3};
        bins sel5_2={4};
        bins sel6_2={5};
        bins sel7_2={6};
        bins sel8_2={7};
    }
    INxSEL:cross IN,SEL;
  endgroup:cg

  function void write(mux_sequence_item t);
    txn=t;
 
    cg.sample();
  endfunction
 
  function void extract_phase(uvm_phase phase);
    cov=cg.get_coverage();
  endfunction
 
  function void report_phase(uvm_phase phase);
    `uvm_info(get_type_name(),$sformatf("Coverage is %f",cov),UVM_LOW)
  endfunction

endclass

