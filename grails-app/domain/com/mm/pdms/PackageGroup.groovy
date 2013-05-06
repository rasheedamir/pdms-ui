package com.mm.pdms

class PackageGroup {

	Date dateActivation
	Date dateCreated
	
    static constraints = {
		packageVersion ()
		kfGroup ()
		dateActivation (blank:false)
		dateCreated ()
    }
	
	static belongsTo = [ kfGroup : KfGroup, packageVersion : PackageVersion ]
}
