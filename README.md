# 99 Bottle of Beer on the Wall song in x86 Assembly

This is the "99 Bottles of Beer on the Wall" song written in x86 Assembly language using NASM. This song is commonly programmed when learning new programming languages; and yes, this is my first Assembly program involving NASM, so the code may not even be that good right now.

The purpose of this program is for me to show what I learned when studying NASM. I'll certainly be learning more in the future - Assembly is a pretty cool language.

[Software Demo Video](http://youtube.link.goes.here)

## Development Environment

This program was written using Vim on the Fedora Linux distribution. I also used Mousepad at one point as well, but it wasn't for writing the program.

NASM (The Netwide Assembler) is a Free and Open Source x86 Assembly language assembler and disassembler originally written by Simon Tatham, and is currently developed by a community of developers led by H. Peter Anvin. It is a popular Assembly tool for Linux users, but there are versions for Windows, MS-DOS, and other UNIX-like operating systems such as FreeBSD.

## License

This software is purely trivial and is therefore in the Public Domain.

## Build Instructions

Please note that this program is designed to work on Linux. The system calls of other operating systems like DOS, FreeBSD, and Windows is probably different.

To assemble and run, make sure you have both NASM and LD installed, and type:

`nasm -f elf 99beer.asm`

`ld -m elf_i386 99beer.o -o 99beer.out`

Then run the `99beer.out` file.

## Useful Websites

- [NASM Assembly Language Tutorials - asmtutor.com](https://asmtutor.com/)
- [Official website for NASM](https://www.nasm.us/)

## Future Work

- I would like to make the code cleaner, without having to call functions and replace everything in the EAX register all the time.
- Maybe try to use the stack a bit more?
- Make it 64-Bit.
