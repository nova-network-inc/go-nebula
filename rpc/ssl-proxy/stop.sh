#!/bin/bash
ps aux | grep 'node index.js' | grep -v grep | awk '{print $2}' | xargs kill -9