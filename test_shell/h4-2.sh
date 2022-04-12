#!/usr/bin/env bash

#用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：
#- 2014世界杯运动员数据
  #- 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员**数量**、**百分比**
  #- 统计不同场上位置的球员数量、百分比
  #- 名字最长的球员是谁？名字最短的球员是谁？
  #- 年龄最大的球员是谁？年龄最小的球员是谁？

file="worldcupplayerinfo.tsv"

function help {
    echo "-c                 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比"
    echo "-n                 统计不同场上位置的球员数量、百分比"
    echo "-l                 名字最长的球员是谁？名字最短的球员是谁？"
    echo "-a                 年龄最大的球员是谁？年龄最小的球员是谁？"
    echo "-h                 显示本脚本的帮助文档"
}

# 1.统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比
function count_age() {
    awk -F "\t" 'BEGIN {a=0; b=0; c=0;}
        $6!="Age" {
            if($6>=0&&$6<20) {a++;}
            else if($6>=20&&$6<=30) {b++;}
            else {c++;}
        }
        END {
            sum=a+b+c;
            printf("Age\tCount\tPercentage\n");
            printf("<20\t%d\t%f%%\n",a,a*100.0/sum);
            printf("[20,30]\t%d\t%f%%\n",b,b*100.0/sum);
            printf(">30\t%d\t%f%%\n",c,c*100.0/sum);
        }'  "$file"
}

# 2.统计不同场上位置的球员数量、百分比
function count_num() {
    awk -F "\t" '
        BEGIN {sum=0}
        $5!="Position" {
            pos[$5]++;
            sum++;
        }
        END {
            printf("    Position\tCount\tPercentage\n");
            for(i in pos) {
                printf("amount of %-15s%5d\t\tproportion: %.3f\n",i,pos[i],pos[i]/sum);
            }
        }'  "$file"
}

# 3.名字最长的球员是谁？名字最短的球员是谁？
function  name_length(){
    awk -F "\t" '
        BEGIN {max=-1; min=999;}
        $9!="Player" {
            len=length($9);
            names[$9]=len;
            max=len>max?len:max;
            min=len<min?len:min;
        }
        END {
            for(i in names) {
                if(names[i]==max) {
                    printf("The longest name is %s.\n", i);
                } else  if(names[i]==min) {
                    printf("The shortest name is %s.\n", i);
                }
            }
        }'  "$file"
}

# 4.年龄最大的球员是谁？年龄最小的球员是谁？(考虑并列)
function age_extrem() {
    awk -F "\t" '
        BEGIN {max=-1; min=999;}
        $6!="Age"  {
            age=$6;
            names[$9]=age;
            max=age>max?age:max;
            min=age<min?age:min;
        }
        END {
            printf("The oldest age is %d, his name is\t.", max);
            for(i in names) {
                if(names[i]==max) { printf("%s\n", i); }
            }
            printf("The youngest age is %d, his name is\t.", min);
            for(i in names) {
                if(names[i]==min) { printf("%s\n", i); }
            }
        }'  "$file"
}

while true;do
    case "$1" in
        "-c")
            count_age
            exit 0
            ;;
        "-n")
            count_num
            exit 0
            ;;
        "-l")
            name_length
            exit 0
            ;;
        "-a")
            age_extrem
            exit 0
            ;;
        "-h")
            help
            exit 0
            ;;
    esac
    help
    exit 0
done