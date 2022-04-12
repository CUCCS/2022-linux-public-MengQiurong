#!/usr/bin/env bash

function help {
    echo "========图片处理脚本的帮助文档========"
    echo "
    脚本支持：
    1.命令行参数方式使用不同功能
    2.对指定目录下所有支持格式的图片文件进行批处理指定目录进行批处理
    3.以下常见图片批处理功能的单独使用或组合使用
        ①对jpeg格式图片进行图片质量压缩
        ②对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
        ③对图片批量添加自定义文本水印
        ④批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）
        ⑥将png/svg图片统一转换为jpg格式；
    -q Q               对jpeg格式图片进行图片质量因子为Q的压缩
    -d D               对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩成D分辨率
    -w fontsize watermark_text  对图片批量添加自定义文本水印
    -p text            批量重命名，统一添加文件名前缀，不影响原始文件扩展名
    -s text            批量重命名，统一添加文件名后缀，不影响原始文件扩展名
    -t                 将png/svg图片统一转换为jpg格式图片
    -h                 显示本脚本的帮助文档"
}


#①支持对jpeg格式图片进行图片质量压缩
#convert filename1 -quality 50 filename2
function Picture_quality_compression(){
    Q=$1 # 质量因子
    for i in *;do
        type=${i##*.} # 获取文件类型 （删除最后一个.及左边的全部字符）
        if [[  ${type} != "jpeg" ]]; then continue; fi;
        convert "${i}" -quality "${Q}" "${i}"
        echo "Compressing ${i} -- down."
    done
    echo "========图片质量压缩完成========"
}

#②支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
#convert filename1 -resize 50% filename2
function Compression_resolution(){
    D=$1
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        convert "${i}" -resize "${D}" "${i}"
        echo "Proportional compressing ${i} is complete."
    done
    echo "=========分辨率压缩完成========="
}

#③支持对图片批量添加自定义文本水印
# convert filename1 -pointsize 50 -fill black -gravity center -draw "text 10,10 'Works like magick' " filename2
function add_watermarking(){
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        convert "${i}" -pointsize "$1"  -draw "text 0,20 '$2'" "${i}"
        echo "Watermarking ${i} with $2 is complete."
    done
    echo "==========添加水印完成=========="
    return
}

#④支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）
#1.批量重命名，统一添加文件名前缀，不影响原始文件扩展名
# mv filename1 filename2
function add_prefix(){
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        mv "${i}" "$1""${i}"
        echo "${i} is prefixed as $1${i} "
    done
    echo "=========批量重命名加前缀完成=========="
}

#2.批量重命名，统一添加文件名后缀，不影响原始文件扩展名
# mv filename1 filename2
function add_suffix(){
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "jpg" && ${type} != "jpeg" && ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        newname=${i%.*}$1"."${type}
        mv "${i}" "${newname}"
        echo "${i} is suffixed as ${newname} "
    done
    echo "=========批量重命名加后缀完成=========="

}

#支持将png/svg图片统一转换为jpg格式图片
# convert xxx.png xxx.jpg
function trans_jpg(){
    for i in *;do
        type=${i##*.}
        if [[ ${type} != "png" && ${type} != "svg" ]]; then continue; fi;
        newfile=${i%.*}".jpg"
        convert "${i}" "${newfile}"
   	echo "Transform ${i} to ${newfile}is complete."
    done
    echo "==========转换格式完成=========="
}

# 以下实现命令行参数方式使用不同功能
while true;do
case "$1" in
    "-q")
        Picture_quality_compression "$2"
        exit 0
        ;;
    "-d")
        Compression_resolution "$2"
        exit 0
        ;;
    "-w")
        add_watermarking "$2" "$3"
        exit 0
        ;;
    "-p")
        add_prefix "$2"
        exit 0
        ;;
    "-s")
        add_suffix "$2"
        exit 0
        ;;
    "-t")
        trans_jpg
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
