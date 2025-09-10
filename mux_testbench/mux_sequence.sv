class mux_sequence extends uvm_sequence#(mux_sequence_item);
  
  `uvm_object_utils(mux_sequence)            
  
  mux_sequence_item txn;                     
 
  function new(string name="mux_sequence");  
    super.new(name);
  endfunction
  virtual task body();
    
  endtask:body
 
endclass


class random_data extends mux_sequence;
   
  `uvm_object_utils(random_data)      
  
  mux_sequence_item txn;
 
  function new(string name="");
      super.new(name);
  endfunction
 
  task body();
    repeat(10)
      begin
        txn=mux_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize();
        #4;
        finish_item(txn);
      end
  endtask
  
endclass



class mux_sel_000 extends mux_sequence;
    
  `uvm_object_utils(mux_sel_000)      
  
  
  mux_sequence_item txn;
  
 
  function new(string name="");
      super.new(name);
  endfunction
 
  task body();
    repeat(10)
      begin
        txn=mux_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.sel==0;};
        #4;
        finish_item(txn);
      end
  endtask
 
endclass


class mux_sel_001 extends mux_sequence;
   
  `uvm_object_utils(mux_sel_001)      
 
  
  mux_sequence_item txn;
 
  function new(string name="");
      super.new(name);
  endfunction
 
  task body();
    repeat(10)
      begin
        txn=mux_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.sel==1;};
        #4;
        finish_item(txn);
      end
  endtask
 
endclass


class mux_sel_010 extends mux_sequence;
   
  `uvm_object_utils(mux_sel_010)      
  
  mux_sequence_item txn;
 
  function new(string name="");
      super.new(name);
  endfunction
 
  task body();
    repeat(10)
      begin
        txn=mux_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.sel==2;};
        #4;
        finish_item(txn);
      end
  endtask
 
endclass


class mux_sel_011 extends mux_sequence;
    
  `uvm_object_utils(mux_sel_011)      
 
  mux_sequence_item txn;
 
  function new(string name="");
      super.new(name);
  endfunction
  
  task body();
    repeat(10)
      begin
        txn=mux_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.sel==3;};
        #4;
        finish_item(txn);
      end
  endtask
  
endclass





class mux_sel_100 extends mux_sequence;
    
  `uvm_object_utils(mux_sel_100)      
 
  mux_sequence_item txn;
 
  function new(string name="");
      super.new(name);
  endfunction
  
  task body();
    repeat(10)
      begin
        txn=mux_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.sel==4;};
        #4;
        finish_item(txn);
      end
  endtask
  
endclass

class mux_sel_101 extends mux_sequence;
    
  `uvm_object_utils(mux_sel_101)      
 
  mux_sequence_item txn;
 
  function new(string name="");
      super.new(name);
  endfunction
  
  task body();
    repeat(10)
      begin
        txn=mux_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.sel==5;};
        #4;
        finish_item(txn);
      end
  endtask
  
endclass

class mux_sel_110 extends mux_sequence;
    
  `uvm_object_utils(mux_sel_110)      
 
  mux_sequence_item txn;
 
  function new(string name="");
      super.new(name);
  endfunction
  
  task body();
    repeat(10)
      begin
        txn=mux_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.sel==6;};
        #4;
        finish_item(txn);
      end
  endtask
  
endclass

class mux_sel_111 extends mux_sequence;
    
  `uvm_object_utils(mux_sel_111)      
 
  mux_sequence_item txn;
 
  function new(string name="");
      super.new(name);
  endfunction
  
  task body();
    repeat(10)
      begin
        txn=mux_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.sel==7;};
        #4;
        finish_item(txn);
      end
  endtask
  
endclass

