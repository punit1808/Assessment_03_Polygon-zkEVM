# Custom Circuit 
This project is to design a new zkSNARK circuit that implements some logical operations. We need to implement the circuit and deploy a verifier on-chain to verify proofs generated from this circuit

## Description

### Custom Circuit :
It implements the logic we are given in the diagram, it contains AND , OR and NOT gates.

#### INPUTS :
A : 0, 
B : 1,

LOGIC : OUTPUT => (A AND B) OR (NOT(B)) => 1

## Getting Started

For the execution of our code we will be using VS code ,
https://code.visualstudio.com/,
Etherscan testnet : https://sepolia.etherscan.io/ ,
Infura : https://www.infura.io/

### Executing program

```
code blocks for commands

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

```
STEPS:
1). npm i

2). npm hardhat circom

3). npm hardhat run scripts/deploy.ts --network sepolia.

## For Better Understanding you can refer to Video Explaination.

### Thanks for Reading
I hope you Understand the program Code and functioning well.
## Have a Nice Day !!!
