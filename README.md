A 32 bit toy virtual machine written in C executing compiled binaries based on a fantasy instruction set. Also programable in a higher, c-like language. For more information visit the [wiki](https://github.com/zarat/vm/wiki).

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

```
as assemblyname binaryname
vm binaryname
```

#### Using fantasy c

```C
str = "Hello world";
write(str);
```

```
tl scriptname > assemblyname
as assemblyname binaryname
vm binaryname
```
