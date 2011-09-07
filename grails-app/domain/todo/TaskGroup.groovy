package todo

class TaskGroup {
	
	String name	
	String description
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		name nullable:false, blank: false
    }
	
	static hasMany = [tasks: Task]
}