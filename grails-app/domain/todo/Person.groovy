package todo

class Person {
	
	String name
	String email
	String telephone

    static constraints = {
		name nullable: false, blank: false
		email email: true, nullable: true, blank: true
		telephone nullable: true, blank: true
    }
	
	String toString() {
		name
	}
}
