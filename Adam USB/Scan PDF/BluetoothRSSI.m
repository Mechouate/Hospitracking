#import <Foundation/Foundation.h>
#import <IOBluetooth/IOBluetooth.h>

int width = 32; // display width in characters
int refresh = 33; // refresh rate milliseconds

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // only flush stdout when fflush(stdout) is called
        setvbuf(stdout, NULL, _IOFBF, BUFSIZ);
        
        IOBluetoothDevice *device;
        NSArray *devices = [IOBluetoothDevice pairedDevices];
        NSEnumerator *e;
        
        int lineNumber = 0;
        int halfwidth = width >> 1;
        while (true) {
            if(lineNumber > 0) {
                printf("\033[%dF", lineNumber); // ansi escape, n=lineNumber, move n lines up
                lineNumber = 0;
            }
            e = [devices objectEnumerator];
            while (device = [e nextObject]) {
                if ([device isConnected]) {
                    BluetoothHCIRSSIValue rssi = [device RSSI];
                    printf("\033[%dG", 0); // ansi escape, position 0, absolute horizontal move
                    if(rssi < -halfwidth) {
                        printf("<");
                    } else {
                        printf("[");
                    }
                    int tick = halfwidth + rssi;
                    for(int i = 0; i < width; i++) {
                        if(i == tick) {
                            printf("+");
                        } else if(i == halfwidth) {
                            printf("|");
                        } else {
                            printf("-");
                        }
                    }
                    if(rssi > halfwidth) {
                        printf(">");
                    } else {
                        printf("]");
                    }
                    lineNumber++;
                }
            }
            fflush(stdout);
            usleep(refresh * 1000);
        }
    }
    return 0;
}