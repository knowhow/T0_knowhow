# ubuntu host podrška fiskalnim uređajima

## FPrint neosoft

root@malisa:~# /usr/local/sbin/fprint.sh start
<pre>
hernad@bring.out, 0.9.9, 10.02.2012
rm logs
start XvFb
run: su - bringout -c Xvfb :101 -ac &
run: sleep 5
run: su - bringout -c wine 'C:\Program Files\Datecs Applications\FPrint WIN\FPrint.exe'
</pre>


root@malisa:~# /usr/local/sbin/fprint.sh status
<pre>
hernad@bring.out, 1.0.0, 10.02.2012
status:
---------------------------------------------------------------
 4273 pts/0    S      0:04 Xvfb :101 -ac
 4277 pts/0    S      0:05 C:\Program Files\Datecs Applications\FPrint WIN\FPrint.exe                                      
  645 ?        Ss     0:00 smbd -F
  719 ?        S      0:00 smbd -F
  842 ?        S      0:00 smbd -F
 1209 ?        S      0:00 smbd -F
 
 
fiscal root dir /home/bringout/.wine/drive_c/fiscal:
---------------------------------------------------------------
ukupno 4
drwxr-xr-x 2 bringout bringout 4096 2012-02-10 14:33 answer
 
 
fiscal answer dir /home/bringout/.wine/drive_c/fiscal/answer:
---------------------------------------------------------------
ukupno 4
-rw-r--r-- 1 bringout bringout 102 2012-02-10 14:33 b3.txt
 
 
FPrint wine app status OK, cnt = 6                                   
</pre>


root@malisa:~# /usr/local/sbin/fprint.sh stop
<pre>
hernad@bring.out, 0.9.9, 10.02.2012
ubijam sve Xvfb procese i njihove aplikacije
wine: no process found
uspjesno ubijen Xvfb ... bye ...
</pre>


root@malisa:~# /usr/local/sbin/fprint.sh status
<pre>
hernad@bring.out, 0.9.9, 10.02.2012
status:
--------------------
FPrint not started !
</pre>

### ubuntu-32 lucid 10.04

root@malisa:~# uname -a
<pre>
Linux malisa 2.6.32-21-generic #32-Ubuntu SMP Fri Apr 16 08:10:02 UTC 2010 i686 GNU/Linux
</pre>

root@malisa:~# lsb_release -a
<pre>
Distributor ID: Ubuntu
Description:    Ubuntu 10.04 LTS
Release:    10.04
Codename:   lucid
</pre>

