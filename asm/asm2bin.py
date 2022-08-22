# from riscv_assembler.convert import AssemblyConverter
# import shutil

# pathRiscV = "C:/Users/Dell Latitude/OneDrive - Hanoi University of Science and Technology/Documents/Tai Lieu DH/Kien truc may tinh/risc_v/"

# shutil.rmtree(pathRiscV+"asm/simple")

# cnv = AssemblyConverter(output_type = "pbt", nibble = False, hexMode = False)
# cnv.convert("BubbleSort.s")

# ===================================SIMPLE===================================

# f = open("simple.txt", "r")
# instr = ""
# for x in f:
#   s3 = x[24:32]
#   s2 = x[16:24]
#   s1 = x[8:16]
#   s0 = x[0:8]
#   instr += s3 + "\n"
#   instr += s2 + "\n"
#   instr += s1 + "\n"
#   instr += s0 + "\n"
# f.close()

# f = open("inst.txt", "w")
# f.write(instr)
# f.close()

# ===================================BUBBLE SORT===================================

f = open("MCode.mc", "r")
instr = ""
for x in f:
  s3 = x[6:8]
  s2 = x[4:6]
  s1 = x[2:4]
  s0 = x[0:2]
  instr += s3 + "\n"
  instr += s2 + "\n"
  instr += s1 + "\n"
  instr += s0 + "\n"
f.close()

f = open("binary.txt", "w")
f.write(instr)
f.close()

