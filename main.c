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

    if (fp == 0) {
        printf("input file not exist\n");
        return 1;
    }
    if (fout == 0) {
        printf("failed to open notput file\n");
        return 1;
    }

    const int buffer_size = 0x2000;
    unsigned char * buffer = malloc(buffer_size);
    int offset = 0;

    while (1) {
        fseek(fp, offset, SEEK_SET);
        size_t read_bytes = fread(buffer, 1, buffer_size, fp);

        Cencrypt_Decrypt(0, offset, buffer, read_bytes);

        fseek(fout, offset, SEEK_SET);
        fwrite(buffer, 1, read_bytes, fout);

        offset += read_bytes;

        if (read_bytes < buffer_size) {
            break;
        }
    }

    free(buffer);
    fclose(fp);
    fclose(fout);

    return 0;
}
