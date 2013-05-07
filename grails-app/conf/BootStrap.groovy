import com.mm.pdms.*
import grails.util.Environment

class BootStrap {
	
    def init = { servletContext ->
		
		switch (Environment.current) {
			
			case Environment.DEVELOPMENT:
				createAdminUserIfRequired()
				createRolesIfRequired()
				break;

			case Environment.PRODUCTION:
				createAdminUserIfRequired()
				createRolesIfRequired()
				break;			
		}
    }
	
    def destroy = {
    }
	
	/**
	 * Create admin user
	 */
	void createAdminUserIfRequired() {
		if (!User.findByUsername("admin")) {
			println "Fresh Database. Creating ADMIN user."
	        def adminUser = new User(
	                username: 'admin',
	                password: 'admin',
	                enabled: true).save(failOnError: true)
			def adminRole = Role.findByAuthority('ROLE_ADMIN')
			if (!adminUser.authorities.contains(adminRole)) {
				UserRole.create adminUser, adminRole
			}
		} else {
			println "Existing admin user, skipping creation"
		}
	}
	
	/**
	 * Create roles if required
	 */
	void createRolesIfRequired() {
		def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
	}
}

