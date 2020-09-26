#include <stdio.h>
#include <stdlib.h>
int Cencrypt_mapL(unsigned long _class_ptr, int x);
int Cencrypt_Encrypt(unsigned long _class_ptr, int offset, unsigned char * data, int len);
int Cencrypt_Decrypt(unsigned long _class_ptr, int offset, unsigned char * data, int len);
int main(int argc, const char * argv[]) {
    if (argc != 3) {
        printf("usage: in file, out file\n");
        return 1;
    }
    FILE * fp = fopen(argv[1], "rb");
    FILE * fout = fopen(argv[2], "wb");
    if (fp == 0 || fout == 0) {
        printf("file out exist\n");
        return 1;
    }
    const int padding = 0x2000;

    int offset = 0;
    while (1) {
        fseek(fp, offset, SEEK_SET);
        unsigned char * buffer = calloc(padding, 1);
        size_t read_bytes = fread(buffer, 1, padding, fp);

        Cencrypt_Decrypt(0, offset, buffer, read_bytes);

        fseek(fout, offset, SEEK_SET);
        fwrite(buffer, 1, read_bytes, fout);

        free(buffer);
        offset += read_bytes;

        if (read_bytes < padding) {
            break;
        }
    }

    fclose(fp);

    return 0;
}
