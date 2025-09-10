
class mux_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(mux_sequence_item)

  rand logic [7:0]in ; 
  rand logic [2:0]sel ;


  logic out;       
  
  function new(string name="mux_sequence_item");
    super.new(name);
  endfunction
    
  function string convert2string();
    return($sformatf("in = %4b sel=%2b out=%0b",in,sel,out));
  endfunction
endclass:mux_sequence_item
