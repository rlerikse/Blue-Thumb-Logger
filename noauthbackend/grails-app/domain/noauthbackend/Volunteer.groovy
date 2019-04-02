package noauthbackend
import grails.rest.*

@Resource(uri='/volunteer')
class Volunteer {

    static belongsTo = [sample:noauthbackend.Sample]
    String name
    String hours
    String activity

    static constraints = {
        name nullable: true
        hours nullable: true
        activity nullable: true
    }
}
