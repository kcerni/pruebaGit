nasm -f elf64 -g numeroFuerte.asm -o numeroFuerte.o
ld numeroFuerte.o -o numeroFuerte
./numeroFuerte
gdb -x testcode.gdb