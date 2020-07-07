# cookit

 쿡킷 개발문서입니다. :rocket:

### Coding Guide

----

* **File naming**: snake_case (<span style="color:red">**html, css , jsp**</span> 파일만 해당합니다. + dto 변수)
* **default naming**: CamelCase (java class,  ...... )

 :star: <u>jsp와 servlet으로 mvc 모델 구현</u>


### Structure

-----

#### Directory

```java
cookit/src
    /com
    		/javalec
    		    /ex
    			/BCommand
    			/BDao
    			/BDto
    			/BFront
	/resources
	/WebContent
	  /upload
		/css
		/js
		/images
		/WEB-INF
		    ㄴweb.xml
		    /lib
		    ㄴcos.jar
		    ㄴjstl.jar
		    ㄴojdbc6_g.jarojdbc6_g.jar
		    ㄴstandard.jar
		ㄴviews(jsp)
    ..._ok.jsp : 처리 결과값 혹은 확인창
```

#### Data

* DTO - DAO - ...Command - Command(interface) - BFront(Contoller) 구조 사용합니다.

  * DTO : **class**

  * DAO : Context > DataSource > Connection > PreparedStatement > sql - ResultSet or int

  * ...Command: **class**

  * Command(interface): **interface**
  
       >...Command : **class**
      
  * BFront: **class**



### Devlopment Environment

-----

* 개발 OS: Windows7
* 개발 언어: Java , JavaScript, JSP, HTML5 , CSS, Servlet ..
* 개발 IDE: Eclipse 2019
* DB: Oracle database 11g
* 개발/빌드 도구  : Sql Developer



### Setting Guide

----
fileUpload :cos.jar , standard.jar
jstl : jstl.jar
db : ojdbc6_g.jar

