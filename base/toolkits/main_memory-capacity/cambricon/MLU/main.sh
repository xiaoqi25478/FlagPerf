export MLU_VISIBLE_DEVICES=0
LOG_PATH=`pwd`/run_log
pushd /usr/local/neuware/samples/cnrt && mkdir -p build && pushd build && cmake .. && make -j20 && pushd bin 
for i in $(seq 1 2)  
do
    echo ${i}
    cnperf-cli record -o record_log ./basic_device_info 2>&1 | tee ${LOG_PATH}
    cnperf-cli report -i record_log
done
value=$(grep "Device 0 has avaliable memory in MB" "$LOG_PATH" | awk '{print $8}')
echo "[FlagPerf Result]main_memory-capacity=${value} MiB"
rm -rf ${LOG_PATH} #删除缓存文件
popd && popd && popd