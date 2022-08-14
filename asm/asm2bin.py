from riscv_assembler.convert import AssemblyConverter
import shutil

pathRiscV = "C:/Users/Dell Latitude/OneDrive - Hanoi University of Science and Technology/Documents/Tai Lieu DH/Kien truc may tinh/risc_v/"

shutil.rmtree(pathRiscV+"asm/simple")
type = "hex"
cnv = AssemblyConverter(output_type = "pt", nibble = False, hexMode = True)
cnv.convert("simple.s")

# # ===================================SIMPLE===================================

f = open(pathRiscV+"asm/simple/txt/simple.txt", "r")
instr = ""
for x in f:
  if type == "hex":
    x = x.replace("0x", "")
    s3 = x[6:8]
    s2 = x[4:6]
    s1 = x[2:4]
    s0 = x[0:2]
  else:
    s3 = x[24:32]
    s2 = x[16:24]
    s1 = x[8:16]
    s0 = x[0:8]
  instr += s3 + "\n"
  instr += s2 + "\n"
  instr += s1 + "\n"
  instr += s0 + "\n"
f.close()

f = open(pathRiscV+"asm/bubbleSort/binary.txt", "w")
f.write(instr)
f.close()

# # ===================================BUBBLE SORT===================================

# f = open(pathRiscV+"asm/bubbleSort/MCode.mc", "r")
# instr = ""
# for x in f:
#   s3 = x[6:8]
#   s2 = x[4:6]
#   s1 = x[2:4]
#   s0 = x[0:2]
#   instr += s3 + "\n"
#   instr += s2 + "\n"
#   instr += s1 + "\n"
#   instr += s0 + "\n"
# f.close()

# f = open(pathRiscV+"asm/bubbleSort/binary.txt", "w")
# f.write(instr)
# f.close()

