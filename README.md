## Toy VM

A 32 bit toy virtual machine written in C/C++ executing bytecode based on a fantasy assembly instruction set. For more information visit the [wiki](https://github.com/zarat/vm/wiki).

Find sources [here](https://github.com/zarat/vm-src).

## Hello world Example

```Assembly
si ax
push 100
push 108
push 114
push 111
push 119
push 32
push 111
push 108
push 108
push 101
push 72
si bx
sub bx ax
push bx
push 1
puts
push 1
write
```

Using the tool as.exe you can compile it into a binary file and execute it using vm.exe.

```
as assemblyname binaryname
vm binaryname
```
