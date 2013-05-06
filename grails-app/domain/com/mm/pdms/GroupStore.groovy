package com.mm.pdms

class GroupStore {

	Integer kfStoreId
	Date dateCreated

    static constraints = {
		kfStoreId (blank:false) 
		kfGroup ()
		dateCreated ()
    }
	
	static belongsTo = [ kfGroup : KfGroup ]
}
