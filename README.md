A 32 bit toy virtual machine written in C executing compiled binaries based on a fantasy instruction set. Also programable in a higher, c-like language. For more information visit the [wiki](https://github.com/zarat/vm/wiki) or see some [examples](https://github.com/zarat/vm/tree/main/examples).

#### Features
* Char, Integer and Float arithmetics
* Save memory to portable binaries
* Programable in 2 fantasy languages (1 low level, 1 high level)

#### Hello world Examples

Print "Hello world" to screen using fantasy assembly

```Assembly
si ax
push "Hello world"
si bx
sub bx ax
push bx
push 1
puts
push 1
write
```

and using fantasy c

```C
str = "Hello world";
write(str);
```
