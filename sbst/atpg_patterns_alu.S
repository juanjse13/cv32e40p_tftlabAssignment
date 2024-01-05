#arithmetic/div1
  li s2, 0x7FAE92D8 
  li s3, 0xA1C345B9
  li t0, 0x3E86F207
  add s4, s2, s3
  sub s5, s4, s3
  addi s8, s4, 0x000001E5
  slt s6, s2, s5
  sltu t1, s2, t0
  slti t2, s3, 0x000002FA
  sltiu t3, s2, 0x000003B8

  div s6, s4, s5
  divu t4, s8, s4
  rem s7, s3, s4
  remu t5, s2, s7

  #logical/shift1
  li t0, 0x9D4B71C8
  li t1, 0x5A8E6F30
  li t2, 0xE712BC4F
  li t3, 0x0000000D
  and s2, t0, t1
  or s3, t0, t2
  xor s4, t1, t2
  andi s5, t0, 0x000006A7
  ori s6, t1, 0x0000040D
  xori s7, t2, 0x000000BB

  sll s8, t0, t3
  srl s2, t1, t3
  sra s3, t2, t3
  slli s4, t0, 0x00000018
  srli s5, t1, 0x00000012
  srai s5, t2, 0x0000001F

  #arithmetic/div2
  li s2, 0x8F2A6B17 
  li s3, 0x3C9E8D5F
  li t0, 0xA74B2F8C
  add s4, s2, s3
  sub s5, s4, s3
  addi s8, s4, 0x000001A7
  slt s6, s2, s5
  sltu t1, s2, t0
  slti t2, s3, 0x000005E3
  sltiu t3, s2, 0x000002B6

  div s6, s4, s5
  divu t4, s8, s4
  rem s7, s3, s4
  remu t5, s2, s7

  #logical/shift2
  li t0, 0xE1D7C6A9
  li t1, 0x5BF4912D
  li t2, 0x287F3E6A
  li t3, 0x0000000A
  and s2, t0, t1
  or s3, t0, t2
  xor s4, t1, t2
  andi s5, t0, 0x000007C1
  ori s6, t1, 0x0000046F
  xori s7, t2, 0x00000384

  sll s8, t0, t3
  srl s2, t1, t3
  sra s3, t2, t3
  slli s4, t0, 0x00000015
  srli s5, t1, 0x00000006
  srai s5, t2, 0x0000001D

  