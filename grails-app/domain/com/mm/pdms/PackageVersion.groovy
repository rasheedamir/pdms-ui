package com.mm.pdms

class PackageVersion {

	String versionNumber
	String packagePath
	String comment
	Date dateCreated

	static constraints = {
		versionNumber (blank:false)
		packagePath (blank:false)
		comment (nullable: true, maxSize : 1000)
		dateCreated ()
    }
	
	static hasMany = [packageGroups : PackageGroup, posCallLogs : PosCallLog ]
	
	String toString(){
		versionNumber
	}
}