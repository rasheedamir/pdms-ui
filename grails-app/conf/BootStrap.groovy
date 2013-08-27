import org.junit.internal.runners.statements.FailOnTimeout;

import com.mm.pdms.*

import grails.util.Environment

class BootStrap {
	
    def init = { servletContext ->
		
		switch (Environment.current) {
			
			case Environment.DEVELOPMENT:
				//createRolesIfRequired()
				createAdminUserIfRequired()
				break;

			case Environment.PRODUCTION:
				//createRolesIfRequired()
				createAdminUserIfRequired()
				break;			
		}
    }
	
    def destroy = {
    }
	
	/**
	 * Create admin user
	 */
	void createAdminUserIfRequired() {
		if (!ApplicationUser.findByUsername("admin")) {
			println "Fresh Database. Creating ADMIN user."
	        def adminUser = new ApplicationUser(
	                username: 'admin',
	                password: 'admin',
	                enabled: true).save(failOnError: true)
					
			def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
			println "userRole: " + userRole
			def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
			println "adminRole: " + adminRole			

			UserRole.create adminUser, adminRole, true
			UserRole.create adminUser, userRole, true
			println "Both roles 'ROLE_ADMIN' & 'ROLE_USER' are assigned to 'ADMIN'"
			
		} else {
			println "Existing admin user, skipping creation"
		}
	}
	
	/**
	 * Create roles if required
	 */
	void createRolesIfRequired() {
		def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
		println "userRole: " + userRole
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
		println "adminRole: " + adminRole
	}
}

