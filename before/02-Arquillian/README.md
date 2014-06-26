# Java EE 6 Advanced Training - Arquillian

In this module you will write Arquillian tests for the JSF backing beans and REST endpoints. 

## Install the Arquillian Addon on Forge

* In Forge, execute the following command `addon-install-from-git --url https://github.com/aslakknutsen/plugin-arquillian.git  --branch forge2`

## Generate the project with JBoss Forge

* Launch JBoss Forge (enter the `$FORGE_HOME/bin/forge` command)
* Go to the `cdbookstore` directory
* Make sure the `jbossHome` variable in `before/02-Arquillian/generate.fsh` is pointing to `$WILDFLY_HOME`
* Execute the `generate.fsh` script with the command `run ../before/02-Arquillian/generate.fsh` 

# DOJO - Write the JSF backing bean tests

## Write the JSF backing bean tests

* Copy the files `CustomerBeanTest.java`, `PublisherBeanTest.java` and `MusicianBeanTest.java` to the `view` package
* `cp ../before/02-Arquillian/CustomerBeanTest.java src/test/java/org/agoncal/training/javaee6adv/view`
* `cp ../before/02-Arquillian/PublisherBeanTest.java src/test/java/org/agoncal/training/javaee6adv/view`
* `cp ../before/02-Arquillian/MusicianBeanTest.java src/test/java/org/agoncal/training/javaee6adv/view`
* Code the other tests following the same logic until all the tests pass
* Add the methods `should_crud` and `should_paginate` to every test

## Execute the tests in a remote environment

* Start WildFly (`$WILDFLY_HOME/bin/standalone.sh`)
* Make sure WildFly has enough memory `-Xms64m -Xmx1024m -XX:MaxPermSize=512m -Djava.net.preferIPv4Stack=true`
* `mvn -Parquillian-wildfly-remote test` will execute the tests with WildFly up and running and with the application deployed
* If you have the following error, it's because you are not using the Arquillian Maven profile `DeploymentScenario contains a target (_DEFAULT_) not matching any defined Container in the registry`
* `NoClassDefFoundError` means that your ShrinkWrap packaging misses some classes (check the `createDeployment` method) 
* `ConstraintViolationException` is thrown when the entity is not valid

# DOJO - Write the REST endpoints tests

## Write the REST endpoints tests

* Copy the files `CustomerEndpointTest.java` and `MusicianEndpointTest.java` to the `rest` package
* `cp ../before/02-Arquillian/CustomerEndpointTest.java src/test/java/org/agoncal/training/javaee6adv/rest`
* `cp ../before/02-Arquillian/MusicianEndpointTest.java src/test/java/org/agoncal/training/javaee6adv/rest`
* Code the other tests following the same logic until all the tests pass
* Notice that the Arquillian tests are `@RunAsClient` and that they package a `WebArchive` (instead of a `JarArchive`) in `@Deployment(testable = false)`
* Package the `persistence.xml` as a resource and the `beans.xml` as WEB-INF resource
* Inject the `baseURL` as an `@ArquillianResource` instead of injecting the bean

## Execute the tests in a remote environment

* Start WildFly (`$WILDFLY_HOME/bin/standalone.sh`)
* Make sure WildFly has enough memory `-Xms64m -Xmx1024m -XX:MaxPermSize=512m -Djava.net.preferIPv4Stack=true`
* `mvn -Parquillian-wildfly-remote test` will execute the tests with WildFly up and running and with the application deployed
* If you have the following error, it's because you are not using the Arquillian Maven profile `DeploymentScenario contains a target (_DEFAULT_) not matching any defined Container in the registry`
* `NoClassDefFoundError` means that your ShrinkWrap packaging misses some classes (check the `createDeployment` method) 
* `ConstraintViolationException` is thrown when the entity is not valid

## Debug the tests if needed

* Make sure WildFly has the debug settings `JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,address=8787,server=y,suspend=n"`

## Execute the tests in a managed environment

* Stop WildFly
* Make sure the `jbossHome` variable in `cdbookstore/src/test/resources/arquillian.xml` is pointing to `$WILDFLY_HOME`
* `mvn -Parquillian-wildfly-managed test` will execute the tests managing WildFly

## Build the application

* Use Maven and build the application with `mvn clean install`

## Deploy the application on WildFly application server

* Start WildFly (`$WILDFLY_HOME/bin/standalone.sh`)
* Make sure WildFly has enough memory `-Xms64m -Xmx1024m -XX:MaxPermSize=512m -Djava.net.preferIPv4Stack=true`
* Go to the [admin console](http://localhost:9990/)
* Deploy the `cdbookstore/target/cdbookstore.war` file in _Runtime -> Manage Deployments -> Add -> Enable_

## Check the web application

* With a browser go to [http://localhost:8080/cdbookstore]()

# Restitution

* Tests can use container services such as Injection
* `@RunAsAclient`
* Configuration in arquillian.xml
* Profile in pom.xml

# Backup your code

* Save a backup of your code at `../after/02-Arquillian/`