#!/bin/sh
./bin/liquibase --driver=com.mysql.jdbc.Driver \
	--classpath=driver/mysql-connector-java-5.1.31-bin.jar \
	--changeLogFile=changelogs/master.changelog.xml \
	--url="jdbc:mysql://localhost:3306/futurequest" \
	--username=root \
	--password=root \
	update;