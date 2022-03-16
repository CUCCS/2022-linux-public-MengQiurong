### H2

#### 20网安一班 蒙秋蓉 2020212063036

#### 实验环境

- 在[asciinema](https://asciinema.org/)注册一个账号，并在本地安装配置好asciinema

  ①注册asciinema账号：

  ![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\注册asciinema账号.png)

  ②注册好了(后来改了个名字）:![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\注册好了.png)

  ③本地机安装asciinema——**sudo apt install asciinema**：

  ![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\安装asciinema.png)

  ④进行**asciinema auth**，点进它给的链接。![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\打开它给的链接.png)

- 确保本地已经完成**asciinema auth**，并在[asciinema](https://asciinema.org/)成功关联了本地账号和在线账号

  ⑤在阿里云centos上安装asciinema时报错，网上搜索到解决办法：**sudo yum install asciinema** ![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\网上搜的apt报错解决办法.png)

  ⑥阿里云用apt下载用不了只能用yum:![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\阿里云用apt下载用不了只能用yum.png)

  ⑦开始录制和结束录制:![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\开始录制和结束录制.png)

  ⑧按了enter后，保存到asciinema:![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\按了enter后，保存到asciinema.org.png)

  ⑨保存后在asciinema.org上自动生成录制:![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\添加本地虚拟机录制视频.png)

  ⑩阿里云进行录制，按了enter后自动保存:![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\阿里云进行录制，按了enter后自动保存.png)

  ①①保存后在asciinema.org上自动生成录制:![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\保存后在asciinema.org上自动生成录制.png)

  ①②保存的阿里云录制视频：![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\保存的录制视频.png)

  ①③分享页面，保存链接:![](C:\Users\17124\Desktop\大二下作业\Linux\H2\1.asciinema\分享页面，保存链接.png)

- 在自己的github仓库上新建markdown格式纯文本文件附上asciinema的分享URL

分享链接：https://asciinema.org/a/5Ou61b3B26dAjBMyjwG2rTMPy



参考资料：[asciinema:终端操作录制神器 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/261744578)



#### 实验内容

- 使用表格方式记录至少 2 个不同 Linux 发行版本上以下信息的获取方法，使用 [asciinema](https://asciinema.org/) 录屏方式**「分段」**记录相关信息的获取过程和结果：

  - 以下用的仅两个发行版本：本地虚拟机Ubuntu和阿里云虚拟机centOS

    

  - 【软件包管理】在目标发行版上安装 `tmux` 和 `tshark` ；查看这 2 个软件被安装到哪些路径；卸载 `tshark` ；验证 `tshark` 卸载结果。

    | 操作                               | Ubuntu                                                       | Centos                                                       |
    | :--------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
    | 1.在目标发行版上安装 `tmux`        | **sudo yum install tmux**                                    | **sudo apt install tmux**                                    |
    | 2.在目标发行版上安装  `tshark`     | ①**yum install -y epel-release**<br/>②**yum install -y wireshark** | **sudo add-apt-repository ppa:wireshark-dev/stable<br/>sudo apt update<br/>sudo apt install wireshark<br/>sudo apt install tshark** |
    | 3.查看这 2 个软件被安装到哪些路径  | **whereis tmux<br/>whereis tshark**                          | **whereis tmux**<br/>**whereis tshark**                      |
    | 4.通过 tshark -v证明tshark安装成功 | **tshark -v**                                                | **tshark -v**                                                |
    | 5.卸载tshark                       | whereis tshark后cd到tshark的目录下，**rm tshark**，直接删除安装包。（试过yum remove tshark等一系列命令都不能直接删除，只能用这个办法可以成功删除） | **sudo apt-get remove --purge tshark**                       |
    | 6.验证tshark删除结果               | **tshark -v**显示bash: /usr/sbin/tshark: No such file or directory<br/>**ls**发现没有tshark文件了<br/> | **tshark -v**<br />**whereis tshark**                        |

    - 本机Ubuntu录制链接：https://asciinema.org/a/QWCby99jwyIPcnZc9sX57m9HI

    - 阿里云centos录制链接：https://asciinema.org/a/OHlbQQT4HnY4BqQfOhUlbfLW8

      **一个报错：**

      删除不了tshark——我自己想的暴力办法：**whereis tshark**后cd到tshark的目录下，**rm tshark**，直接删除安装包。（试过yum remove tshark等一系列命令都不能直接删除，只能用这个办法可以成功删除）

      ![](C:\Users\17124\Desktop\大二下作业\Linux\H2\报错\删除不了tshark.png)
      
      
      
      参考资料：①[(44条消息) Linux之tshark抓包工具安装和使用_月生的静心苑-CSDN博客_linux 安装tshark](https://blog.csdn.net/carefree2005/article/details/122131633?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2~default~CTRLIST~Rate-1.pc_relevant_antiscanv2&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~CTRLIST~Rate-1.pc_relevant_antiscanv2&utm_relevant_index=2)<br/>②[(44条消息) Ubuntu 16.04安装tshark 3.x_jmhIcoding-CSDN博客_bpe解码](https://blog.csdn.net/jmh1996/article/details/120040994)
      
      

  - 【文件管理】复制以下shell代码到终端运行，在目标 Linux 发行版系统中构造测试数据集，然后回答以下问题：
  
    - 找到 `/tmp` 目录及其所有子目录下，文件名包含 `666` 的所有文件

    - 找到 `/tmp` 目录及其所有子目录下，文件内容包含 `666` 的所有文件

      ```cmd
      cd /tmp && for i in $(seq 0 1024);do dir="test-$RANDOM";mkdir "$dir";echo "$RANDOM" > "$dir/$dir-$RANDOM";done
      ```
  
    - 本机Ubuntu录制链接：https://asciinema.org/a/oKylU0baKnXnWXNv2Rci4c4aC
  
    - 阿里云centos录制链接：https://asciinema.org/a/CBNMKX8cGxI6whtHRNiOWUBru
  
      | 操作                                                         | Ubuntu                             | Centos                             |
      | :----------------------------------------------------------- | ---------------------------------- | ---------------------------------- |
      | 1.找到 `/tmp` 目录及其所有子目录下，文件名包含 `666` 的所有文件 | **find . -name "*666*"**           | **find . -name "*666*"**           |
      | 2.找到 `/tmp` 目录及其所有子目录下，文件内容包含 `666` 的所有文件find . | **find . \| xargs grep -ri "666"** | **find . \| xargs grep -ri "666"** |

      ps:上面1的代码应为

      ```cmd
      find . -name "*666*"
      ```

      参考资料：[Linux 查找当前目录下 包含特定字符串 的所有文件 - 龙凌云端 - 博客园 (cnblogs.com)](https://www.cnblogs.com/miracle-luna/p/11037614.html)
  
      
  
  - 【文件压缩与解压缩】练习课件中 [文件压缩与解压缩](https://c4pr1c3.github.io/LinuxSysAdmin/chap0x02.md.html#/12/1) 一节**所有**提到的压缩与解压缩命令的使用方法
  
    |                               | Ubuntu                                                       | 操作链接                                          | centOS                                                       | 操作链接                                          | 参考资料                                                     |
    | ----------------------------- | ------------------------------------------------------------ | ------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------- | ------------------------------------------------------------ |
    | 1.gzip                        | 压缩：gzip+文件名<br/>解压：gzip -d +文件名<br/>（要在当前文件目录下操作） | https://asciinema.org/a/XlsV1OWsqEftC3a6oKls8SOBF | 压缩：gzip+文件名<br/>解压：gzip -d +文件名<br/>（要在当前文件目录下操作） | https://asciinema.org/a/kwacwVRacA4gZyyNf88IheD2B | [Linux基础命令---gzip - 一生有你llx - 博客园 (cnblogs.com)](https://www.cnblogs.com/wj78080458/p/10062245.html) |
    | 2.bzip2                       | 压缩：bzip2+文件名<br/>解压：bzip2 -d +文件名（要带.bz2）<br/>（要在当前文件目录下操作） | https://asciinema.org/a/3kA8OSywscP8FQ9TxC0jbxBTz | 要先安装bzip2：①yum search bzip2<br/>②yum -y install bzip2-devel.x86_64<br/>压缩：bzip2+文件名<br/>解压：bzip2 -d +文件名（要带.bz2）<br/>（要在当前文件目录下操作） | https://asciinema.org/a/SVu263FNn6Fm9KR7u96cB9B9f | [linux基础命令---bzip2 - 一生有你llx - 博客园 (cnblogs.com)](https://www.cnblogs.com/wj78080458/p/10062068.html) |
    | 3.zip                         | 要先安装zip：sudo apt install zip<br/>压缩：zip+（-m）+压缩文件名+被压缩的文件名（-m会删除原文件，不加则不删除）<br/>解压：unzip  +压缩文件名（要带.zip）<br/> | https://asciinema.org/a/15szfjSMRP6F9XunZ0pOYrHoI | 首先，我们可以使用**yum list zip unzip**查看得知CentOS7的官方镜像是自带zip，unzip。安装命令：**yum install -y unzip zip**。<br/>压缩：zip+（-m）+压缩文件名+被压缩的文件名（-m会删除原文件，不加则不删除）<br/>解压：unzip  +压缩文件名（要带.zip） | https://asciinema.org/a/ueciYRHyupmHbOdwBLUA5OfoM | [(44条消息) CentOS7下安装和使用zip/unzip_小江今天学习了嘛的博客-CSDN博客_centos 安装zip](https://blog.csdn.net/qq_41142992/article/details/100276930) |
    | 4.tar                         | 要先安装tar：sudo apt install tar<br/>压缩：tar -cvf +压缩文件名+被压缩的文件名<br/>解压：tar  -xvf +压缩文件名（要带.zip）<br/> | https://asciinema.org/a/hkMJaPjyop8dHrr5dguIvz5KV | 压缩：tar -cvf +压缩文件名+被压缩的文件名<br/>解压：tar  -xvf +压缩文件名（要带.zip） | https://asciinema.org/a/uqb7kbFo9V2MuQIaNByc9x0xi | [linux tar文件解压 - 一谦的视界 - 博客园 (cnblogs.com)](https://www.cnblogs.com/jym-sunshine/p/5312835.html) |
    | 5.7z（p7zip）                 | 要先安装7z：**sudo apt-get install p7zip**<br/>压缩（目录下的文件压缩到一个.7z文件下）：**7za a -t7z test.7z**（压缩后的文件名）<br/>解压：**7za X test.7z**（压缩文件名）<br/> | https://asciinema.org/a/LFL3RkuN4U4OKQEbvRSyri99i | 要先安装7z：**sudo yum install p7zip**<br/>压缩（目录下的文件压缩到一个.7z文件下）：**7za a -t7z test.7z**（压缩后的文件名）<br/>解压：**7za X test.7z**（压缩文件名）<br/> | https://asciinema.org/a/yeFttd8CRygvEzLGXKLMPeP2S | [P7ZIP－Linux 中的 7-Zip · LinuxTOY](https://linuxtoy.org/archives/p7zip.html#:~:text=P7ZIP－Linux 中的 7-Zip · LinuxTOY 7-Zip 是一种高压缩比存档格式 7z,install p7zip 进行安装。 P7ZIP 的使用 创建压缩包：7za a …) |
    | 6.rar（p7zip-rar/unrar-free） | 要先安装rar和unrar：**sudo apt install rar**<br/>**sudo apt install unrar**<br/>压缩：**rar a qr.rar qr0307**（被压缩的文件名）<br/>解压：**unrar e  qr.rar**（压缩文件名）<br/> | https://asciinema.org/a/cQSCN7CTl9T43ew7cgR44xq7o | 要先安装rar和unrar：**wget --no-check-certificate https://www.rarlab.com/rar/rarlinux-x64-5.9.1.tar.gz **<br/>**tar -zxvf rarlinux-x64-5.9.1.tar.gz**<br/> **cd rar**<br/>**sudo cp -v rar unrar /usr/local/bin/**<br/>**sudo apt install unrar**<br/>压缩：**rar a qr.rar qr（被压缩的文件名）<br/>解压：**unrar e  qr.rar**（压缩文件名）<br/> | https://asciinema.org/a/XisMvUoA6DP2o1IDqPwbwswfl | ①[Linux中如何安装RAR - findumars - 博客园 (cnblogs.com)](https://www.cnblogs.com/findumars/p/8244997.html)<br/>②[CentOS 7 安装rar解压rar - 简书 (jianshu.com)](https://www.jianshu.com/p/8199d21f74fe)<br/>③[(44条消息) wget报错_liuqiangaliuv的博客-CSDN博客_wget报错](https://blog.csdn.net/liuqiangaliuv/article/details/90116046) |
  
    
  
  - 【跟练】 [子进程管理实验](https://asciinema.org/a/f3ux5ogwbxwo2q0wxxd0hmn54)
  
    - 本地机跟练录制链接：https://asciinema.org/a/H8rjVzVM85zZehUUQ8UNp2Svm
    - 阿里云跟练录制链接：https://asciinema.org/a/03qQidVwy3bSGvg9tnDSaxifI
  
  - 【硬件信息获取】目标系统的 CPU、内存大小、硬盘数量与硬盘容量
  
    - |                  | Ubuntu                                             | 录制链接                       | centOS                                                       | 录制链接                       | 参考链接                                                     |
      | ---------------- | -------------------------------------------------- | ------------------------------ | ------------------------------------------------------------ | ------------------------------ | ------------------------------------------------------------ |
      | 1.查看cpu型号    | **cat /proc/cpuinfo \| grep 'model name' \| uniq** | https://asciinema.org/a/477102 | **cat /proc/cpuinfo \| grep 'model name' \| uniq**           | https://asciinema.org/a/477108 | [(44条消息) Linux下查看CPU型号,内存大小,硬盘空间的命令(详解)_zhangliao613的博客-CSDN博客_linux查看内存大小命令](https://blog.csdn.net/zhangliao613/article/details/79021606) |
      | 2.内存大小       | **cat /proc/meminfo head -n 16**                   |                                | ①**cat /proc/meminfo \| grep MemToal**<br/>②**cat /proc/meminfo head -n 16** |                                |                                                              |
      | 3.硬盘数量与大小 | **df -h**                                          |                                | ①**fdisk -l \| grep Disk**（查看硬盘大小）<br/>②**df -h**（查看大小和数量） |                                |                                                              |
    
      
    



#### 总结：

①asciinema真的很好用！！录制的视频看起来就很清楚很明白，在虚拟机上操作也很方便，但是唯一感觉不太好的就是、、它页面上不能按空格暂停啥的，每次都要鼠标点，有时候很容易就错过了。

②然后发现asciinema有private和public的，但是默认上传是private的，我刚以为private的链接写在这里面到时候老师会打不开，然后发现只要是share的链接别人都能打开，只是如果别人访问我的首页就不会显示我的private的录制视频，但是我已经把我全部的视频都改成public了（上面链接没改，还是private的链接）。

③总的来说感觉这次作业比第一次的简单很多（可能是因为了解一点了），操作的命令还有理解啥的，我的感觉是对sudo和install在本地Ubuntu和cuntos的区别（就是Ubuntu用apt centos用yum），还有可以连接网页从网站上下载。比如安装rar和unrar：**wget --no-check-certificate https://www.rarlab.com/rar/rarlinux-x64-5.9.1.tar.gz **。这个链接是可以直接下载的软件，也可以直接这样下到centos上，但是我原来搜到的是直接wget  https://www.rarlab.com/rar/rarlinux-x64-5.9.1.tar.gz ，但是报错：

ERROR: cannot verify www.rarlab.com's certificate, issued by ‘/C=US/O=Let's Encrypt/CN=R3’:
  Issued certificate has expired.
To connect to www.rarlab.com insecurely, use `--no-check-certificate'.

看最后一句就加上`--no-check-certificate'，就可以了。

④本次作业询问了揭青莹师姐，谢谢师姐嘿嘿！

#### 



