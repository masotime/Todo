package todo

import java.util.Date;

class Action {
	
	boolean taken = false	
	String description
	boolean waiting = false
	String waitingFor
	Person waitingOn
	Integer order = 999
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [task: Task]
	
    static constraints = {
		taken nullable: false		
		description nullable: false, maxsize: 1000
		waiting nullable: false
		waitingFor nullable: true, blank: true
		waitingOn nullable: true, blank: true
		order nullable: false
    }
	
	static mapping = {
		order column: "`ORDER`"
	}
	
	String toString() {
		description
	}
}