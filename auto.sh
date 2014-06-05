#!/bin/bash -
#Just because the flex will print the source code in order to locate the error.
#So I just write this script to make sure that both the error condition and the
#right condition work. 

if [ $# != 1 ]; then
    echo "usage $0 target_name"
    echo "    example: $0 test1"
    echo "    (suppose you have test1.c,the script will generate test1)"
    exit 1;
fi
if [ -e $1.c ]; then
    rm -f $1 $1.o $1.asm
    ./parser < $1.c > $1.asm
    if [ $? -eq 0 ]; then
        cat $1.asm | grep "syntax\ error"> /dev/null
        if [ $? -eq 0 ]; then
            echo "--------------------------------------------"
            cat $1.asm
            echo "--------------------------------------------"
        else
            #sed '/section/,$' $1.asm > $1.tmp
            #cat /dev/null > $1.asm
            #cat $1.tmp >> $1.asm
            #rm -f $1.tmp
            #this works.
            cat $1.asm | grep section > /dev/null
            if [ $? -eq 0 ]; then
                grep -A 10240 section $1.asm > $1.tmp
                mv $1.tmp $1.asm 
                nasm -f elf ./$1.asm

                if [ $? -eq 0 ]; then
                    ld -s -o ./$1 ./$1.o | grep ld
                    if [ $? -eq 1 ]; then
                        echo "done!now you can run $1 just use ./$1"
                    fi
                fi
            else 
                echo "ERROR:unhandle error."
            fi
        fi
    fi
else
    echo "ERROR:$1.c not exist"
fi
