callCurl(){
    for i in `seq 1 $1`
    do 
        curl $2 $3 && echo "\n" &
    done
}

TIMES=1
for i in $(eval echo "{1..$TIMES}")
do
    callCurl 10 http://localhost:8000/
    callCurl 5 http://localhost:8000/io_task
    callCurl 5 http://localhost:8000/cpu_task
    callCurl 3 http://localhost:8000/random_sleep
    callCurl 10 http://localhost:8000/random_status
    callCurl 3 http://localhost:8000/chain
    callCurl 1 http://localhost:8000/error_test
    sleep 5
done

wait
echo "\nFinished"