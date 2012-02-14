#!/bin/bash

AUTHOR=hernad@bring.out
VER=1.0.1
DATE=14.02.2012

echo $AUTHOR,  $VER, $DATE


USER=bringout
EXE_PATH="C:\\Program Files\\Datecs Applications\\FPrint WIN\\FPrint.exe"
FISC_DIR=/home/$USER/.wine/drive_c/fiscal

PATH=/usr/bin:/usr/sbin:/bin:/usr/local/sbin:/usr/local/bin


usage () 
{
  echo usage: $0 start ili stop
}


start () {


echo rm logs
rm /tmp/Xvfb_101.log
rm /tmp/FPrint_wine.log

echo start XvFb
export DISPLAY=:101  
echo run: su - $USER -c 'Xvfb :101 -ac &'
su - $USER -c "Xvfb :101 -ac &> /tmp/Xvfb_101.log&"
echo run: sleep 5
sleep 5
echo run: su - $USER -c "wine '$EXE_PATH'"
su - $USER -c "wine '$EXE_PATH' &> /tmp/FPrint_wine.log&" > /dev/null

}

stop () {

echo ubijam sve Xvfb procese i njihove aplikacije
killall wine
killall Xvfb
killall FPrint.exe

CNT=`ps ax | grep "FPrint" | grep -c -v "grep"`

if [ $CNT -eq 0 ]
then
  echo "uspjesno ubijen Xvfb ... bye ..."
  
else
  echo "CNT proces Xvfb = $CNT ?!"
  
fi

}

restart () {

stop 
start 
status

}

status() {

echo "status:"
echo "---------------------------------------------------------------"

ps ax | grep "Xvfb" | grep -v "grep"
ps ax | grep "FPrint" | grep  -v "grep"
ps ax | grep "smbd" | grep  -v "grep"

echo " "
echo " "
echo "fiscal root dir $FISC_DIR:"
echo "---------------------------------------------------------------"
ls -l  $FISC_DIR
echo " "
echo " "
echo "fiscal answer dir $FISC_DIR/answer:"
echo "---------------------------------------------------------------"
ls -l  $FISC_DIR/answer
echo " "
echo " "

let CNT=`ps ax | grep "Xvfb" | grep -c -v "grep"`
let CNT=CNT+`ps ax | grep "FPrint" | grep  -c -v "grep"`
let CNT=CNT+`ps ax | grep "smbd" | grep  -c -v "grep"`

if [ $CNT -gt 2 ]
then
  echo "FPrint wine app status OK, cnt = $CNT"
  exit 0
else
  echo "FPrint not started !"
  exit -1
fi


}

if [ "$1" == "" ]
then
    usage
    exit -1
fi


case "$1" in

   start )
        start  
        ;;

   stop )

       stop 
       ;;
   
   status )

      status 
      ;;
   restart )
      
      restart 
      ;;
    
esac

