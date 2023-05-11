addi x10, x0, 0x200 # Base Address of array

addi x11, x0, 10 # Length of Array

# Array Initialization
addi x9, x0, 2		# A[0] = 2
sw x9, 0(x10)
addi x9, x0, 8		# A[1] = 8
sw x9, 4(x10)
addi x9, x0, 12		# A[2] = 12
sw x9, 8(x10)
addi x9, x0, 23		# A[3] = 23
sw x9, 12(x10)
addi x9, x0, 76		# A[4] = 76
sw x9, 16(x10)
addi x9, x0, 7		# A[5] = 7
sw x9, 20(x10)
addi x9, x0, 19		# A[6] = 19
sw x9, 24(x10)
addi x9, x0, 4		# A[7] = 4
sw x9, 28(x10)
addi x9, x0, 21		# A[8] = 21
sw x9, 32(x10)
addi x9, x0, 18		# A[9] = 18
sw x9, 36(x10)

# Sorting (Insertion sort):

addi x1, x0, 4 # x = 1

# if x < len(A) then start the loop
blt x1, x11, Outer_Loop 

Outer_Loop:
	# x + base_address
	add x3, x1, x10 

	# key = A[j]
	lw x4, 0(x3) 

	# i = x - 1
	addi x5, x1, -4 

	# i + base_address
	add x6, x5, x10 

	# A[i]
	lw x7, 0(x6) 

	# if i <= 0 then break
	ble x5, x0, Inner_Loop_Exit 

	# if A[i] <= key then break
	ble x7, x4, Inner_Loop_Exit 

Inner_Loop:
	# A[i + 1] = A[i]
	sw x7, 4(x6) 

	# i--
	addi x5, x5, -4 

	# i + base_address
	add x6, x5, x10 

	# A[i]
	lw x7, 0(x6) 

	# if i <= 0 then break
	ble x5, x0, Inner_Loop_Exit 

	# if A[i] > key then continue
	bgt x7, x4, Inner_Loop 

Inner_Loop_Exit:
	# A[i + 1] = key
	sw x4, 4(x6) 

	# j++
	addi x1, x1, 4 

	# if x < Len(A) then continue
	blt x1, x11, Outer_Loop 
