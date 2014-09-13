#!/system/bin/sh
sf_pid=$(pidof surfaceflinger)
while [ -z $sf_pid ]; do
        log -p i -t slowdown "Waiting for service surfaceflinger..."
    sleep 1
    sf_pid=$(pidof surfaceflinger)
done

log -p i -t slowdown "Stop: surfaceflinger..."
#echo $sf_pid > /dev/cpuctl/slowdown/tasks
#ionice -c 3 -p $sf_pid
#renice 20 -p $sf_pid
kill -19 $sf_pid

nd_status=4
while [ $nd_status -eq 4 ]; do
    sleep 1;
    ndc interface list > /dev/null 2>&1
    nd_status=$?
done

log -p i -t slowdown "Continue: surfaceflinger"

#echo $sf_pid > /dev/cpuctl/tasks
#cat /dev/cpuctl/slowdown/tasks > /dev/cpuctl/tasks
#ionice -c 0 -p $sf_pid
#renice 0 -p $sf_pid
kill -18 $sf_pid

