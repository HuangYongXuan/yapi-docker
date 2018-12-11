#!/usr/bin/env bash

# yapi初始化后会有一个init.lock文件
lockPath="/my-yapi/init.lock"

if [ ! -f "$lockPath" ]
then
    yapi server
else
    yapi server
fi