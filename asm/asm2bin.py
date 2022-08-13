from riscv_assembler.convert import AssemblyConverter
import shutil

pathRiscV = "C:/Users/Dell Latitude/OneDrive - Hanoi University of Science and Technology/Documents/Tai Lieu DH/Kien truc may tinh/risc_v/asm/"

shutil.rmtree(pathRiscV+"simple")

cnv = AssemblyConverter(output_type = "pt", nibble = False, hexMode = False)
cnv.convert("simple.s")


f = open(pathRiscV+"simple/txt/simple.txt", "r")
instr = ""
for x in f:
  s3 = x[24:32]
  s2 = x[16:24]
  s1 = x[8:16]
  s0 = x[0:8]
  instr += s3 + "\n"
  instr += s2 + "\n"
  instr += s1 + "\n"
  instr += s0 + "\n"

f = open("C:/Users/Dell Latitude/OneDrive - Hanoi University of Science and Technology/Documents/Tai Lieu DH/Kien truc may tinh/risc_v/sim/tb/inst.txt", "w")
f.write(instr)