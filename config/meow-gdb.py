#!/usr/bin/env python3

import gdb
from elftools.elf.elffile import ELFFile

gdb.execute("set disassembly-flavor intel")
gdb.execute("set pagination off")

hook_stop_x64 = '''
    define hook-stop
    echo \\n-----------------------------------[DISASM]-----------------------------------\\n
    x/4i $rip
    echo -----------------------------------[STACK]------------------------------------\\n
    x/8g $rsp
    echo ------------------------------------------------------------------------------\\n\\n
    end
    '''

hook_stop_x86 = '''
    define hook-stop
    echo \\n-----------------------------------[DISASM]-----------------------------------\\n
    x/4i $eip
    echo -----------------------------------[STACK]------------------------------------\\n
    x/8g $esp
    echo ------------------------------------------------------------------------------\\n\\n
    end
    '''

binary_name = gdb.objfiles()[0].filename
binary = ELFFile(open(binary_name, "rb"))
if binary.get_machine_arch() == 'x64':
    gdb.execute("echo binary is x64\\n")
    gdb.execute(hook_stop_x64)
else:
    gdb.execute("echo binary is x86\\n")
    gdb.execute(hook_stop_x86)

