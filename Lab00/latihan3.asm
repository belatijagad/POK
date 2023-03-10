    .data
sapaan: .asciiz "Selamat datang pada awal perjalananmu, petualang!\nSebelum memulai petualanganmu, silakan memperkenalkan dirimu terlebih dahulu.\n"
pesanNPM: .asciiz "Masukkan NPM kamu: "
pesanMatkul: .asciiz "Masukkan jumlah SKS yang kamu ambil: "
pesanSKS: .asciiz "Masukkan SKS mata pelajaran "
titikDua: .asciiz ": "
penggalanPertama: .asciiz "Halo petualang dengan NPM "
penggalanKedua: .asciiz ". Hebat! Anda mengambil "
penggalanKetiga: .asciiz " mata kuliah dengan total "
penggalanKeempat: .asciiz " SKS."

.text
.globl main
main:
    li $v0, 4                   # Print pesan sapaan
    la $a0, sapaan
    syscall

    li $v0, 4                   # Print pesan meminta input NPM
    la $a0, pesanNPM
    syscall

    li $v0, 5                   # Mengambil input NPM
    syscall
    add $t0, $v0, $zero         # Menyimpan input NPM di t0

    li $v0, 4                   # Print pesan meminta input SKS
    la $a0, pesanMatkul
    syscall

    li $v0, 5                   # Mengambil input jumlah mata kuliah
    syscall
    add $t1, $v0, $zero         # Menyimpan input jumlah mata kuliah di t1

    # Loop n times
    li $t2, 1       # initialize the sum to 0
    Loop:
        bne $t1, $zero, Cont    # if n is not zero, continue with the loop
        j Exit                  # if n is zero, exit the loop
    Cont:
        li $v0, 4               # Print pesan meminta input SKS
        la $a0, pesanSKS
        syscall

        li $v0, 1               # Print angka
        la $a0, $t2
        syscall

        li $v0, 4               # Print titik dua
        la $a0, titikDua
        syscall

        li $v0, 5               # system call for read integer
        syscall                 # read integer
        add $t2, $t2, $v0       # add the input to the sum
        addi $t1, $t1, -1       # decrement n
        j Loop                  # jump back to the beginning of the loop
    Exit:
        move $s0, $t2           # move the sum to $s0

    li $v0, 4
    la $a0, penggalanPertama    # Print penggalan pertama pesan
    syscall

    li $v0, 1
    add $a0, $t0, $zero         # Print NPM
    syscall

    li $v0, 4
    la $a0, penggalanKedua      # Print penggalan kedua pesan
    syscall

    li $v0, 1
    add $a0, $t1, $zero         # Print Matkul
    syscall

    li $v0, 4
    la $a0, penggalanKetiga     # Print penggalan ketiga pesan
    syscall

    li $v0, 1
    add $a0, $s0, $zero         # Print SKS
    syscall

    li $v0, 4
    la $a0, penggalanKeempat    # Print penggalan keempat pesan
    syscall

    
    li $v0, 10                  # End program
    syscall
