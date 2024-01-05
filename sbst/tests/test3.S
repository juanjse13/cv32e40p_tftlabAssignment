.section .text
.global test3
.type test3, @function

test3:
	# ABI prologue
	addi sp, sp, -112     # allocate 112 bytes on the stack
	sw ra, 104(sp)        # save return address
	sw s0, 96(sp)         # save callee-saved registers
	sw s1, 88(sp)
	sw s2, 80(sp)
	sw s3, 72(sp)
	sw s4, 64(sp)
	sw s5, 56(sp)
	sw s6, 48(sp)
	sw s7, 40(sp)
	sw s8, 32(sp)
	sw s9, 24(sp)
	sw s10, 16(sp)
	sw s11, 8(sp)
	addi s0, sp, 112     # set up s0 to point to start of stack frame


    # You can write your code here 

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


    li a0, 0xCAFECAFE    # return value


    # ABI epilogue
	lw s11, 8(sp)        # restore callee-saved registers
	lw s10, 16(sp)
	lw s9, 24(sp)
	lw s8, 32(sp)
	lw s7, 40(sp)
	lw s6, 48(sp)
	lw s5, 56(sp)
	lw s4, 64(sp)
	lw s3, 72(sp)
	lw s2, 80(sp)
	lw s1, 88(sp)
	lw s0, 96(sp)
	lw ra, 104(sp)       # restore return address
	addi sp, sp, 112     # deallocate stack space
	jr ra                # return to caller



# READ/WRITE VARIABLES

.section .data

# READ-ONLY VARIABLES

.section .rodata