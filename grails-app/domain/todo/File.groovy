package todo

import java.sql.Blob

class File {
	
	String name
	Blob fileContent
	
	// auto populated fields
	Date dateCreated
	Date lastUpdated

	static belongsTo = [task : Task]
	
    static constraints = {
		name nullable: false, blank: false
		fileContent nullable: false
    }
	
	String toString() {
		name
	}
}
