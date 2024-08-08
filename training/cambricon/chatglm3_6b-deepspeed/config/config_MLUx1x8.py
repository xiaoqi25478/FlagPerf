seqlength = 4096
batchsize = 1
datafilename = "openwebtext_chatglm3_100M.npy"
FLOPS_DIR='../../../../'
import sys
sys.path.append(FLOPS_DIR)
from MLU_FP16_FLOPS import MLU_FP16_FLOPS
theoryflops = float(MLU_FP16_FLOPS)
epochs = 1
flashattn = True
