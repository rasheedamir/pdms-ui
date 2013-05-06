package com.mm.pdms

class PosAssemblyLog {

	String assemblyName
	String assemblyVersion
	Date dateCreated
	
    static constraints = {
		assemblyName (blank: false)
		assemblyVersion (blank: false)
		posCallLog ()
		dateCreated ()
    }
	
	static belongsTo = [ posCallLog : PosCallLog ]
}
