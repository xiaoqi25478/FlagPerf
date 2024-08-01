export MLU_VISIBLE_DEVICES=0
LOG_PATH=`pwd`/run_log
cnperf-cli record -o record_log cnvs -r memory_bandwidth -c `pwd`/cnvs.example.yml 2>&1 | tee ${LOG_PATH}
cnperf-cli report -i record_log
value=$(grep "read" "$LOG_PATH" | awk '{print $2}')
echo "[FlagPerf Result]main_memory-bandwidth=${value} GB/s"
rm -rf cnvs_stats ${LOG_PATH} #删除缓存文件