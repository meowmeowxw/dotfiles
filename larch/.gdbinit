add-auto-load-safe-path /home/meowmeow/CTF/advent/chall00/.gdbinit
source /usr/share/pwndbg/gdbinit.py
echo colored retaddr
set show-retaddr-reg on
echo max backtrace 4
set dereference-limit 4
echo disasm lines 5
set context-code-lines 5
echo show cpu flags
set show-flags on
##source /home/meowmeow/.gdbinit-gef.py
