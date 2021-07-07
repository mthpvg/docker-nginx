#!/bin/bash

set -e

pwd=$(pwd)

cd client

prompt="Please select a file, to remove type its number:"
PS3="$prompt "

options=( $(ls) )

select opt in "${options[@]}" "ABORT" ; do
    if (( REPLY == 1 + ${#options[@]} )) ; then
        exit

    elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
        echo  "You picked $opt which is file $REPLY"
        break

    else
        echo "Invalid option. Try another one."
    fi
done

echo "Cleaning $(pwd)"
rm -rf $opt

echo "Going back to:"
cd -

cd nginx
echo "Cleaning $(pwd)"
rm -rf $opt.conf

echo "Going back to:"
cd -

cd /var/www
echo "Cleaning $(pwd)"
rm -rf $opt

echo "Going back to:"
cd -

cd /etc/nginx/sites-available
echo "Cleaning $(pwd)"
rm -rf $opt.conf

echo "Going back to:"
cd -

cd /etc/nginx/sites-enabled
echo "Cleaning $(pwd)"
rm -rf $opt.conf

echo "Going back to:"
cd -

cd /etc/letsencrypt/archive
echo "Cleaning $(pwd)"
rm -rf $opt

echo "Going back to:"
cd -

cd /etc/letsencrypt/live
echo "Cleaning $(pwd)"
rm -rf $opt

echo "Going back to:"
cd -

cd /etc/letsencrypt/renewal
echo "Cleaning $(pwd)"
rm -rf $opt.conf

echo "-------"
echo "-------"
echo 'You might want to stop the pm2 process if it exists.'
echo 'pm2 stop $opt'
echo 'delete $opt'
echo "-------"
echo "-------"