.data
sapaan: .asciiz "Selamat datang pada awal perjalananmu, petualang!\n Sebelum memulai petualanganmu, silakan memperkenalkan dirimu terlebih dahulu.\n"
pesanNPM: .asciiz "Masukkan NPM kamu: "
pesanSKS: .asciiz "Masukkan jumlah SKS yang kamu ambil: "
penggalanPertama: .asciiz "Halo petualang dengan NPM "
penggalanKedua: .asciiz ". Semoga dengan mengambil "
penggalanKetiga: .asciiz " SKS Anda bisa menyelesaikan petualangan ini dengan baik!"
pesanBohong: .asciiz "Berbohong itu tidak baik!"
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
    la $a0, pesanSKS
    syscall

    li $v0, 5                   # Mengambil input SKS
    syscall
    add $t1, $v0, $zero         # Menyimpan input SKS di t1

    subi $t2, $t1, 24
    bgtz $t2, printBohong       # Pengecekan jika SKS lebih dari 24

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
    add $a0, $t1, $zero         # Print SKS
    syscall

    li $v0, 4
    la $a0, penggalanKetiga     # Print penggalan ketiga pesan
    syscall

    li $v0, 10                  # End program
    syscall

printBohong:
    li $v0, 4                   # Print pesan jika berbohong
    la $a0, pesanBohong
    syscall