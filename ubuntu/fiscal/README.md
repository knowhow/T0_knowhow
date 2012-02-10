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
hernad@bring.out, 0.9.9, 10.02.2012
status:
--------------------
 3962 pts/0    S      0:03 Xvfb :101 -ac
 3966 pts/0    S      0:02 C:\Program Files\Datecs Applications\FPrint WIN\FPrint.exe                                      
FPrint wine app status OK
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

