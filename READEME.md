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

#### 5.基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？



#### 6.如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？

#### 7.如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？

​                                                                                                                 
