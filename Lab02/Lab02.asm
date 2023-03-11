#################################################################
#      Belati Jagad Bintang Syuhada -- 2206081276 -- POK B      #
#################################################################

.data
array: .word 0, 0, 0, 0, 0

mintaNPM: .asciiz "Masukkan input 10 digit: "
penjualanMobil: .asciiz "Total penjualan mobil: "
penjualanMotor: .asciiz "\nTotal penjualan motor: "

.text

.globl main

main:
    la $t0, array           # Me-reserve $t0 untuk array
    addi $t6, $zero, 0      # Me-reserve $t6 untuk jumlah motor
    addi $t7, $zero, 0      # Me-reserve $t7 untuk jumlah mobil

    #################################################################
    #                         Meminta Input                         #
    #################################################################

    li $v0, 4               # Load pesan meminta NPM
	la $a0, mintaNPM
	syscall

    li $v0, 5               # Mengambil input NPM dari pengguna
	syscall
	add $t1, $v0, $zero


    #################################################################
    #                        Looping array                          #
    #################################################################

    addi $t2, $zero, 0      # Me-reserve $t2 untuk kondisional loop

    partitionLoop:
        div $t1, $t1, 100   # Membagi NPM dengan 100
        mflo $t1            # Hasil disimpan kembali ke $t1
        mfhi $t3            # Sisa bagi dimasukkan ke array nanti

        sw $t3, 0($t0)      # Memasukkan sisa ke dalam array
        addi $t0, $t0, 4    # Memindahkan pointer
        addi $t2, $t2, 1    # Menambah $t2 untuk kondisional loop

        bne $t2, 5, partitionLoop
        
    
    #################################################################
    #                       Processing array                        #
    #################################################################

    sumLoop:
        subi $t0, $t0, 4    # Memindahkan pointer
        lw $a0, 0($t0)      # Me-load angka yang ada di pointer

        div $a0, $a0, 10    # Melakukan pembagian oleh 10
        mflo $t4            # Hasil disimpan ke $t4
        mfhi $t5            # Sisa bagi disimpan ke $t5

        add $t6, $t6, $t4   # Menjumlahkan hasil ke penjualan motor
        add $t7, $t7, $t5   # Menjumlahkan sisa ke penjualan mobil

        subi $t2, $t2, 1    # Mengurangi $t2 untuk kondisional loop

        bne $t2, 0, sumLoop

    
    #################################################################
    #                         Print hasil                           #
    #################################################################

    li $v0, 4               # Print pesan penjualan mobil
	la $a0, penjualanMobil
	syscall
	
	li $v0, 1               # Print nominal nilai penjualan mobil
	move $a0, $t7
	syscall

    li $v0, 4               # Print pesan penjualan motor
	la $a0, penjualanMotor
	syscall
	
	li $v0, 1               # Print nominal nilai penjualan motor
	move $a0, $t6
	syscall

    j exit

exit:
    li $v0, 10
    syscall