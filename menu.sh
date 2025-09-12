#!/bin/bash
if pgrep -x wofi; then killall wofi; else wofi; fi
