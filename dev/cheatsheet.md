# Cheatsheet

## GDB

* `conti` - Continue
* `stepi` / `nexti` - Step to next instruction
* `br *0x7c00` - Set breakpoint
* `p/x $bx` - Get value
* `x/s $bx` - Dump string
* `x/1bc $bx` - Dump single char
* `x/4xw $sp` - Examine stack ptr
* `bt` - backtrace: show stack functions and args
* `info frame` - show stack start/end/args/locals pointers
* `x/100x $sp` - show stack memory

## Radare

* `aa` - Base analysis
* `pd` - Disasemble block (optional - count)