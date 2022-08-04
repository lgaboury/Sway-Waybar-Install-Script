#!/bin/sh

free -h | awk '/Mem:/{printf $3"\n"}'
