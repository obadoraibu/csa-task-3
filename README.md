# Архитектура вычислительных систем - ИДЗ 3
# Завьялов Егор БПИ-217 Вариант 20

## Структура:
[Ассемблерный код без модификаций](asm)

[Ассемблерный код с модификациями](asm-mod)

[Код на Си](c-source)



## Компиляция кода на Си:
```
gcc main.c -c -o main.o
gcc logic.c -c -o logic.o -lm
gcc main.o logic.o -o out -lm
```
## Компиляция кода на Ассемблере:
```
gcc main.s -c -o main.o
gcc logic.s -c -o logic.o -lm
gcc main.o logic.o -o out -lm
```
## Запуск:
```
./out path_to_input.txt path_to_output.txt
```
# Отчёт

[Код на Си](c-source) - 2 единицы компиляции

Макросы в [ассемблерном коде](asm) убраны с помощью аргументов командной строки:
```
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./main.c \
    -S -o ./main.s
```
```
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./logic.c \
    -S -o ./logic.s
```
Код на ассемблере отдельно скомпилирован и проходит тесты:
>![asm1](img_asm/input1.png)
>![res2](img_asm/cmd1.png)
>![asm2](img_asm/out1.png)
>![res1](img_asm/input2.png)
>![asm1](img_asm/cmd2.png)
>![res2](img_asm/out2.png)
>![asm2](img_asm/input3.png)
>![res1](img_asm/cmd3.png)
>![res2](img_asm/out3.png)
* Ввод через аргументы командной строки реализован(пути к файлам)
* Локальные переменные использованы
* Комментарии в [ассемблерный код](asm) добавлены 
* Возможность ввода данных через текстовые файлы добавлена

## Рефакторинг
*     Удалены endbr64
*     Оптимизировано использование регистров процессора (r12 := input*, r13 := output*)

Тесты модифицированного кода:
>![asm1](img_asm_mod/input1.png)
>![res2](img_asm_mod/cmd1.png)
>![asm2](img_asm_mod/out1.png)
>![res1](img_asm_mod/input2.png)
>![asm1](img_asm_mod/cmd2.png)
>![res2](img_asm_mod/out2.png)
>![asm2](img_asm_mod/input3.png)
>![res1](img_asm_mod/cmd3.png)
>![res2](img_asm_mod/out3.png)
