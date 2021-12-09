A 32 bit toy virtual machine written in C executing compiled binaries based on a fantasy instruction set. You can write programs in fantasy assembly language but also in a higher c-like fantasy language which is in development. For more information visit the [wiki](https://github.com/zarat/vm/wiki) or see some [examples](https://github.com/zarat/vm/tree/main/examples).


```
// Translate a script into assembly instructions
tl.exe script.txt > script.asm

// Compile the assembly instructions into a binary
as script.asm script.zvm 

// run the binary
vm script.zvm
```

#### Features
* Char, Integer and Float arithmetics
* Save memory to portable binaries
* Write programs in a fantasy assembly or a higher c-like fantasy language
