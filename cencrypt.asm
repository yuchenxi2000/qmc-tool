global _Cencrypt_mapL
global _Cencrypt_Encrypt
global _Cencrypt_Decrypt


section .text
_Cencrypt_mapL:        ; int Cencrypt::mapL(int)
push       rbp                                         ; CODE XREF=__ZN8Cencrypt7EncryptEiPci+83
mov        rbp, rsp
mov        qword [rbp-8], rdi
mov        dword [rbp-12], esi
cmp        dword [rbp-12], 0x0
jge        loc_1004c7731

mov        dword [rbp-12], 0x0
jmp        loc_1004c7751

loc_1004c7731:
cmp        dword [rbp-12], 0x7fff                   ; CODE XREF=__ZN8Cencrypt4mapLEi+15
jle        loc_1004c774c

mov        eax, dword [rbp-12]
cdq
mov        ecx, 0x7fff
idiv       ecx
mov        dword [rbp-12], edx

loc_1004c774c:
jmp        loc_1004c7751                               ; CODE XREF=__ZN8Cencrypt4mapLEi+40

loc_1004c7751:
mov        eax, dword [rbp-12]                      ; CODE XREF=__ZN8Cencrypt4mapLEi+28, loc_1004c774c
mov        ecx, dword [rbp-12]
sub        ecx, 0x1
imul       eax, ecx
add        eax, dword [rbp-12]
mov        dword [rbp-16], eax
mov        eax, dword [rbp-16]
add        eax, 0x13c1b
mov        dword [rbp-12], eax
mov        dword [rbp-20], 0x63
mov        eax, dword [rbp-20]
add        eax, 0x65
mov        dword [rbp-20], eax
mov        eax, dword [rbp-20]
add        eax, 0x38
mov        dword [rbp-20], eax
mov        eax, dword [rbp-12]
cdq
idiv       dword [rbp-20]
mov        dword [rbp-16], edx
movsxd     rsi, dword [rbp-16]
lea        rdi, [rel __ZL13g_p_map_space]
mov        r8b, byte [rdi+rsi]
mov        byte [rbp-21], r8b
movsx      ecx, byte [rbp-21]
mov        eax, ecx
pop        rbp
ret


_Cencrypt_Encrypt:        ; Cencrypt::Encrypt(int, char*, int)
push       rbp                                         ; CODE XREF=sub_1002a1070+85, __ZN8Cencrypt7DecryptEiPci+36
mov        rbp, rsp
sub        rsp, 0x40
mov        qword [rbp-16], rdi
mov        dword [rbp-20], esi
mov        qword [rbp-32], rdx
mov        dword [rbp-36], ecx
mov        rdi, qword [rbp-16]
cmp        dword [rbp-20], 0x0
mov        qword [rbp-56], rdi
jge        loc_1004c7694

mov        dword [rbp-4], 0xfffffffe
jmp        loc_1004c76fb

loc_1004c7694:
mov        dword [rbp-40], 0x0                     ; CODE XREF=__ZN8Cencrypt7EncryptEiPci+34

loc_1004c769b:
mov        eax, dword [rbp-40]                     ; CODE XREF=__ZN8Cencrypt7EncryptEiPci+144
cmp        eax, dword [rbp-36]
jge        loc_1004c76f5

mov        eax, dword [rbp-20]
add        eax, dword [rbp-40]
mov        rdi, qword [rbp-56]
mov        esi, eax
call       _Cencrypt_mapL                        ; Cencrypt::mapL(int)
mov        byte [rbp-41], al
mov        rdi, qword [rbp-32]
movsxd     rcx, dword [rbp-40]
mov        al, byte [rdi+rcx]
mov        byte [rbp-42], al
movsx      esi, byte [rbp-42]
movsx      edx, byte [rbp-41]
xor        esi, edx
mov        al, sil
mov        byte [rbp-42], al
mov        al, byte [rbp-42]
mov        rcx, qword [rbp-32]
movsxd     rdi, dword [rbp-40]
mov        byte [rcx+rdi], al
mov        eax, dword [rbp-40]
add        eax, 0x1
mov        dword [rbp-40], eax
jmp        loc_1004c769b

loc_1004c76f5:
mov        eax, dword [rbp-36]                     ; CODE XREF=__ZN8Cencrypt7EncryptEiPci+65
mov        dword [rbp-4], eax

loc_1004c76fb:
mov        eax, dword [rbp-4]                      ; CODE XREF=__ZN8Cencrypt7EncryptEiPci+47
add        rsp, 0x40
pop        rbp
ret


_Cencrypt_Decrypt:        ; Cencrypt::Decrypt(int, char*, int)
push       rbp                                         ; CODE XREF=sub_1002a0e00+29, __ZN11SUPERSOUND212decrypt_fileEPKcS1_+211
mov        rbp, rsp
sub        rsp, 0x20
mov        qword [rbp-8], rdi
mov        dword [rbp-12], esi
mov        qword [rbp-24], rdx
mov        dword [rbp-28], ecx
mov        rdi, qword [rbp-8]                      ; argument #1 for method __ZN8Cencrypt7EncryptEiPci
mov        esi, dword [rbp-12]                      ; argument #2 for method __ZN8Cencrypt7EncryptEiPci
mov        rdx, qword [rbp-24]                     ; argument #3 for method __ZN8Cencrypt7EncryptEiPci
mov        ecx, dword [rbp-28]
call       _Cencrypt_Encrypt                  ; Cencrypt::Encrypt(int, char*, int)
add        rsp, 0x20
pop        rbp
ret


section .data
__ZL13g_p_map_space:
dq         0xc8c0f2de73324877
db  0x95 ; '.'
db  0xec ; '.'
db  0x30 ; '0'
db  0xb2 ; '.'
db  0x51 ; 'Q'
db  0xc3 ; '.'
db  0xe1 ; '.'
db  0xa0 ; '.'
db  0x9e ; '.'
db  0xe6 ; '.'
db  0x9d ; '.'
db  0xcf ; '.'
db  0xfa ; '.'
db  0x7f ; '.'
db  0x14 ; '.'
db  0xd1 ; '.'
db  0xce ; '.'
db  0xb8 ; '.'
db  0xdc ; '.'
db  0xc3 ; '.'
db  0x4a ; 'J'
db  0x67 ; 'g'
db  0x93 ; '.'
db  0xd6 ; '.'
db  0x28 ; '('
db  0xc2 ; '.'
db  0x91 ; '.'
db  0x70 ; 'p'
db  0xca ; '.'
db  0x8d ; '.'
db  0xa2 ; '.'
db  0xa4 ; '.'
db  0xf0 ; '.'
db  0x08 ; '.'
db  0x61 ; 'a'
db  0x90 ; '.'
db  0x7e ; '~'
db  0x6f ; 'o'
db  0xa2 ; '.'
db  0xe0 ; '.'
db  0xeb ; '.'
db  0xae ; '.'
db  0x3e ; '>'
db  0xb6 ; '.'
db  0x67 ; 'g'
db  0xc7 ; '.'
db  0x92 ; '.'
db  0xf4 ; '.'
db  0x91 ; '.'
db  0xb5 ; '.'
db  0xf6 ; '.'
db  0x6c ; 'l'
db  0x5e ; '^'
db  0x84 ; '.'
db  0x40 ; '@'
db  0xf7 ; '.'
db  0xf3 ; '.'
db  0x1b ; '.'
db  0x02 ; '.'
db  0x7f ; '.'
db  0xd5 ; '.'
db  0xab ; '.'
db  0x41 ; 'A'
db  0x89 ; '.'
db  0x28 ; '('
db  0xf4 ; '.'
db  0x25 ; '%'
db  0xcc ; '.'
db  0x52 ; 'R'
db  0x11 ; '.'
db  0xad ; '.'
db  0x43 ; 'C'
db  0x68 ; 'h'
db  0xa6 ; '.'
db  0x41 ; 'A'
db  0x8b ; '.'
db  0x84 ; '.'
db  0xb5 ; '.'
db  0xff ; '.'
db  0x2c ; ','
db  0x92 ; '.'
db  0x4a ; 'J'
db  0x26 ; '&'
db  0xd8 ; '.'
db  0x47 ; 'G'
db  0x6a ; 'j'
db  0x7c ; '|'
db  0x95 ; '.'
db  0x61 ; 'a'
db  0xcc ; '.'
db  0xe6 ; '.'
db  0xcb ; '.'
db  0xbb ; '.'
db  0x3f ; '?'
db  0x47 ; 'G'
db  0x58 ; 'X'
db  0x89 ; '.'
db  0x75 ; 'u'
db  0xc3 ; '.'
db  0x75 ; 'u'
db  0xa1 ; '.'
db  0xd9 ; '.'
db  0xaf ; '.'
db  0xcc ; '.'
db  0x08 ; '.'
db  0x73 ; 's'
db  0x17 ; '.'
db  0xdc ; '.'
db  0xaa ; '.'
db  0x9a ; '.'
db  0xa2 ; '.'
db  0x16 ; '.'
db  0x41 ; 'A'
db  0xd8 ; '.'
db  0xa2 ; '.'
db  0x06 ; '.'
db  0xc6 ; '.'
db  0x8b ; '.'
db  0xfc ; '.'
db  0x66 ; 'f'
db  0x34 ; '4'
db  0x9f ; '.'
db  0xcf ; '.'
db  0x18 ; '.'
db  0x23 ; '#'
db  0xa0 ; '.'
db  0x0a ; '.'
db  0x74 ; 't'
db  0xe7 ; '.'
db  0x2b ; '+'
db  0x27 ; '''
db  0x70 ; 'p'
db  0x92 ; '.'
db  0xe9 ; '.'
db  0xaf ; '.'
db  0x37 ; '7'
db  0xe6 ; '.'
db  0x8c ; '.'
db  0xa7 ; '.'
db  0xbc ; '.'
db  0x62 ; 'b'
db  0x65 ; 'e'
db  0x9c ; '.'
db  0xc2 ; '.'
db  0x08 ; '.'
db  0xc9 ; '.'
db  0x88 ; '.'
db  0xb3 ; '.'
db  0xf3 ; '.'
db  0x43 ; 'C'
db  0xac ; '.'
db  0x74 ; 't'
db  0x2c ; ','
db  0x0f ; '.'
db  0xd4 ; '.'
db  0xaf ; '.'
db  0xa1 ; '.'
db  0xc3 ; '.'
db  0x01 ; '.'
db  0x64 ; 'd'
db  0x95 ; '.'
db  0x4e ; 'N'
db  0x48 ; 'H'
db  0x9f ; '.'
db  0xf4 ; '.'
db  0x35 ; '5'
db  0x78 ; 'x'
db  0x95 ; '.'
db  0x7a ; 'z'
db  0x39 ; '9'
db  0xd6 ; '.'
db  0x6a ; 'j'
db  0xa0 ; '.'
db  0x6d ; 'm'
db  0x40 ; '@'
db  0xe8 ; '.'
db  0x4f ; 'O'
db  0xa8 ; '.'
db  0xef ; '.'
db  0x11 ; '.'
db  0x1d ; '.'
db  0xf3 ; '.'
db  0x1b ; '.'
db  0x3f ; '?'
db  0x3f ; '?'
db  0x07 ; '.'
db  0xdd ; '.'
db  0x6f ; 'o'
db  0x5b ; '['
db  0x19 ; '.'
db  0x30 ; '0'
db  0x19 ; '.'
db  0xfb ; '.'
db  0xef ; '.'
db  0x0e ; '.'
db  0x37 ; '7'
db  0xf0 ; '.'
db  0x0e ; '.'
db  0xcd ; '.'
db  0x16 ; '.'
db  0x49 ; 'I'
db  0xfe ; '.'
db  0x53 ; 'S'
db  0x47 ; 'G'
db  0x13 ; '.'
db  0x1a ; '.'
db  0xbd ; '.'
db  0xa4 ; '.'
db  0xf1 ; '.'
db  0x40 ; '@'
db  0x19 ; '.'
db  0x60 ; '`'
db  0x0e ; '.'
db  0xed ; '.'
db  0x68 ; 'h'
db  0x09 ; '.'
db  0x06 ; '.'
db  0x5f ; '_'
db  0x4d ; 'M'
db  0xcf ; '.'
db  0x3d ; '='
db  0x1a ; '.'
db  0xfe ; '.'
db  0x20 ; ' '
db  0x77 ; 'w'
db  0xe4 ; '.'
db  0xd9 ; '.'
db  0xda ; '.'
db  0xf9 ; '.'
db  0xa4 ; '.'
db  0x2b ; '+'
db  0x76 ; 'v'
db  0x1c ; '.'
db  0x71 ; 'q'
db  0xdb ; '.'
db  0x00 ; '.'
db  0xbc ; '.'
db  0xfd ; '.'
db  0x0c ; '.'
db  0x6c ; 'l'
db  0xa5 ; '.'
db  0x47 ; 'G'
db  0xf7 ; '.'
db  0xf6 ; '.'
db  0x00 ; '.'
db  0x79 ; 'y'
db  0x4a ; 'J'
db  0x11 ; '.'
dq         0x4afffffec61c3c00
dq         0x46fffe004b000000
dq         0x0000000042e00000
dq         0x3fd6147ae147ae14
dq         0x4087180000000000
db  0x00 ; '.'
db  0x00 ; '.'
db  0x00 ; '.'
db  0x00 ; '.'
db  0x00 ; '.'
db  0x00 ; '.'
db  0x00 ; '.'
db  0x00 ; '.'
