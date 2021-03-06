#!/bin/bash
# set -x
if [ $# -lt 3 ]; then
    echo "usage: $0 num_servers num_workers bin [args..]"
    exit -1;
fi

export DMLC_NUM_SERVER=$1
shift
export DMLC_NUM_WORKER=$1
shift
bin=$1
shift
arg="$@"

export PS_VERBOSE=0

# start the scheduler
export DMLC_PS_ROOT_URI='172.19.0.101'
export DMLC_PS_ROOT_PORT=30000


# start servers
export DMLC_ROLE='server'
echo "Run $DMLC_ROLE..."
${bin} ${arg}
#for ((i=0; i<${DMLC_NUM_SERVER}; ++i)); do
#    export HEAPPROFILE=./S${i}
#    ${bin} ${arg}
#done

# start workers
#export DMLC_ROLE='worker'
#for ((i=0; i<${DMLC_NUM_WORKER}; ++i)); do
#    export HEAPPROFILE=./W${i}
#    ${bin} ${arg} &
#done

wait
