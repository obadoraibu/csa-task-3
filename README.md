# Архитектура вычислительных систем - ИДЗ 2
# Завьялов Егор БПИ-217 Вариант 20

## Структура:
[Ассемблерный код без модификаций](asm)

[Ассемблерный код с модификациями](asm-mod)

[Код на Си](c-source)

[Тесты](tests)



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
>![asm1](img/asm1.png)
>![res1](img/res1.png)
>![asm2](img/asm2.png)
>![res2](img/res2.png)
* Ввод через аргументы командной строки реализован
* Локальные переменные использованы
* Комментарии в [ассемблерный код](asm) добавлены 
* Возможность ввода данных через текстовые файлы добавлена

## Рефакторинг
*     Удален endbr64
*     Удален код сгенерированный gcc после ret
*     Оптимизировано использование регистров процессора (r12 := input*, r13 := output*)

Тесты модифицированного кода:
>![asm_mod1](img/asm_mod1.png)
>![res1](img/res1.png)
>![asm_mod2](img/asm_mod2.png)
>![res2](img/res2.png)
