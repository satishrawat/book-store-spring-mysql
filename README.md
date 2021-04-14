## We are running a spring boot application with mysql database 
##Step 1 . launch a mysql container with public image .


docker run -d -p 6033:3306 --name=docker-mysql --env="MYSQL_ROOT_PASSWORD=root" --env="MYSQL_PASSWORD=root" --env="MYSQL_DATABASE=book_manager" mysql

##Now we are importing the some data using mysql database script .
##script is placed in Github repo https://github.com/satishrawat/book-store-spring-mysql/tree/main/sql/book_manager.sql 



docker exec -i docker-mysql mysql -uroot -proot book_manager <book_manager.sql 

##Clone the code from here ..    https://github.com/satishrawat/book-store-spring-mysql.git

##Now we have to build the code with Gradle 


gradle build 


##after succesfull build we have to build the docker image ( it will copy the newly build jar into docker image )


docker build -f Dockerfile -t satishrawat/book_manager_app .

##The --link command will allow the book_manager_app container to use the port of MySQL container and -t  stands for--tty, which will allocate a pseudo-terminal.



docker run -t --link docker-mysql:mysql -p 10222:10222 satishrawat/book_manager_app

Now we can access our application with http://localhost:10222/book


That's it 


