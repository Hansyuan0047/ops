#!/bin/bash

# 配置初始化参数变量
export SYSDBA_PWD=${SYSDBA_PWD:-Admin@123}
export DATA_PATH=${DATA_PATH:-/data}
export PAGE_SIZE=${PAGE_SIZE:-32}
export EXTENT_SIZE=${EXTENT_SIZE:-32}
export CASE_SENSITIVE=${CASE_SENSITIVE:-n}
export LENGTH_IN_CHAR=${LENGTH_IN_CHAR:-1}
export CHARSET=${CHARSET:-0}
export DB_NAME=${DB_NAME:-dmdb}
export INSTANCE_NAME=${INSTANCE_NAME:-dmserver}
export PORT_NUM=${PORT_NUM:-5236}
# 初始化参数
export DMINIT_OPTS=${DMINIT_OPTS:-path=${DATA_PATH} PAGE_SIZE=${PAGE_SIZE} EXTENT_SIZE=${EXTENT_SIZE} CASE_SENSITIVE=${CASE_SENSITIVE} LENGTH_IN_CHAR=${LENGTH_IN_CHAR} CHARSET=${CHARSET} DB_NAME=${DB_NAME} INSTANCE_NAME=${INSTANCE_NAME} PORT_NUM=${PORT_NUM} SYSDBA_PWD=${SYSDBA_PWD}}

## 初始化配置
if [ ! -d "${DATA_PATH}/${DB_NAME}" ]; then
    echo -e "\033[1;3$((RANDOM%10%8))m 开始初始化达梦数据库... \033[0m"
    echo "dminit ${DMINIT_OPTS}"
    dminit ${DMINIT_OPTS}
    echo -e "\033[1;3$((RANDOM%10%8))m 初始化达梦数据库完成！ \033[0m"
fi

## 启动达梦数据库
echo -e "\033[1;3$((RANDOM%10%8))m 启动达梦数据库... \033[0m"
dmserver /data/dmdb/dm.ini -noconsole
