package com.mm.pdms

class KfGroup {
	
	String name
	Date dateCreated

    static constraints = {
		name (blank:false)
		dateCreated ()
    }
	
	static hasMany = [ groupStores : GroupStore, packageGroups : PackageGroup ]
	
	String toString(){
		name
	}
}
