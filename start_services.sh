#!/bin/bash
service ssh start
python run.py
tail -f /dev/null