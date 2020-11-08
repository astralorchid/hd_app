nasm boot.asm -f bin -o boot.bin
nasm real.asm -f bin -o real.bin
copy /b boot.bin+real.bin boot.flp
nasm listProgram.asm -f bin -o listProgram.flp
pause
