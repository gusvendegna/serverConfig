#!/bin/bash
# -anv means archive, dry run, and backup (keep one copy of any pre-existing files)
rsync -avb --suffix .$(date +%Y%m%d) /home/gus/testing/source /home/gus/testing/destination