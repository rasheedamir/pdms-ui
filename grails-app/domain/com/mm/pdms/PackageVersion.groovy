package com.mm.pdms

class PackageVersion {
	
	String versionNumber
	String packagePath
	String packageComment
	Date dateCreated
	
	static searchable = true
	
	static constraints = {
		versionNumber (blank:false)
		packagePath (blank:false)
		packageComment (nullable: true, maxSize : 1000)
		dateCreated ()
    }
	
	static hasMany = [packageGroups : PackageGroup, posCallLogs : PosCallLog ]
	
	String toString(){
		versionNumber
	}
}