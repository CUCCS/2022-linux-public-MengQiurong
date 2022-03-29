

### H3

#### 2020212063036 20网安一班 蒙秋蓉

#### 1.如何添加一个用户并使其具备sudo执行程序的权限？

- 添加一个test用户：`sudo adduser test`

- 使其具备sudo执行程序的权限：

  - 安装gcc：
    `sudo apt update && sudo apt install gcc`
    `sudo apt install gcc -y`
    (在root下才能运行.c文件)

  - chmod改变权限:
    `chmod o+x hello`

  - ![添加和删除用户权限](H3/删除和添加普通用户权限.png)

    

- u (user)表示该文件的拥有者，g (group)表示与该文件的拥有者属于同一个群体(group)者，o(operator) 表示其他以外的人，a (all)表示这三者皆是。

- +表示增加权限、- 表示取消权限、= 表示唯一设定权限。

- | 模式 | 名字         | 说明                                                         |
  | ---- | ------------ | ------------------------------------------------------------ |
  | r    | 读           | 设置为可读权限                                               |
  | w    | 写           | 设置为可写权限                                               |
  | x    | 执行权限     | 设置为可执行权限                                             |
  | X    | 特殊执行权限 | 只有当文件为目录文件，或者其他类型的用户有可执行权限时，才将文件权限设置可执行 |
  | s    | setuid/gid   | 当文件被执行时，根据who参数指定的用户类型设置文件的setuid或者setgid权限 |
  | t    | 粘贴位       | 设置粘贴位，只有超级用户可以设置该位，只有文件所有者u可以使用该位 |

  



#### 2.如何将一个用户添加到一个用户组？

- 新建工作组：`groupadd groupname`

- 将用户添加进工作组：`usermod -G groupname username`

  ![新建添加](H3/新建用户组 添加用户进用户组.png)

#### 3.如何查看当前系统的分区表和文件系统详细信息？

- 查看系统的分区表：`fdisk -l`

  ![系统分区表](H3/查看系统的分区表.png)

- 查看文件系统详细信息：

  - `mount`查看现有的文件系统的文件系统类型：

    ![mount](H3/mount.png)

  - `dumpe2fs [-h] 文件名`

    ![dumpe2fs](H3/dumpe2fs.png)

- 查看文件的详细信息:①`ls -l file`② `ll file`



#### 4.如何实现开机自动挂载Virtualbox的共享目录分区？

- 在D盘新建文件夹

  ![新建文件夹](H3/新建文件夹.png)

- 设置共享文件夹，选择**固定分配**。

  ![设置共享文件夹](H3/设置共享文件夹.png)

- 新建 Ubuntu 共享文件夹：

  ```powershell
   sudo mkdir /mnt/share
  ```

- ```powershell
  sudo mount -t vboxsf shared_qr /mnt/share/
  ```

- 完成后，`cd /mnt/share` 会看到 Windows 共享的目录

  ![共享](H3/Linux下共享文件夹.png)

- 自动挂载Virtualbox的共享目录分区:

- 先` vim /etc/fstab`

- 后在文件末添加一项：`shared_qr /mnt/share/ vboxsf defaults 0 0`

  ![修改](H3/fstab下修改.png)
  
  **实现自动挂载**:`df -h `查看
  
  ![实现自动挂载](H3/自动挂载.png)
  
  **参考链接：**
  
  [(44条消息) Virtualbox实现共享文件夹并自动挂载_半砖的博客-CSDN博客_共享文件夹自动挂载](https://blog.csdn.net/hexf9632/article/details/93774198)



#### 5.基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？

##### 动态扩容：

- 查看磁盘信息：·`disk -l`

  ![查看磁盘信息fdisk -l](H3/查看磁盘信息fdisk -l.png)

- `pvscan`检查到系统上是有PV的：

  就是/dev/sda3

  ![pvscan](H3/pvscan.png)

- `pvdisplay`pv的详细信息：

  ![pvdisplay](H3/pv的详细信息.png)

- `pvcreate /dev/sda2`创建PV物理卷：

  - 创建的时候出现Can't open /dev/sda2 exclusively.  Mounted filesystem?的报错，说明分区文件正在使用中，必须先umount才行。
  - `umount /dev/sda2`
  - 再进行创建

  ![创建物理卷PV](H3/创建物理卷PV.png)

- 再看一下当前pv`pvscan`:

  ![pvscan](H3/pvscan2.png)

- 使用卷组查看命令vgdisplay显示卷组情况`vgdisplay`：

  ![vgdisplay](H3/vgdisplay.png)

- 创建逻辑卷LV ,命名为test_lv：

  - 创建逻辑卷的命令为lvcreate，-l 参数为定PE数来设定逻辑分区大小，也可以使用-L参数直接指定逻辑分区大小，-n参数指定逻辑分区名称。

  - ` lvcreate -l 2000 -n lv_test ubuntu-vg`

    ![LV](H3/创建LV.png)

  - 使用lvdisplay命令查看逻辑卷情况: 
  - `lvdisplay`
  - 发现有两个逻辑卷（一个是原有的，一个是刚刚新建的）。
  - ![lvdisplay](H3/lvdisplay.png)

- 创建文件系统，并挂载：
  - 在逻辑卷上创建ext3文件系统: 
  - `mkfs -t ext3 /dev/ubuntu-vg/lv_test`
  - ![mkfs](H3/mkfs.png)

- 新建test目录：

  - ![test](H3/test目录.png)

- 挂载：`mount /dev/ubuntu-vg/lv_test /test`

  - 再`df -h`(这个是我先进行增加剩余空间后查看的df -h 所以size为分配过去的39G)
  - ![mount](H3/mount test.png)

- `vgdisplay`可查看当前卷组剩余空间：

- 确定当前卷组剩余空间31.68GB，剩余PE数量为8111个。

  ![当前卷组剩余空间](H3/当前卷组剩余空间.png)

- 在这里将所有的剩余空间全部增加给逻辑卷 /dev/ubuntu-vg/lv_test

  ` lvextend -l +8111 /dev/ubuntu-vg/lv_test `

  ![lvextend](H3/lvextend.png)

- 修改逻辑卷大小后，通过resize2fs来修改文件系统的大小。

  ![resize2fs修改文件系统大小](H3/resize2fs修改文件系统大小.png)

- 再次查看文件系统的大小：

  ![df](H3/mount test.png)

- 当卷组中没有足够的空间用于扩展逻辑卷的大小时，就需要增加卷组的容量，而增加卷组容量的惟一办法就是向卷组中添加新的物理卷。 
  首先需要对新增加的磁盘进行分区、创建物理卷等工作。)，接下来是利用vgextend命令将新的物理卷加入到卷组中, 我使用/dev/sda2。

  - 看到VG的free为0，没有足够的空间用于扩展逻辑卷的大小。

  - ![2](H3/vgdiskplay2.png)
  - 向卷组中添加新的物理卷：`vgextend ubuntu-vg /dev/sda3  `
  - 下图可发现free不等于0了：
  - ![3](H3/vgdisplay3.png)

参考：[Linux系统下创建LV（逻辑卷）并挂载 - 云+社区 - 腾讯云 (tencent.com)](https://cloud.tencent.com/developer/article/1496311)

##### 缩减容量：

- lvdisplay查看当前lv的详细情况：
- 有两个LV（一个是原有的，一个是新建的）：
- ![2](H3/lvdisplay2.png)

- 先`umount /dev/ubuntu-vg/lv_test` 
- 再使用e2fsck命令检查文件系统完整性：
  - ![e2fsck](H3/e2fsck.png)
- 再使用resize2fs命令把逻辑卷lv_mysql的文件系统压缩至20GB。
  - `resize2fs /dev/ubuntu-vg/lv_test 20G`
  - ![resize](H3/resize lv.png)

- 文件系统压缩完成后，使用lvreduce命令对lv_test分区进行压缩。
  - ![lvreduce](H3/lvreduce.png)

- 缩减至20G后再`mount /dev/ubuntu-vg/lv_test /test`挂载
- 再`df -h`：
- ![afterreduce](H3/缩减内存后.png)

- 可看到已缩减至20G。

参考链接：[(44条消息) Lvm逻辑卷管理、创建、使用、扩展、缩减、迁移、快照、恢复_xusong1998的博客-CSDN博客](https://blog.csdn.net/xusong1998/article/details/110944930)



#### 6.如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？

- （本题是在结合阿里云和本地虚拟机一起做的，但是步骤相同，只是步骤截图不同。因为我刚开始做是在本地做的，然后一直报错，我就换了阿里云做；然后我做好了阿里云的之后发现不知道它该怎么开关机、、我就又换到本地做了、、一波三折就是说）
  - 先找一个目录下做好两个sh文件，我做的是teststart.sh和teststop.sh
  - 然后再sh运行脚本，就会发现我的脚本执行后会形成文本文件，然后就确定好sh是可以执行的，就删掉吧~
  - 再给两个sh文件加权限
  - `chmod u+x /home/qr/teststart.sh`
  - `chmod g+x /home/qr/teststart.sh`
  - `chmod u+x /home/qr/teststop.sh`
  - `chmod g+x /home/qr/teststop.sh`
  - 再`ls -l`查看一下
  - ![mkdir and sh](H3/mkdir and sh.png)

-  进入 systemd 的 service 目录:`cd /etc/systemd/system`

  - 在该目录创建一个新的 test.service 文件用于配置开机启动脚本

  - 内容为：

  - ```bash
    [Unit]
    Description=test
    
    [Service]
    ExecStart=/bin/bash /home/qr/teststart.sh
    ExecStop=/bin/bash /home/qr/testover.sh
    
    [Install]
    WantedBy=multi-user.target
    
    ```

  - ![test.service](H3/test.service.png)

  - ![vim test.service](H3/vim test.service.png)

  - 为什么要加/bin/bash 呢？

  - 因为我执行：

  - ```bash
    # 手动运行 StartupExample.service
    sudo systemctl start test.service
    # 查看运行日志
    systemctl status test.service
    ```

    时报错，然后我就去搜索了一下。

  - ![报错start](H3/报错start.png)

  - 网上解决该问题的方法：

    链接：[Bash：修复 systemd 服务 203/EXEC 故障（没有此类文件或目录）|发展和平 (devpeace.com)](https://devpeace.com/bash/45776003/fixing-a-systemd-service-203-exec-failure-no-such-file-or-directory)

  - ![解决start报错](H3/解决start报错.png)

  - 所以在test.service里加了这段/bin/bash 

  - 再执行一次，就成功了。

  - 还发现就是我手打的就总会报错，一定要复制进去。（不知道为什么

  - ![解决好了](H3/解决好了.png)

  - 可以发现已经运行了sh文件，生成了txt文件。

- 最后删掉生成的txt文件，再关机开机一次：

  - ![删掉生成文件](H3/删掉生成文件.png)

- 虚拟机上也成功实现
  - ![虚拟机上也成功实现](H3/虚拟机上也成功实现.png)
  - 虚拟机关机开机之后运行了脚本：
  - ![关机开机之后运行了脚本](H3/关机开机之后运行了脚本.png)

- 完成！

参考链接：[在 Ubuntu 上使用 systemd 配置开机执行脚本 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/340755873)



#### 7.如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？

​                                                                                                                 
