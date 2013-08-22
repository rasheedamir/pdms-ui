dataSource {
	//H2
	// driverClassName = "org.h2.Driver"
	// username = "sa"
	// password = ""
	
	//MYSQL
    // pooled = true
	// driverClassName = "com.mysql.jdbc.Driver"
	// dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
	
	//ORACLE
	pooled = true
	driverClassName = "oracle.jdbc.driver.OracleDriver"
	dialect= "org.hibernate.dialect.OracleDialect"
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}

// environment specific settings
environments {
	//ORACLE
	development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
			url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"
			username = "root"
			password = "root"
			
			properties {
				maxActive = -1
				minEvictableIdleTimeMillis=1800000
				timeBetweenEvictionRunsMillis=1800000
				numTestsPerEvictionRun=3
				testOnBorrow=true
				testWhileIdle=true
				testOnReturn=true
				validationQuery="SELECT 1 FROM dual"
			}
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"
			username = "root"
			password = "root"
			
			properties {
				maxActive = -1
				minEvictableIdleTimeMillis=1800000
				timeBetweenEvictionRunsMillis=1800000
				numTestsPerEvictionRun=3
				testOnBorrow=true
				testWhileIdle=true
				testOnReturn=true
				validationQuery="SELECT 1 FROM dual"
			}
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"
			username = "root"
			password = "root"
			
			properties {
				maxActive = -1
				minEvictableIdleTimeMillis=1800000
				timeBetweenEvictionRunsMillis=1800000
				numTestsPerEvictionRun=3
				testOnBorrow=true
				testWhileIdle=true
				testOnReturn=true
				validationQuery="SELECT 1 FROM dual"
			}
		}
	}
	
	//MYSQL
	/*development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
			url = "jdbc:mysql://localhost/pdms_dev?useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = "root"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/pdms_dev?useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = "root"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/pdms_prod?useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = "root"
		}
	}*/
	
	//H2
    /*development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }*/
}
