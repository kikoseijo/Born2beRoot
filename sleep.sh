#!/bin/bash
sleep $(last reboot -F | head -1 | awk '{print $8}' | tr ':' ' ' | awk '{printf("%d", (($2%10)*60)+$3)}')
