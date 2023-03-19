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
        int prev = i;
        while (true) {
            if ((arr[i] < 'a' || arr[i] > 'z') && (arr[i] < 'A' && arr[i] > 'Z')) {
                break;
            }
            
            ++i;
        }
        
        for (int j = prev; j <= i; ++j) {
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
    for (int i = 0; i < mxx_size; ++i) {
        buff[i] = 0;
    }
    
    int first[2], second[2], proc1, proc2, size;
    // Создаем 1 и 2 каналы соответственно.
    if (pipe(first) == -1 || pipe(second) == -1) {
        printf("Openning pipe error.");
        exit(-1);
    }
    
    
    
    // Создаем 2 первых процесса.
    proc1 = fork();
    if (proc1 < 0) {
        printf("Creation child-procces error.");
        exit(-1);
    } else if (proc1 > 0) { // Вход для первого процесса.
    // Закрываем канал на чтение.
        if (close(first[0]) < 0) {
            printf("Cant close reading descriptor of pipe.");
            exit(-1);
        }
        
        int input_file = open(argv[1], O_RDONLY, 0666);
        if (input_file < 0) {
            printf("Reading file error.");
            exit(-1);
        }
        
        read(input_file, buff, mxx_size);
        
        if (close(input_file) < 0) {
            printf("Error with closing file.");
        }
        
        // Записываем в первый канал.
        size = write(first[1], buff, mxx_size);
        if (size != mxx_size) {
            printf("Error with writing data to pipe.");
            exit(-1);
        }
        
        // Закрываем канал после использования.
        if (close(first[1]) < 0) {
            printf("Cant close writing descriptor of pipe.");
            exit(-1);
        }
    } else {
        // Создаем 3-ий процесс на основе второго.
        int proc3 = fork();
        
        if (proc3 < 0) {
            printf("Creation child-procces error.");
            exit(-1);
        } else if (proc3 > 0) {
            if (close(first[1]) < 0) {
                printf("Cant close writing descriptor of pipe.");
                exit(-1);
            }
            
            size = read(first[0], buff, mxx_size);
            if (size < 0) {
                printf("Error with reading data from pipe.");
                exit(-1);
            }
            
            // Вызов функции, решающей задачу.
            reverse(buff);
            
            if (close(first[0]) < 0) {
                printf("Cant close reading descriptor of pipe.");
                exit(-1);
            }
            
            size = write(second[1], buff, mxx_size);
            if (size != mxx_size) {
                printf("Error with writing data to pipe.");
                exit(-1);
            }
            
            if (close(second[1]) < 0) {
                printf("Cant close writing descriptor of pipe.");
                exit(-1);
            }
        } else { // 3 процесс.
            if (close(second[1]) < 0) {
                printf("Cant close writing descriptor of pipe.");
                exit(-1);   
            }
            
            size = read(second[0], buff, mxx_size);
            if (size < 0) {
                printf("Error with reading data from pipe.");
                exit(-1);
            }
            
            if (close(second[0]) < 0) {
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

