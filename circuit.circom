pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Multiplier2 () {  

   // signal input
   signal input a;
   signal input b;

   // signal from gates
   signal from_AND;
   signal from_NOT;

   // signal output
   signal output y;

   // component gates used 
   component andGate = AND();
   component orGate = OR();
   component notGate = NOT();

   // circuit logic

   andGate.a <== a;
   andGate.b <== b;
   from_AND <== andGate.out;

   notGate.in <== b;
   from_NOT <== notGate.out;

   orGate.a <== from_AND;
   orGate.b <== from_NOT;

   y <== orGate.out;
   
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
