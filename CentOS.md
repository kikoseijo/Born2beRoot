<h1 align=center>
	<b>CentOS Linux 8</b>
</h1>


<h2 align=center> Index </h2>
<h3><b>
	<a href="#Virtualization Server">1. Virtualization Server</br></a>
</b></h3>
	<span> • </span><a href="#What is Server Virtualization?">1.1 What is Server Virtualization?</br></a>
	<span> • </span><a href="#What are VMs used for?">1.2 What are VMs used for?</br></a>
	<span> • </span><a href="#What are the benefits of VMs?">1.3 What are the benefits of VMs?</br></a>
<h3><b>
	<a href="#CentOS">2. CentOS</br></a>
</b></h3>
	<span> • </span><a href="#Overview">2.1 Overview</br></a>
	<span> • </span><a href="#CentOS vs Debian">2.2 CentOS vs Debian</br></a>
<h3><b>
	<a href="#SELinux">3. SELinux</br></a>
</b></h3>
	<span> • </span><a href="#SEl">3.1 Overview</br></a>

<h3><b>
	<a href="#SSH">4. SSH</br></a>
</b></h3>
	<span> • </span><a href="#SS">4.1 Overview</br></a>
	<span> • </span><a href="#SS2">4.2 Installing & Configuring SSH</br></a>
<h3><b>
	<a href="#UFW">5. UFW</br></a>
</b></h3>
	<span> • </span><a href="#UF1">5.1 Overview</br></a>
	<span> • </span><a href="#UF2">5.2 Install and Setup UFW Firewall</br></a>
<h3><b>
	<a href="#Hostname, Users and Groups">6. Hostname, Users and Groups</br></a>
</b></h3>

<h3><b>
	<a href="#Setting 'sudo' in linux">7. Setting 'sudo' in linux</br></a>
</b></h3>

<h3><b>
	<a href="#ref">References</br></a>
</b></h3>


<h2 align=center id="Virtualization Server">
Virtualization Server
</h2>
<h2 id="What is Server Virtualization?">
What is Server Virtualization?
</h2>

Server virtualization is the process of creating multiple server instances from one physical server. Each server instance represents an isolated virtual environment. Within each virtual environment, you can run a separate operating system.

![VM](https://azurecomcdn.azureedge.net/cvt-c6423f74796365dad64d76835f10a79b10d64b0ec5f06b8061d1a854a4cd1ed1/images/page/overview/what-is-a-virtual-machine/overview-img.png)

<h2 id="What are VMs used for?">
What are VMs used for?
</h2>

<p>Here are a few ways virtual machines are used:

- Building and deploying apps to the cloud.
Trying out a new operating system (OS), including beta releases.
- Spinning up a new environment to make it simpler and quicker for developers to run dev-test scenarios.
- Backing up your existing OS.
- Accessing virus-infected data or running an old application by installing an older OS.
- Running software or apps on operating systems that they weren't originally intended for.
</p>

<h2 id="What are the benefits of VMs?">
What are the benefits of VMs?
</h2>

<p>

- Cost Savings.
- Agility and speed.
- Lowered downtime.
- Scalability.
- Security benefits.
</p>

<h2 align=center id="CentOS">
CentOS
</h2>
<h2 id="Overview">
Overview
</h2>

<p>

- CentOS — Community Enterprise Operating System — is a free, open source Linux distribution. CentOS is functionally compatible with Red Hat Enterprise Linux (RHEL). And it's derived from RHEL.
- CentOS is good for enterprise Linux without the costs of RHEL.
- CentOS Linux 8, as a rebuild of RHEL 8, will end at the end of 2021. CentOS Stream continues after that date, serving as the upstream (development) branch of Red Hat Enterprise Linux.
</p>

<h2 id="CentOS vs Debian">
CentOS vs Debian
</h2>

CentOS|Debian
---|---
CentOS is more stable and supported by a large community|Debian has relatively less market preference.
Mission-critical servers are hosted on CentOS|Ubuntu is fast catching up. A lot of people are betting on it.
Usually, it is very difficult to upgrade a version of CentOS locally. Official sources recommend installing a newer version then to upgrade an older one.|Upgrading Debian from one stable version to another is easy and not painf
It does not have an easy GUI. | It has desktop friendly applications and GUI.
The core software of CentOS, such as the RHEL/CentOS components, also the kernel and all its utilities, come from the distribution, while the add-on software like Apache, PHP, Java, and MySQL come from newer sources such as Fedora or from vendors directly such as MySQL | A real reason to use Debian is if they provide unique functionality that is necessary for a system; in such cases switching to Debian makes sense. Apt repositories in package managers have the latest source code for several open-source languages and frameworks like ruby, rails, PostgreSQL, Golang, selenium, angular2-dart etc. Ubuntu is very suitable to work with when using Docker file/s docker containers.

<h2 align=center id="SELinux">
SELinux
</h2>
<h2 id="SEl">
Overview
</h2>

<p>

- Security-Enhanced Linux (SELinux) is a mandatory access control (MAC) security mechanism implemented in the kernel. SELinux was first introduced in CentOS 4 and significantly enhanced in later CentOS releases. These enhancements mean that content varies as to how to approach SELinux over time to solve problems. SELinux is basically about  defining the access of a process type.
</p>

<h2 align=center id="LVM">
LVM
</h2>
<h2 id="lv">
Overview
</h2>

![VM](https://cdn.thegeekdiary.com/wp-content/uploads/2014/10/LVM-basic-structure.png)

<p>

LVM stands for Logical Volume Management. It is a system of managing logical volumes, or filesystems, that is much more advanced and flexible than the traditional method of partitioning a disk into one or more segments and formatting that partition with a filesystem.

- PV – It’s a raw hard drive that it initialized to work with LVM, such as /dev/sdb, /dev/sdc, /dev/sdb1 etc.
- VG – Many PV is combined into one VG. You can create many VGs and each of them has a unique name.
- LV – You can create many LVs from a VG. You can extend, reduce the LV size on the fly. The LV also has unique names. You format the LV into ext4, zfs, btrfs etc filesystems, mount it and use it as you do other ordinary partitions.
- Encrypted volumes allow you to keep many files securely encrypted within one encrypted file volume. Individual files can easily be accessed (assuming the volume is mounted as a drive using the password). Dismount the volume when finished and no one else will be able to access the files in the volume without 'mounting' back to a drive (and to do this the correct Pass Phrase is required).
</p>

<h2 align=center id="APT and Aptitude">
APT and Aptitude
</h2>
<h2 id="apt and aptitu">
Overview
</h2>
Aptitude and apt-get are two of the popular tools which handle package management. Both are capable of handling all kinds of activities on packages including installation, removal, search etc.

<h2 id="What is Apt">
What is Apt
</h2>
Apt or Advanced Packaging Tool is a free and open source software which gracefully handles software installation and removal. Initially it was designed for Debian’s .deb packages

<h2 align=center id="dnf and yum">
dnf and yum
</h2>
<h2 id="dnf">
dnf
</h2>
DNF stands for Dandified YUM is a software package manager for RPM(Red Hat Package Manager)-based Linux distributions. It is used to install, update, and remove packages in the Fedora/RHEL/CentOS operating system.
It is the default package manager of Fedora 22, CentOS8, and RHEL8.
<h2 id="yum">
yum
</h2>
Yum Package Manager has been replaced by DNF Package Manager since many long-standing issues in Yum remain unresolved.
These problems include poor performance, excessive memory usage, slowdown for dependency resolution.

<h2 align=center id="SSH">
SSH
</h2>
<h2 id="SS">
Overview
</h2>

![VM](https://www.oracle.com/webfolder/technetwork/tutorials/obe/cloud/dbaas/obe_dbaas_connecting_to_an_instance/images/key%20based%20authentication.jpg)

<p>

- SSH, also known as Secure Shell or Secure Socket Shell, is a network protocol that gives users, particularly system administrators, a secure way to access a computer over an unsecured network.
</p>

<h2 id="SS2">
Installing & Configuring SSH
</h2>

```console
[root@jseijo-p42 ~]# sudo yum install openssh-clients
```
```console
[root@jseijo-p42 ~]# sudo yum install openssh-server
```
```console
[root@jseijo-p42 ~]# sudo systemctl status sshd
```

```console
[root@jseijo-p42 ~]# sudo systemctl enable sshd
```

```console
[root@jseijo-p42 ~]# sudo vi /etc/ssh/sshd_config
```

```console
[root@jseijo-p42 ~]# Port 4242
```

```console
[root@jseijo-p42 ~]# PermitRootLogin no
```

```console
[root@jseijo-p42 ~]# dnf provides /usr/sbin/semanage
```

```console
[root@jseijo-p42 ~]# dnf install policycoreutils-python-utils
```

```console
[root@jseijo-p42 ~]# sudo semanage port -a -t ssh_port_t -p tcp 4242
```

```console
[root@jseijo-p42 ~]# semanage -h
```

```console
[root@jseijo-p42 ~]# systemctl restart sshd
```

<h2 id="SS3">
Testing the SSH key
</h2>

```console
[root@jseijo-p42 ~]# semanage port -l | grep ssh
```

```console
[root@jseijo-p42 ~]# semanage port -a -t ssh_port_t tcp 4242
```

```console
[root@jseijo-p42 ~]# systemctl restart sshd
```

```console
[root@jseijo-p42 ~]# ss -tunlp
```

```console
[root@jseijo-p42 ~]#
```

<h2 align=center id="UFW">
UFW
</h2>
<h2 id="UF1">
Overview
</h2>

- According to Ubuntu, Uncomplicated Firewall (ufw) is a frontend for iptables and is particularly well-suited for host-based firewalls. ufw provides a framework for managing netfilter, as well as a command-line interface for manipulating the firewall.

- Firewall is a network security system that filters and controls the traffic on a predetermined set of rules. This is an intermediary system between the device and the internet.

<h2 id="UF2">
Install and Setup UFW Firewall
</h2>

```console
[root@jseijo-p42 ~]# sudo dnf install epel-release -y
```

```console
[root@jseijo-p42 ~]# sudo dnf install ufw -y
```

```console
[root@jseijo-p42 ~]# sudo systemctl start ufw
```

```console
[root@jseijo-p42 ~]# sudo systemctl enable ufw
```

```console
[root@jseijo-p42 ~]# sudo ufw status
```

```console
[root@jseijo-p42 ~]# sudo ufw status numbered
```

```console
[root@jseijo-p42 ~]# sudo ufw delete 1
```

```console
[root@jseijo-p42 ~]# sudo ufw default allow outgoing
```

```console
[root@jseijo-p42 ~]# sudo ufw default deny incoming
```

```console
[root@jseijo-p42 ~]# sudo ufw allow 4242
```

```console
[root@jseijo-p42 ~]# sudo ufw allow 80
```

```console
[root@jseijo-p42 ~]# sudo systemctl start ufw
```

```console
[root@jseijo-p42 ~]# sudo systemctl restart ufw
```

```console
[root@jseijo-p42 ~]#
```

<h2 align=center id="Hostname, Users and Groups">
Hostname, Users and Groups
</h2>

<h2 id="Hostname">
Hostname
</h2>

A hostname is a name which is given to a computer and it attached to the network.

```console
[root@jseijo-p42 ~]# sudo vi /etc/hostname
```

```console
[root@jseijo-p42 ~]# sudo vi /etc/hosts
127.0.0.1	localhost localhost.localdomain localhost4 localhost4.locadomain4
::1			localhost localhost.localdomain localhost6 localhost6.locadomain6
```

```console
[root@jseijo-p42 ~]# sudo reboot
```

<h2 id="Users">
Users
</h2>

```console
[root@jseijo-p42 ~]# users
```

```console
[root@jseijo-p42 ~]# useradd [options] <username>
```

```console
[root@jseijo-p42 ~]# usermod [options] <username>
```

```console
[root@jseijo-p42 ~]# userdel [options] <username>
```

```console
[root@jseijo-p42 ~]# id -u <username> (UID - user ID)
```

```console
[root@jseijo-p42 ~]# passwd <username>
```

list of the users in linux
```console
[root@jseijo-p42 ~]# vi /etc/passwd
```

```console
[root@jseijo-p42 ~]#
```

<h2 id="Group">
Group
</h2>

```console
[root@jseijo-p42 ~]# groups <username>
```

```console
[root@jseijo-p42 ~]# groupadd [options] <group_name>
```

```console
[root@jseijo-p42 ~]# groupdel [options] <group_name>
```

```console
[root@jseijo-p42 ~]# gpasswd [options] <username> <group_name>
```

list of users in the group
```console
[root@jseijo-p42 ~]# getent group <groupname>
```

```console
[root@jseijo-p42 ~]# id [options]
```

```console
[root@jseijo-p42 ~]# usermod -aG wheel username (to add in sudo group)
```

list of groups in linux
```console
[root@jseijo-p42 ~]# vi /etc/group
```

Add a user a group
```console
[root@jseijo-p42 ~]# usermod -aG <groupname> <username>
```

adds user to group;
```console
[root@jseijo-p42 ~]# gpasswd -a <username> <groupname>
```

removes user from group
```console
[root@jseijo-p42 ~]# gpasswd -d <username> <groupname>
```

```console
[root@jseijo-p42 ~]#
```

```console
[root@jseijo-p42 ~]#
```


<h2 align=center id="Setting 'sudo' in linux">
Setting 'sudo' in linux
</h2>

sudo allows a permitted user to execute a command as root (or another user), as specified by the security policy

```console
[root@jseijo-p42 ~]# dnf install sudo
```

```console
[root@jseijo-p42 ~]# mkdir /var/log/sudo/sudo.log
```

```console
[root@jseijo-p42 ~]# visudo -f /etc/sudoers.d/sudoers-rules
# Set a Secure PATH
Defaults	secure_path=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin

# Enable sudo on TTY User Login Session
Defaults	requiretty

# Create a Sudo Log File
Defaults	logfile=/var/log/sudo/sudo.log

# Show Custom Message When You Enter Wrong sudo Password
Defaults	badpass_message="Password is wrong, im watching you, please try again"

# Increase sudo Password Tries Limit
Defaults	passwd_tries=3
```

For test:

```console
[root@jseijo-p42 ~]# sudo systemctl status sshd
```

```console
[root@jseijo-p42 ~]# vi /var/log/sudo/sudo.log
sep 28 11:55:05 : root : TTY=tty1 ; PWD=/root ; USER=root;
	COMMAND=/usr/bin/systemctl status sshd
```

```console
[root@jseijo-p42 ~]#
```

<h2 align=center id="Password Policy">
Password Policy
</h2>

> 1. Your password has to expire every 30 days.
> 2. The minimum number of days allowed before the modification of a password will be set to 2.
> 3. The user has to receive a warning message 7 days before their password expires.
> 4. Your password must be at least 10 characters long.
> 5. It must contain an uppercase letter and a number. Also, it must not contain more than 3 consecutive identical characters.
> 6. The password must not include the name of the user.
> 7. The following rule does not apply to the root password: The password must have at least 7 characters that are not part of the former password

```console
[root@jseijo-p42 ~]# vi /etc/login.defs

:set number

# line 131: Maximum number of days a password may be used.
PASS_MAX_DAYS 30

# line 132: Minimum number of days allowed between password changes.
PASS_MIN_DAYS 2

# Minimum acceptable password length.
# line Currently PASS_MIN_LEN is not supported
PASS_MIN_LEN

# line 133: Number of days warning given before a password expires.
PASS_WARN_AGE 7
```

```console
[root@jseijo-p42 ~]# vi /etc/security/pwquality.conf

:set number

# line 6: Set number of characters in the new password that must not be present in the old password.
difok = 7

# line 11: Set minimum password length
minlen = 10

# line 15: Require at least one digit in the new password.
dcredit = -1

# line 20: Require at least one uppercase character in the new password.
ucredit = -1

# line 38: Set maximum number of allowed consecutive same characters in the new password.
maxrepeat = 3

# line 55: If it contains the user name in some form.
usercheck = 1

#line 70: Prompt user at most N times before returning with error.
retry = 3
```

Update
```console
[root@jseijo-p42 ~]# vi /etc/pam.d/system-auth

:set number

# line 10:
password	requisite	pam_pwquality.so try_first_pass local_users_only retry=3 authtok_type= minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 difok=7 reject_username enforce_for_root
```

<h2 align=center id="WALL">
WALL
</h2>

```console
[root@jseijo-p42 ~]# wall [options] [message-text/filename]
```

<h2 align=center id="cron">
cron
</h2>

```console
[root@jseijo-p42 ~]# sudo dnf install crontabs
```

```console
[root@jseijo-p42 ~]# sudo systemctl start crond.service
```

```console
[root@jseijo-p42 ~]# sudo systemctl enable crond.service
```

```console
[root@jseijo-p42 ~]# crontab -e
```

```console
[root@jseijo-p42 ~]# crontab -l
```

```console
[root@jseijo-p42 ~]# crontab -u <username> -l
```

```console
[root@jseijo-p42 ~]# crontab -u <username> -e
```

```console
[root@jseijo-p42 ~]#
```

<h2 align=center id="IP Static">
IP Static
</h2>

```console
[root@jseijo-p42 ~]# vi /etc/sysconfig/network-scripts/ifcfg-enp0s3

TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=no
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
NAME=enp0s3
UUID=620ec731-3c6c-42df-8a0f-c6f81f1d2325
DEVICE=enp0s3
ONBOOT=yes
IPADDR=192.168.0.110
GATEWAY=192.168.0.1
DNS1=8.8.8.8
```

```console
[root@jseijo-p42 ~]# sudo systemctl restart NetworkManager
```

```console
[root@jseijo-p42 ~]#
```

```console
[root@jseijo-p42 ~]#
```

```console
[root@jseijo-p42 ~]#
```

<h2 align=center id="Bonus">
Bonus
</h2>

<h2 id="Lighttpd">
Lighttpd
</h2>

```console
[root@jseijo-p42 ~]# cd /tmp
[root@jseijo-p42 ~]# wget https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.64.tar.gz
[root@jseijo-p42 ~]# tar -zxvf lighttpd-1.4.64.tar.gz
cd lighttpd-1.4.64
[root@jseijo-p42 ~]# yum install gcc bzip2 bzip2-devel openssl-devel zlib-devel pcre-devel
[root@jseijo-p42 ~]# ./configure --host=i686-redhat-linux-gnu --build=i686-redhat-linux-gnu --target=i386-redhat-linux --program-prefix= --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/usr/com --mandir=/usr/share/man --infodir=/usr/share/info --with-openssl --with-pcre --with-zlib --with-bzip2 --disable-ipv6 --with-PACKAGE=mod_redirect --with-rewrite --with-redirect --with-ssi
[root@jseijo-p42 ~]# make
[root@jseijo-p42 ~]# make install
[root@jseijo-p42 ~]# mkdir /etc/lighttpd/
[root@jseijo-p42 ~]# groupadd lighttpd
[root@jseijo-p42 ~]# useradd -g lighttpd -d /var/www/html -s /sbin/nologin lighttpd
[root@jseijo-p42 ~]# mkdir /var/log/lighttpd
[root@jseijo-p42 ~]# chown lighttpd:lighttpd /var/log/lighttpd
[root@jseijo-p42 ~]# cd /etc/lighttpd
[root@jseijo-p42 ~]# wget http://www.cyberciti.biz/tips/wp-content/uploads/2006/07/lighttpd.conf.txt
[root@jseijo-p42 ~]# mv lighttpd.conf.txt lighttpd.conf
[root@jseijo-p42 ~]# chown lighttpd:root /etc/lighttpd/lighttpd.conf
[root@jseijo-p42 ~]# cd /etc/systemd/
```
TODO: im here!

```console
[root@jseijo-p42 ~]# dnf -y install lighttpd
```

```console
[root@jseijo-p42 ~]# systemctl start lighttpd
```

```console
[root@jseijo-p42 ~]# systemctl enable lighttpd
```

```console
[root@jseijo-p42 ~]# ufw allow http
```

```console
[root@jseijo-p42 ~]# systemctl status lighttpd
```

```console
[root@jseijo-p42 ~]# systemctl restart lighttpd
```

```console
[root@jseijo-p42 ~]# systemctl restart NetworkManager
```

```console
[root@jseijo-p42 ~]#
```

<h2 id="MariaDB">
MariaDB
</h2>

```console
[root@jseijo-p42 ~]# dnf -y install mariadb mariadb-server
```

```console
[root@jseijo-p42 ~]# systemctl start mariadb.service
```

```console
[root@jseijo-p42 ~]# systemctl enable mariadb.service
```

```console
[root@jseijo-p42 ~]# systemctl status mariadb.service
```

```console
[root@jseijo-p42 ~]# mysql_secure_installation

Enter current password for root (enter for none): Enter
OK, successfully used password, moving on... Setting the root password ensures that nobody can log into the MariaDB root user without the proper authorization.

Set root password? [Y/n] y
New password:
Re-enter new password:
Password updated successfully! Reloading privilege tables.. ... Success! By default, a MariaDB installation has an anonymous user, allowing anyone to log into MariaDB without having to have a user account created for them. This is intended only for testing, and to make the installation go a bit smoother. You should remove them before moving into a production environment.

Remove anonymous users? [Y/n] y ...
Success! Normally, root should only be allowed to connect from 'localhost'. This ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] y ... Success! By default, MariaDB comes with a database named 'test' that anyone can access. This is also intended only for testing and should be removed before moving into a production environment.

Remove test database and access to it? [Y/n] y -
Dropping test database... ... Success! - Removing privileges on test database... ... Success! Reloading the privilege tables will ensure that all changes made so far will take effect immediately.

Reload privilege tables now? [Y/n] y ... Success! Cleaning up... All done! If you've completed all of the above steps, your MariaDB installation should now be secure. Thanks for using MariaDB!
```

```console
[root@jseijo-p42 ~]# systemctl restart mariadb
```

```console
[root@jseijo-p42 ~]# mysql -u root -p
```

```console
[root@jseijo-p42 ~]# CREATE DATABASE word;
```

```console
[root@jseijo-p42 ~]# CREATE USER 'wp'@'jseijo-p42' IDENTIFIED BY '1022021';
```

```console
[root@jseijo-p42 ~]# GRANT ALL PRIVILEGES ON word.* TO 'wp'@'jseijo-p42' IDENTIFIED BY '1022021' WITH GRANT OPTION;
```

```console
[root@jseijo-p42 ~]# FLUSH PRIVILEGES;
```

```console
[root@jseijo-p42 ~]# EXIT;
```

```console
[root@jseijo-p42 ~]#
```

<h2 id="PHP">
PHP
</h2>

```console
[root@jseijo-p42 ~]# sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```

```console
[root@jseijo-p42 ~]# sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
```

```console
[root@jseijo-p42 ~]# sudo dnf module install php80
```

```console
[root@jseijo-p42 ~]# sudo dnf -y install php php-mysqlnd php-pdo php-gd php-mbstring
```

```console
[root@jseijo-p42 ~]# sudo dnf -y lighttpd-fastcgi
```

To view enabled modules, run:
```console
[root@jseijo-p42 ~]# php --modules
```

```console
[root@jseijo-p42 ~]# vi /etc/php-fpm.d/www.conf

:set number

# line 24:
user = lighttpd

# line 26:
group = lighttpd

# line 38:
listen = 127.0.0.1:9000
```

```console
[root@jseijo-p42 ~]# vi /etc/php.ini

:set number

# line 807:
cgi.fix_pathinfo=1
```

```console
[root@jseijo-p42 ~]# vi /etc/lighttpd/modules.conf

:set number

    ##
142 ## FastCGI (mod_fastcgi)
143 ##
144 include "conf.d/fastcgi.conf"
```

```console
[root@jseijo-p42 ~]# vi /etc/lighttpd/conf.d/fastcgi.conf

fastcgi.server += ( ".php" =>
		((
				"host" => "127.0.0.1",
				"port" => "9000",
				"broken-scriptfilename" => "enable"
		))
)
```

```console
[root@jseijo-p42 ~]# sudo setsebool -P httpd_can_network_connect 1
```

```console
[root@jseijo-p42 ~]# sudo setsebool -P httpd_can_network_connect_db 1
```

```console
[root@jseijo-p42 ~]# sudo systemctl start php-fpm.service
```

```console
[root@jseijo-p42 ~]# sudo systemctl enable php-fpm.service
```

```console
[root@jseijo-p42 ~]# vi /var/www/lighttpd/info.php

<?php
phpinfo();
?>
```

```console
[root@jseijo-p42 ~]# vi /etc/lighttpd/lighttpd.conf

:set number

118 ##
119 ## Document root
120 ##
121 server.document-root = server_root + "/html"
```

```console
[root@jseijo-p42 ~]# cp /var/www/lighttpd/* /var/www/html/
```

```console
[root@jseijo-p42 ~]# mv /var/www/lighttpd /var/www/html/
```

```console
[root@jseijo-p42 ~]#
```

```console
[root@jseijo-p42 ~]#
```

```console
[root@jseijo-p42 ~]#
```

<h2 id="Wordpress">
Wordpress
</h2>

```console
[root@jseijo-p42 ~]# yum -y install wget tar
```


```console
[root@jseijo-p42 ~]# wget http://wordpress.org/latest.tar.gz
```

```console
[root@jseijo-p42 ~]# tar -xzvf latest.tar.gz
```

```console
[root@jseijo-p42 ~]# mv wordpress/wp-config-sample.php wordpress/wp-config.php
```

```console
[root@jseijo-p42 ~]# sudo cp -r /wordpress/* /var/www/html
```

```console
[root@jseijo-p42 ~]# mv /wordpress /var/www/html/
```

```console
[root@jseijo-p42 ~]# sudo vi /var/www/html/wp-config.php
```
antes
```console
[root@jseijo-p42 ~]# sudo chown -R lighttpd:lighttpd /var/www/html/wordpress
```
depois
```console
[root@jseijo-p42 ~]# sudo chown -R lighttpd:lighttpd /var/www/html/
```

```console
[root@jseijo-p42 ~]# sudo chmod -R 755 /var/www/html/wordpress
```

```console
[root@jseijo-p42 ~]# sudo chcon -R -t httpd_sys_rw_content_t /var/www/html/wordpress
```

```console
[root@jseijo-p42 ~]# senha: ZXAb2bU3(NYr#0CGCl
```

```console
[root@jseijo-p42 ~]#
```

```console
[root@jseijo-p42 ~]# 192.168.0.110/wp-admin
```

```console
[root@jseijo-p42 ~]# sleep $(last reboot -F | head -1 | awk '{print $8}' | tr ':' ' ' | awk '{printf("%d", (($2%10)*60)+$3)}')
```

```console
[root@jseijo-p42 ~]# chmod 755 monitoring.sh sleep.sh
```


```console
[root@jseijo-p42 ~]# mv /var/www/html/index.html old.index.html
```

para gerar a signature
```console
[root@jseijo-p42 ~]# /mnt/c/Users/jseijo-p$ cd VirtualBox\ VMs/
```

```console
[root@jseijo-p42 ~]# cd CentOS\ Linux\ 8/ (nome da máquina criada)
```

```console
[root@jseijo-p42 ~]# /mnt/c/Users/jseijo-p/VirtualBox VMs/CentOS Linux 8$ sha1sum 'CentOS Linux 8.vdi' > signature.txt
```

```console
[root@jseijo-p42 ~]#
```

```console
[root@jseijo-p42 ~]#
```

para encontrar o path da sua máquina virtual
va nas configurações da máquina virtual

```console
user@jseijo-p$ cd VirtualBox\ VMs/
```

```console
user@jseijo-p/VirtualBox VMs$ ls

 42saopaulo-virtualbox   CentOS  'CentOS Linus 8 Clone'  'CentOS Linus 8 Clone 2'  'CentOS Linux 8'
```

```console
user@jseijo-p/VirtualBox VMs$ cd CentOS

CentOS/                 CentOS Linus 8 Clone/   CentOS Linus 8 Clone 2/ CentOS Linux 8/
```

```console
user@jseijo-p/VirtualBox VMs$ cd CentOS

CentOS/                 CentOS Linus 8 Clone/   CentOS Linus 8 Clone 2/ CentOS Linux 8/
```

```console
user@jseijo-p/VirtualBox VMs$ cd CentOS\ Linux\ 8/
```

```console
user@jseijo-p/VirtualBox VMs/CentOS Linux 8$ ls

'CentOS Linux 8.vbox'  'CentOS Linux 8.vbox-prev'  'CentOS Linux 8.vdi'   Logs   Snapshots
```

```console
user@jseijo-p/VirtualBox VMs/CentOS Linux 8$ sha1sum 'CentOS Linux 8.vdi' > signature.txt
```

```console
user@jseijo-p/VirtualBox VMs/CentOS Linux 8$ ls

'CentOS Linux 8.vbox'  'CentOS Linux 8.vbox-prev'  'CentOS Linux 8.vdi'   Logs   Snapshots   signature.txt
```

```console
user@jseijo-p/VirtualBox VMs/CentOS Linux 8$ cat signature.txt

e3cdf415ef897cb0815aec0c86e2a9ef3a098cbe  CentOS Linux 8.vdi
```

```console
user@jseijo-p/VirtualBox VMs/CentOS Linux 8$
```

<h2 id="Fail2Ban">
Fail2Ban
</h2>

- Helps prevetn brute-force attacks
- watches logs for authentication failure
- Create firewall rules to block IP addresses
- Able to protect multiple services
- Completely customizable

```console
[root@jseijo-p42 ~]# sudo apt install fail2ban
```

```console
[root@jseijo-p42 ~]# systemctl start fail2ban
```

```console
[root@jseijo-p42 ~]# systemctl enable fail2ban
```

```console
[root@jseijo-p42 ~]# sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

```console
[root@jseijo-p42 ~]# sudo vi /etc/fail2ban/jail.local

# take the comment off the line with ignoreip
ignoreip = 127.0.0.1/8 ::1

# then change the POSTFIX values, although you don't even need it because the email server doesn't get installed
[postfix]
enabled  = true
port     = smtp,ssmtp
filter   = postfix
logpath  = /var/log/mail.log

# change ssh configuration[sshd]
enabled   = true
maxretry  = 3
findtime  = 1d
bantime   = 10m
port      = 4242

# Save file and exit
```

```console
[root@jseijo-p42 ~]# sudo systemctl restart fail2ban
```

```console
[root@jseijo-p42 ~]#
```

<h2 id="Fail2Ban useful commands">
Fail2Ban useful commands
</h2>


(shows fail2ban service status)
```console
[root@jseijo-p42 ~]# sudo fail2ban-client status
```

(shows fail2ban status for sshd, and banned ips)
```console
[root@jseijo-p42 ~]# sudo fail2ban-client status sshd
```

(takes ip from banned list)
```console
[root@jseijo-p42 ~]# sudo fail2ban-client set sshd unbanip 11.22.33.44
```

(puts ip in the banned list)
```console
[root@jseijo-p42 ~]# sudo fail2ban-client set sshd banip 11.22.33.44
```


<h2 id="ref">
	<b>References</b>
</h2>
->server virtualization
<p><a href="https://phoenixnap.com/kb/what-is-server-virtualization"><i><b>What is Server Virtualization?</b></i></a></p>
<p><a href="https://azure.microsoft.com/en-us/overview/what-is-a-virtual-machine/#overview"><i><b>What is a virtual machine(VM)?</b></i></a></p>
<p><a href="https://phoenixnap.com/kb/what-is-hypervisor-type-1-2"><i><b>What is a Hypervisior?Types of Hypervisors 1 & 2?</b></i></a></p>
<p><a href="http://quickcrypto.com/volume-encryption-software.html"><i><b>Volume Encryption</b></i></a></p>

-> what is centos
<p><a href="https://www.openlogic.com/blog/what-centos"><i><b>What is a CentOS?</b></i></a></p>
<p><a href="https://www.openlogic.com/blog/centos-vs-debian"><i><b>CentOS vs Debian</b></i></a></p>

->dnf vs yum
<p><a href="https://marcomapa.com/artigos/?p=1009"><i><b>difference between dnf and yum</b></i></a></p>
<p><a href="https://blog.eldernode.com/what-is-different-between-dnf-and-yum/"><i><b>what is different between DNF and yum [Quick review]</b></i></a></p>

->apt vs aptitude
<p><a href="https://www.tecmint.com/difference-between-apt-and-aptitude/"><i><b>What is APT and Aptitude?</b></i></a></p>

-> what is SELinux
<p><a href="https://wiki.centos.org/HowTos/SELinux"><i><b>SELinux</b></i></a></p>
<p><a href="https://www.tecmint.com/mandatory-access-control-with-selinux-or-apparmor-linux/"><i><b>Impementing Mandatory Access Control with SELinux or AppArmor in Linux</b></i></a></p>
<p><a href="https://www.redhat.com/sysadmin/apparmor-selinux-isolation"><i><b>A comparision of AppArmor and SELinux</b></i></a></p>
<p><a href="https://elinux.org/images/3/39/SecureOS_nakamura.pdf"><i><b>SELinux vs AppArmor</b></i></a></p>
<p><a href="https://www.incibe-cert.es/en/blog/selinux-and-mac"><i><b>SELinux and Mandatory Access Control</b></i></a></p>
<p><a href="https://www.hpe.com/us/en/insights/articles/how-to-set-up-selinux-right-the-first-time-1901.html"><i><b>How to set up SELinux right, the first time</b></i></a></p>

-> ssh
<p><a href="https://searchsecurity.techtarget.com/definition/Secure-Shell"><i><b>Secure Socket Shell (SSH)</b></i></a></p>
<p><a href="https://linuxhint.com/enable_ssh_centos8/"><i><b>How to Enable SSH on CentOS 8</b></i></a></p>
<p><a href="https://ostechnix.com/linux-troubleshooting-semanage-command-not-found-in-centos-7rhel-7/"><i><b>semanage command nott found</b></i></a></p>
<p><a href="https://askubuntu.com/questions/264046/how-to-ssh-on-a-port-other-than-22"><i><b>How to SSH on a port</b></i></a></p>
<p><a href="https://www.thorntech.com/passwords-vs-ssh/"><i><b>Passwords vs. SSH keys – what’s better for authentication?</b></i></a></p>

-> ufw
<p><a href="https://shouts.dev/install-and-setup-ufw-firewall-on-centos-8-rhel-8"><i><b>Install and Setup UFW Firewall</b></i></a></p>
<p><a href="https://www.geeksforgeeks.org/how-to-setup-firewall-in-linux/"><i><b>How to setup firewall in Linux?</b></i></a></p>

-> ip static
<p><a href="https://linuxconfig.org/rhel-8-configure-static-ip-address"><i><b>How to configure a static IP address</b></i></a></p>
<p><a href="https://www.snel.com/support/static-ip-configuration-centos-7/"><i><b>ip addres static</b></i></a></p>
<p><a href="https://www.techrepublic.com/article/how-to-configure-a-static-ip-address-in-centos-7/"><i><b>static IPv4 configuration</b></i></a></p>
<p><a href="https://www.linuxtechi.com/configure-static-ip-address-rhel8/"><i><b>How to Configure Static IP Address in RHEL 8</b></i></a></p>

-> police security
<p><a href="https://www.server-world.info/en/note?os=CentOS_8&p=pam&f=1"><i><b>Pwquality : Set Password Rules</b></i></a></p>

-> sudo setting
<p><a href="https://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/"><i><b>Setting ‘sudo’ in Linux</b></i></a></p>
<p><a href="https://www.tecmint.com/sudo-insult-when-enter-wrong-password/"><i><b>Let Sudo Insult You When You Enter Incorrect Password</b></i></a></p>
<p><a href="https://www.geeksforgeeks.org/tty-command-in-linux-with-examples/"><i><b>tty command in Linux with examples</b></i></a></p>

-> Hostname, Users and Groups
-> hostname
<p><a href="https://www.cyberciti.biz/faq/centos-8-change-hostname-computer-name-command/"><i><b>Change Hostname</b></i></a></p>
<p><a href="https://www.geeksforgeeks.org/hostname-command-in-linux-with-examples/#:~:text=hostname%20command%20in%20Linux%20is,uniquely%20identify%20over%20a%20network."><i><b>hostname command in Linux with examples</b></i></a></p>

->users
<p><a href="https://www.cyberciti.biz/faq/create-a-new-user-account-in-centos-7-8-linux/"><i><b>How to create new user</b></i></a></p>
<p><a href="https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s2-users-cl-tools"><i><b>Managing Users via command-line</b></i></a></p>
<p><a href="http://www.bosontreinamentos.com.br/linux/certificacao-lpic-1/comando-su-trocando-o-usuario-na-linha-de-comandos-lpic-1/"><i><b>Comando su – Trocando o usuário na linha de comandos</b></i></a></p>
<p><a href="https://stackoverflow.com/questions/49202275/permission-denied-when-starting-bashrc-on-ubuntu-on-windows"><i><b>Permission denied when starting .bashrc on ubuntu on windows</b></i></a></p>
<p><a href="https://askubuntu.com/questions/793507/rm-cannot-remove-directory-permission-denied"><i><b>rm: cannot remove directory/: Permission denied</b></i></a></p>
<p><a href="https://stackoverflow.com/questions/47806576/linux-username-is-not-in-the-sudoers-file-this-incident-will-be-reported"><i><b>Linux: 'Username' is not in the sudoers file.</b></i></a></p>

->groups
<p><a href="https://www.techrepublic.com/article/how-to-create-users-and-groups-in-linux-from-the-command-line/"><i><b>How to create users and groups</b></i></a></p>
<p><a href="https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s2-groups-cl-tools"><i><b>Managing Groups via command-line</b></i></a></p>
<p><a href="https://unix.stackexchange.com/questions/29570/how-do-i-remove-a-user-from-a-group"><i><b>How do I remove a user from a group?</b></i></a></p>
<p><a href="https://linuxize.com/post/how-to-add-user-to-sudoers-in-centos/"><i><b>How to Add User to Sudoers in CentOS</b></i></a></p>
<p><a href="https://github.com/caroldaniel/42sp-cursus-born2beroot/blob/master/guides/CentOS-en.md"><i><b>How to list all users in group</b></i></a></p>

->wall
<p><a href="https://phoenixnap.com/kb/linux-wall"><i><b>How to use the wall</b></i></a></p>

->cron
<p><a href="https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-centos-8-pt"><i><b>How to use the cron</b></i></a></p>
<p><a href="https://serverspace.io/support/help/automate-regular-tasks-cron-centos-8/"><i><b>How to Automate Regular Tasks with Cron on CentOS 8</b></i></a></p>

->LVM
<p><a href="https://www.thegeekdiary.com/redhat-centos-a-beginners-guide-to-lvm-logical-volume-manager/"><i><b>Beginner's Guide to LVM</b></i></a></p>
<p><a href="https://linuxhint.com/install_lvm_centos/"><i><b>How to install and Configure LVM on CentOS</b></i></a></p>
<p><a href="https://docs.centos.org/en-US/centos/install-guide/CustomSpoke-x86/"><i><b>Manual Partitioning</b></i></a></p>
<p><a href="https://www.server-world.info/en/note?os=CentOS_8&p=lvm&f=3"><i><b>LVM : Manage Logical Volumes</b></i></a></p>

->ufw
<p><a href="https://unix.stackexchange.com/questions/182959/how-can-i-enable-ufw-automatically-on-boot"><i><b>ufw enable automatic</b></i></a></p>
<p><a href="https://forums.linuxmint.com/viewtopic.php?t=331867"><i><b>UFW always disabled on boot!</b></i></a></p>
<p><a href="https://bugs.launchpad.net/ubuntu/+source/ufw/+bug/1726856/comments/23"><i><b>Comment 23 for bug 1726856</b></i></a></p>

->lighttpd, php, mairadb
<p><a href="https://www.cyberciti.biz/tips/installing-and-configuring-lighttpd-webserver-howto.html/"><i><b>How to Install Lighttpd from sources</b></i></a></p>
<p><a href="https://mariadb.com/kb/en/mariadb-basics/"><i><b>MariaDB Basics</b></i></a></p>
<p><a href="https://mariadb.com/kb/en/create-user/"><i><b>CREATE USER MariaDB</b></i></a></p>
<p><a href="https://mariadb.com/kb/en/grant/"><i><b>GRANT</b></i></a></p>
<p><a href="https://www.tecmint.com/install-php-8-on-centos/"><i><b>How to Install PHP 8 on CentOS/RHEL 8/7</b></i></a></p>
<p><a href="https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/using_selinux/configuring-selinux-for-applications-and-services-with-non-standard-configurations_using-selinux"><i><b>CONFIGURING SELINUX FOR APPLICATIONS AND SERVICES</b></i></a></p>
<p><a href="https://serverfault.com/questions/240015/how-do-i-allow-mysql-connections-through-selinux"><i><b>How do I allow MySQL connections through SELinux?</b></i></a></p>
<p><a href="https://linuxize.com/post/how-to-install-php-on-centos-8/"><i><b>How to Install PHP on CentOS 8</b></i></a></p>
<p><a href="https://unix.stackexchange.com/questions/200234/linux-commandline-can-connect-but-webserver-or-php-cant-connect"><i><b>Hlinux commandline can connect but webserver (or php) can't connect</b></i></a></p>
<p><a href="https://stackoverflow.com/questions/25055008/reverse-proxy-with-apache-on-centos-6"><i><b>Reverse Proxy with Apache on Centos 6</b></i></a></p>
<p><a href="https://linux.die.net/man/8/httpd_selinux"><i><b>httpd_selinux(8) - Linux man page</b></i></a></p>
<p><a href="https://serverfault.com/questions/240015/how-do-i-allow-mysql-connections-through-selinux"><i><b>How do I allow MySQL connections through SELinux?</b></i></a></p>
<p><a href="https://pt.linux-console.net/?p=2404"><i><b>Como instalar Lighttpd com PHP e MariaDB no CentOS / RHEL 8/7</b></i></a></p>

->wordpress
<p><a href="https://www.atlantic.net/vps-hosting/how-to-install-wordpress-centos-8-server/"><i><b>How to Install WordPress on a CentOS 8 Server</b></i></a></p>
<p><a href="https://www.liquidweb.com/kb/how-to-install-wordpress-on-centos-7/"><i><b>How to Install WordPress On CentOS 7</b></i></a></p>
<p><a href="https://www.tecmint.com/difference-between-apt-and-aptitude/"><i><b>What is APT and Aptitude? and What’s real Difference Between Them?</b></i></a></p>

->Fail2ban
<p><a href="https://www.cyberciti.biz/faq/how-to-protect-ssh-with-fail2ban-on-centos-8/"><i><b>How To Protect SSH With Fail2Ban on CentOS 8</b></i></a></p>
<p><a href="https://www.youtube.com/watch?v=kgdoVeyoO2E"><i><b>Fail2ban Tutorial | How to Secure Your Server</b></i></a></p>
<p><a href="https://guiatech.net/como-descobrir-seu-endereco-ip/"><i><b>How to find out your IP address</b></i></a></p>

->Sha1sum
<p><a href="https://www.howtoforge.com/linux-sha1sum-command/"><i><b>Linux sha1sum Command</b></i></a></p>
<p><a href="https://www.arysontechnologies.com/blog/how-to-open-vdi-file/"><i><b>What is VDI File</b></i></a></p>
