#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdbool.h>
#include <stdlib.h>
#include <fcntl.h>

const int mxx_size = 5000;

void reverse(char arr[]) {
    int size = strlen(arr);
    for (int i = 0; i < size; ++i) {
        if (!((arr[i] >= 'a' && arr[i] <= 'z') || (arr[i] >= 'A' && arr[i] <= 'Z'))) {
            continue;
        }
        
        int prev = i;
        while (i != size - 1) {
            if (!((arr[i] >= 'a' && arr[i] <= 'z') || (arr[i] >= 'A' && arr[i] <= 'Z'))) {
                --i;
                break;
            }
            
            ++i;
        }
        
        
        printf("%d", prev);
        puts("W");
        printf("%d", i);
        
        for (int j = prev, cnt = 0; cnt < (i - prev + 1) / 2; ++j, ++cnt) {
            int buff = arr[j];
            arr[j] = arr[i - (j - prev)];
            arr[i - (j - prev)] = buff;
        }
    }
}

int main(int argc, char *argv[])
{
    if (argc != 3) {
        printf("Run the program with 2 arguments: 1) name for input file. 2) name for output file.");
        return 0;
    }
    
    char buff[mxx_size];
    memset(buff, '\0', sizeof(buff));
    
    const char *pipe1 = "pipe1.fifo";
    const char *pipe2 = "pipe2.fifo";
    
    int first, second, proc1, proc2, size;
    
    mknod(pipe1, S_IFIFO | 0666, 0);
    mknod(pipe2, S_IFIFO | 0666, 0);
    
    // Создаем 2 первых процесса.
    proc1 = fork();
    if (proc1 < 0) {
        printf("Creation child-procces error.");
        exit(-1);
    } else if (proc1 > 0) { // Вход для первого процесса.
    // Закрываем канал на чтение.
        int input_file = open(argv[1], O_RDONLY, 0666); // открываем наш input файл.
        if (input_file < 0) {
            printf("Reading file error.");
            exit(-1);
        }
        
        read(input_file, buff, mxx_size); // считываем данные в буффер.
        
        if (close(input_file) < 0) {
            printf("Error with closing file.");
        }
        
        first = open(pipe1, O_WRONLY);
        if (first < 0) {
            printf("Error with opening FIFO for writing");
            exit(-1);
        }
        
        // Записываем в первый канал.
        size = write(first, buff, mxx_size);
        if (size != mxx_size) {
            printf("Error with writing data to pipe.");
            exit(-1);
        }
        
        // Закрываем канал после использования.
        if (close(first) < 0) {
            printf("Cant close writing descriptor of FIFO.");
            exit(-1);
        }
    } else { // второй процесс.
        // Создаем 3-ий процесс на основе второго.
        int proc3 = fork();
        
        if (proc3 < 0) {
            printf("Creation child-procces error.");
            exit(-1);
        } else if (proc3 > 0) {
            first = open(pipe1, O_RDONLY);
            if (first < 0) {
                printf("Error with opening FIFO for reading.");
                exit(-1);
            }
            
            size = read(first, buff, mxx_size); // считываем данные через первый канал.
            if (size < 0) {
                printf("Error with reading data from pipe.");
                exit(-1);
            }
            
            // Вызов функции, решающей задачу.
            reverse(buff);
            
            if (close(first) < 0) {
                printf("Cant close reading descriptor of pipe.");
                exit(-1);
            }
            
            second = open(pipe2, O_WRONLY);
            if (second < 0) {
                printf("Erorr with opening FIFO for writing");
                exit(-1);
            }
            
            size = write(second, buff, mxx_size); // запись во второй канал.
            if (size != mxx_size) {
                printf("Error with writing data to FIFO.");
                exit(-1);
            }
            
            if (close(second) < 0) {
                printf("Cant close writing descriptor of FIFO.");
                exit(-1);
            }
        } else { // 3 процесс.
            second = open(pipe2, O_RDONLY);
            if (second < 0) {
                printf("Error with opening FIFO for reading.");
                exit(-1);
            }
            
            size = read(second, buff, mxx_size); // получаем данные из второго канала.
            if (size < 0) {
                printf("Error with reading data from pipe.");
                exit(-1);
            }
            
            if (close(second) < 0) {
                printf("Cant close reading descriptor of pipe.");
                exit(-1);   
            }
            
            int output = open(argv[2], O_WRONLY | O_CREAT, 0666);
            if (output < 0) {
                printf("Cant open output file.");
                exit(-1);
            }
            
            // Записываем полученные данные.
            size = write(output, buff, strlen(buff));
            if (size != strlen(buff)) {
                printf("Erorr with writing data in output file, not enough size.");
                exit(-1);
            }
            
            if (close(output) < 0) {
                printf("Error with closing file.");
            }
        }
    }
    
    buff[mxx_size] = '\0';
    
    return 0;
}

