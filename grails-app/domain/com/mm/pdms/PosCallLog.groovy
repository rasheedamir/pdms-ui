package com.mm.pdms

class PosCallLog {

	Integer kfStoreId
	String posNumber
	Date dateCreated
	String terminalSerialNumber
	String ipAddress
	String hostName
	String posManufacturerName
	String posVersion
	
    static constraints = {
		kfStoreId (blank: false)
		packageVersion (blank: false)
		terminalSerialNumber (nullable: true)
		posNumber (nullable: true)
		posManufacturerName (nullable: true)
		posVersion (nullable: true)
		ipAddress ()
		hostName ()
		dateCreated ()
    }
	
	static belongsTo = [ packageVersion : PackageVersion ]
	
	static hasMany = [posAssemblyLogs : PosAssemblyLog ]
	
	String toString(){
		id
	}
}
