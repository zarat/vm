## My fantasy toolchain

My (almost) complete fantasy toolchain from interpreter, assembler over compiler down to a 32 bit toy virtual machine written in C/C++ executing bytecode based on a fantasy assembly instruction set. Also programable in a higher, c-like fantasy language. For more information visit the [wiki](https://github.com/zarat/vm/wiki).

Find sources [here](https://github.com/zarat/vm-src).

## Features
* Char, Integer and Float arithmetics
* Save memory to portable binaries
* Programable in 2 fantasy languages (1 low level, 1 high level)

## Hello world Examples

#### Using fantasy assembly

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

#### Using fantasy c

The tool tl.exe can translate a higher, c-like fantasy language like

```C
str = "Hello world";
write(str);
```

into the vm's virtual assembly language which can be compiled using as.exe.

```
tl scriptname > assemblyname
as assemblyname binaryname
vm binaryname
```
