#!/bin/bash

set -v
# set -e

DB2_HOME=/opt/ibm/db2/V9.7

if [ ! -d $DB_HOME ]; then
  echo "DB2_HOME $DB2_HOME is not a valid directory."
  exit 1
fi

#
# If the instance already exists, drop it because we're going to recreate it.
#

$DB2_HOME/instance/db2idrop db2x
$DB2_HOME/instance/dasdrop 

#
# Drop the users associated with the instance
# (2> /dev/null is used since we don't want to see errors if they don't exist)
#

/usr/sbin/userdel -f -r db2x 2> /dev/null
/usr/sbin/userdel -f -r db2xf 2> /dev/null
/usr/sbin/userdel -f -r db2das 2> /dev/null
/usr/sbin/groupdel db2x 2> /dev/null
/usr/sbin/groupdel db2xf 2> /dev/null
/usr/sbin/groupdel db2das 2> /dev/null 

#
# Create the users associated with the instance
#

set -e
/usr/sbin/useradd -u 2300 -c'db2 das' --create-home --shell "/bin/bash" db2das
/usr/sbin/useradd -u 2301 -c'db2 instance' --create-home -G db2das --shell "/bin/bash" db2x
/usr/sbin/useradd -u 2302 -c'db2 fenced' --create-home -G db2das --shell "/bin/bash" db2xf

#
# Create the instance
#

#  DB2 instance password
PASSWORD=$(/usr/bin/openssl passwd -1 dba)
/usr/sbin/usermod -p $PASSWORD db2x
/usr/bin/chage -M -1 db2x

$DB2_HOME/instance/dascrt -u db2das  
$DB2_HOME/instance/db2icrt -p 5704 -u db2xf db2x
