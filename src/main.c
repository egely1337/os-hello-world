void print(const char* txt, unsigned int x,unsigned int y){
    unsigned char* ptr = txt;
    unsigned char* txtModePtr = (unsigned char*)0xB8000 + x + y;
    while(*ptr != 0){
        *txtModePtr = *ptr;
        ptr++;
        txtModePtr = txtModePtr + 2;
    }
}

extern int main(){
    print("Hello world from hello world OS!",20,20);
    return 0;
}