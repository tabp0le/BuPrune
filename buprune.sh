#!/bin/bash
#############################################
############# Clean Shit Up #################
############## by tabp0le ###################
#############################################
#############################################

### Settings ###

logfile="/tmp/prune.log";
prunepath=""
days=30
recursive=1
dryrun=1

### End Settings ###

recurse="$prunepath"
norecurse="$prunepath -maxdepth 1"

if [ $recursive -eq "1" ]
  then
    export pp=$recurse
  else
    export pp=$norecurse
fi

echo 'Begin scheduled pruning' >> $logfile
echo $(date) >> $logfile
echo 'Deleting the following files:' >> $logfile
find $pp -mtime +$days -type f >> $logfile

if [ $dryrun -eq "1" ]
  then
    echo 'DRY RUN' >> $logfile
  else
    find $pp -mtime +$days -type f -delete >> $logfile
fi

echo 'Scheduled pruning complete' >> $logfile
echo $(date) >> $logfile
