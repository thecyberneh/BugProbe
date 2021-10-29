shc -f tools.sh
mv tools.sh.x tools
chmod 777 tools 
shc -f bugprobe.sh   
mv bugprobe.sh.x bugprobe  
chmod 777 bugprobe
./tools
