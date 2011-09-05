package todo

class Task {
	
	String title
	String description
	Date dateAssigned
	Date completeBy
	Person assignedBy	
	String notes
	Integer priority = 999
	
	// auto populated
	Date dateCreated
	Date lastUpdated

    static constraints = {
		title maxSize: 400
		description maxSize: 1000
		dateAssigned nullable: false
		completeBy nullable: true
		assignedBy nullable: true
		notes nullable: true, blank: true, maxSize: 4000
		priority nullable: false
		
    }	
	
	static hasMany = [files: File]
}
