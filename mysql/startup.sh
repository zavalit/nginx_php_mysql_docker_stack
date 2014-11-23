if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    if [ ! -f /usr/share/mysql/my-default.cnf ] ; then
        cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf
    fi
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"
    echo "=> Creating admin user ..."
   
    /usr/bin/mysqld_safe > /dev/null 2>&1 &
    RET=1
    while [[ RET -ne 0 ]]; do
       echo "=> Waiting for confirmation of MySQL service startup"
       sleep 5
       mysql -uroot -e "status" > /dev/null 2>&1
       RET=$?
    done

    mysql -uroot -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION"
    mysql -uroot -e "CREATE DATABASE ${DB_NAME}"

    mysqladmin -uroot shutdown

    echo "=> Done!"
else
    echo "=> Using an existing volume of MySQL"
fi

/usr/bin/mysqld_safe
