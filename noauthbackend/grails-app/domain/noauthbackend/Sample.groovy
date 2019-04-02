package noauthbackend
import grails.rest.*

@Resource(uri='/sample')
class Sample {

    static hasMany = [volunteers:noauthbackend.Volunteer]

    String airTemp
    String ammoniaBlank
    String ammoniaNTest1
    String ammoniaNTest2
    String chlorideBlank
    String chlorideTest1
    String chlorideTest2
    Boolean clean
    Boolean deadAnimal
    String dish1
    String dish2
    String dish3
    String do1
    String do2
    Boolean exoticSPP
    Boolean fishKill
    Boolean floatingDetritus
    Boolean flowAlteration
    Boolean foamSlashScum
    Boolean habitatAlteration
    Boolean ironPercipitates
    String lat
    String lng
    String legal
    Boolean manureInStream
    String nitrateTest1
    String nitriteTest1
    String nitriteTest2
    String nitroComments
    Double numberOfVolunteers
    String observationComments
    Boolean offensiveOdor
    Boolean oilyFileGrease
    String orthoBlankPhosphorus
    String orthoPHTest1
    String orthoPHTest2
    String ph1
    String ph2
    String phComments
    Boolean recentCattleActivity
    String sampleVolume
    String sampler1
    String sampler2
    String secciDepth
    Boolean significantAlgae
    Boolean siltation
    String siteName
    String status       /* used in backend only - UNSUBMITTED, SUBMITTED, DENIED, ACCEPTED */
    String stageQualifier
    String streamStage
    String timestamp    /* key */
    Boolean trash
    Boolean unsightlyColor
    String waterTemp
    String wbid         /* key */
    String weather
    String windDir
    String windSpeed

    static constraints = {
        wbid blank: false, nullable: false
        timestamp blank: false, nullable: false
        airTemp  nullable: true
        ammoniaBlank  nullable: true
        ammoniaNTest1  nullable: true
        ammoniaNTest2  nullable: true
        chlorideBlank  nullable: true
        chlorideTest1  nullable: true
        chlorideTest2  nullable: true
        clean  nullable: true
        deadAnimal  nullable: true
        dish1  nullable: true
        dish2  nullable: true
        dish3  nullable: true
        do1  nullable: true
        do2  nullable: true
        exoticSPP  nullable: true
        fishKill  nullable: true
        floatingDetritus  nullable: true
        flowAlteration  nullable: true
        foamSlashScum  nullable: true
        habitatAlteration  nullable: true
        ironPercipitates  nullable: true
        lat  nullable: true
        lng  nullable: true
        legal  nullable: true
        manureInStream  nullable: true
        nitrateTest1  nullable: true
        nitriteTest1  nullable: true
        nitriteTest2  nullable: true
        nitroComments  nullable: true
        numberOfVolunteers  nullable: true
        observationComments  nullable: true
        offensiveOdor  nullable: true
        oilyFileGrease  nullable: true
        orthoBlankPhosphorus  nullable: true
        orthoPHTest1  nullable: true
        orthoPHTest2  nullable: true
        ph1  nullable: true
        ph2  nullable: true
        phComments  nullable: true
        recentCattleActivity  nullable: true
        sampleVolume  nullable: true
        sampler1  nullable: true
        sampler2  nullable: true
        secciDepth  nullable: true
        significantAlgae  nullable: true
        siltation  nullable: true
        siteName  nullable: true
        status   nullable: true
        stageQualifier  nullable: true
        streamStage  nullable: true
        timestamp  nullable: true
        trash  nullable: true
        unsightlyColor  nullable: true
        waterTemp  nullable: true
        wbid   nullable: true
        weather  nullable: true
        windDir  nullable: true
        windSpeed  nullable: true
    }
}
