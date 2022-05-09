<h1 align=center>
	<b>CentOS Stream 9 - Born2beRoot (42School)</b>
</h1>

<h2 id="SS2">
Installing & Configuring SSH
</h2>

Configured by default, no need to do any installation.

```console
[root@jseijo-p42 ~]# vi /etc/ssh/sshd_config
[root@jseijo-p42 ~]# Port 4242
[root@jseijo-p42 ~]# PermitRootLogin no
[root@jseijo-p42 ~]# dnf install policycoreutils-python-utils
[root@jseijo-p42 ~]# dnf provides /usr/sbin/semanage
[root@jseijo-p42 ~]# semanage port -a -t ssh_port_t -p tcp 4242
[root@jseijo-p42 ~]# semanage -h
[root@jseijo-p42 ~]# systemctl restart sshd
[root@jseijo-p42 ~]# mkdir .ssh
```

Run from local computer at intra.

```console
[jseijo-p@c2r5s1 Born2beRoot]$ cat ~/.ssh/id_rsa.pub
```

Login without a password using ssh .pub key.

```console
[jseijo-p42@jseijo-p42 ~]$ mkdir .ssh
[jseijo-p42@jseijo-p42 ~]$ vi .ssh/authorized_keys
```

<h2 id="SS3">
Adding the server to .config
</h2>

```console
[jseijo-p@c2r5s1 ~]$ vi .ssh/config
```

```console
Host c9 centos9
    HostName 10.12.250.174
    User jseijo-p42
    Port 4242
```

<h2 id="SS3">
Testing the SSH key
</h2>

```console
[root@jseijo-p42 ~]# semanage port -l | grep ssh
[root@jseijo-p42 ~]# systemctl restart sshd
[root@jseijo-p42 ~]# ss -tunlp
```

<h2 align=center id="UFW">
UFW
</h2>

<h2 id="UF2">
Install and Setup UFW Firewall
</h2>

```console
[root@jseijo-p42 ~]# dnf install net-tools epel-release -y
[root@jseijo-p42 ~]# dnf install ufw -y
[root@jseijo-p42 ~]# systemctl start ufw
[root@jseijo-p42 ~]# systemctl enable ufw
[root@jseijo-p42 ~]# ufw status
[root@jseijo-p42 ~]# ufw status numbered
[root@jseijo-p42 ~]# ufw delete 1
[root@jseijo-p42 ~]# ufw default allow outgoing
[root@jseijo-p42 ~]# ufw default deny incoming
[root@jseijo-p42 ~]# ufw allow 4242
[root@jseijo-p42 ~]# ufw allow 80
[root@jseijo-p42 ~]# systemctl restart ufw
```

<h2 align=center id="Hostname, Users and Groups">
Hostname, Users and Groups
</h2>

<h2 id="Hostname">
Hostname
</h2>

A hostname is a name which is given to a computer and it attached to the network.

```console
[root@jseijo-p42 ~]# vi /etc/hostname
```

```console
[root@jseijo-p42 ~]# vi /etc/hosts
127.0.0.1	localhost localhost.localdomain localhost4 localhost4.locadomain4
::1			localhost localhost.localdomain localhost6 localhost6.locadomain6
```

```console
[root@jseijo-p42 ~]# shutdown -r now
```

<h2 id="Users">
Users
</h2>

```console
[root@jseijo-p42 ~]# users
[root@jseijo-p42 ~]# useradd [options] <username>
[root@jseijo-p42 ~]# usermod [options] <username>
[root@jseijo-p42 ~]# userdel [options] <username>
[root@jseijo-p42 ~]# id -u <username> (UID - user ID)
[root@jseijo-p42 ~]# passwd <username>
```

list of the users in linux

```console
[root@jseijo-p42 ~]# vi /etc/passw
```

<h2 id="Group">
Groups
</h2>

```console
[root@jseijo-p42 ~]# groups <username>
[root@jseijo-p42 ~]# groupadd [options] <group_name>
[root@jseijo-p42 ~]# groupdel [options] <group_name>
[root@jseijo-p42 ~]# gpasswd [options] <username> <group_name>
```

list of users in the group

```console
[root@jseijo-p42 ~]# getent group <groupname>
[root@jseijo-p42 ~]# id [options]
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

<h2 align=center id="Setting 'sudo' in linux">
Setting 'sudo' in linux
</h2>

sudo allows a permitted user to execute a command as root (or another user), as specified by the security policy

```console
[root@jseijo-p42 ~]# mkdir /var/log/sudo
[root@jseijo-p42 ~]# touch /var/log/sudo/sudo.log
```

```console
[root@jseijo-p42 ~]# visudo -f /etc/sudoers.d/sudoers-rules
```

```
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
[root@jseijo-p42 ~]# systemctl status sshd
[root@jseijo-p42 ~]# tail -f /var/log/sudo/sudo.log
```

```
sep 28 11:55:05 : root : TTY=tty1 ; PWD=/root ; USER=root;
	COMMAND=/usr/bin/systemctl status sshd
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
```

```
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
```

```
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

```console
[root@jseijo-p42 ~]# vi /etc/pam.d/system-auth
```

```
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
CronJobs
</h2>

```console
[root@jseijo-p42 ~]# sudo dnf install crontabs
[root@jseijo-p42 ~]# sudo systemctl start crond.service
[root@jseijo-p42 ~]# sudo systemctl enable crond.service
[root@jseijo-p42 ~]# crontab -e
[root@jseijo-p42 ~]# crontab -l
[root@jseijo-p42 ~]# crontab -u <username> -l
[root@jseijo-p42 ~]# crontab -u <username> -e
```

<h2 align=center id="IP Static">
IP Static
</h2>

```console
[root@jseijo-p42 ~]# vi /etc/sysconfig/network-scripts/ifcfg-enp0s3
```

```
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
IPADDR=10.12.250.174
GATEWAY=192.168.0.1
DNS1=8.8.8.8
```

```console
[root@jseijo-p42 ~]# sudo systemctl restart NetworkManager
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
[root@jseijo-p42 ~]# cd lighttpd-1.4.64
[root@jseijo-p42 ~]# yum install tar wget gcc bzip2 bzip2-devel openssl-devel zlib-devel pcre-devel
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
[root@jseijo-p42 ~]# cd /usr/lib/systemd/system/
[root@jseijo-p42 ~]# lighttpd -tt  -f /etc/lighttpd/lighttpd.conf
```

```console
[root@jseijo-p42 ~]# dnf -y install lighttpd
[root@jseijo-p42 ~]# systemctl start lighttpd
[root@jseijo-p42 ~]# systemctl enable lighttpd
[root@jseijo-p42 ~]# ufw allow http
[root@jseijo-p42 ~]# systemctl status lighttpd
[root@jseijo-p42 ~]# systemctl restart lighttpd
[root@jseijo-p42 ~]# systemctl restart NetworkManager
```

<h2 id="MariaDB">
MariaDB
</h2>

```console
[root@jseijo-p42 ~]# dnf -y install mariadb mariadb-server
[root@jseijo-p42 ~]# systemctl start mariadb.service
[root@jseijo-p42 ~]# systemctl enable mariadb.service
[root@jseijo-p42 ~]# systemctl status mariadb.service
```

Configure MariaDB

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
[root@jseijo-p42 ~]# mysql -u root -p
[root@jseijo-p42 ~]# CREATE DATABASE word;
[root@jseijo-p42 ~]# CREATE USER 'wp'@'jseijo-p42' IDENTIFIED BY '1022021';
[root@jseijo-p42 ~]# GRANT ALL PRIVILEGES ON word.* TO 'wp'@'jseijo-p42' IDENTIFIED BY '1022021' WITH GRANT OPTION;
[root@jseijo-p42 ~]# FLUSH PRIVILEGES;
[root@jseijo-p42 ~]# EXIT;
```

<h2 id="PHP">
PHP
</h2>

```console
[root@jseijo-p42 ~]# dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
[root@jseijo-p42 ~]# dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm
[root@jseijo-p42 ~]# dnf install php-fpm php-common php-cli
[root@jseijo-p42 ~]# php -v
[root@jseijo-p42 ~]# systemctl enable php-fpm.service
[root@jseijo-p42 ~]# systemctl start php-fpm.service
[root@jseijo-p42 ~]# systemctl status php-fpm.service
[root@jseijo-p42 ~]# dnf install php-mysqlnd php-pdo php-gd php-mbstring
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
listen = /run/php-fpm/www.sock
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
[root@jseijo-p42 ~]# sudo setsebool -P httpd_can_network_connect_db 1
[root@jseijo-p42 ~]# sudo systemctl start php-fpm.service
[root@jseijo-p42 ~]# sudo systemctl enable php-fpm.service
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

<h2 id="Wordpress">
Wordpress
</h2>

```console
[root@jseijo-p42 ~]# wget http://wordpress.org/latest.tar.gz
[root@jseijo-p42 ~]# tar -xzvf latest.tar.gz
[root@jseijo-p42 ~]# mv wordpress/wp-config-sample.php wordpress/wp-config.php
[root@jseijo-p42 ~]# sudo cp -r wordpress/* /var/www/html
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
[root@jseijo-p42 ~]# sudo chmod -R 755 /var/www/html/wordpress
[root@jseijo-p42 ~]# sudo chcon -R -t httpd_sys_rw_content_t /var/www/html/wordpress
[root@jseijo-p42 ~]# password: ZXAb2bU3(NYr#0CGCl
[root@jseijo-p42 ~]# 10.12.250.174/wp-admin
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
Fail2Ban (bonus)
</h2>

- Helps prevetn brute-force attacks
- watches logs for authentication failure
- Create firewall rules to block IP addresses
- Able to protect multiple services
- Completely customizable

```console
[root@jseijo-p42 ~]# dnf install fail2ban
[root@jseijo-p42 ~]# systemctl start fail2ban
[root@jseijo-p42 ~]# systemctl enable fail2ban
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
