package noauthbackend

import grails.converters.JSON

class BootStrap {

    def init = { servletContext ->
        new Sample(
                wbid: "hi",
                timestamp: "timestamp",
        ).addToVolunteers(
                new Volunteer(
                        name:"a",
                        hours: "",
                        activity: ""
                )
        ).save()
        volunteerMarshaler()

        // Add for creating Roles and Users
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testAdmin = new User(username: 'admin', password: 'password')
        testAdmin.save(flush: true)

        def testUser = new User(username: 'user', password: 'password')
        testUser.save(flush: true)

        UserRole.create testAdmin, adminRole, true
        UserRole.create testUser, userRole, true

        UserRole.withSession {
            it.flush()
            it.clear()
        }

    }
    def destroy = {
    }
    private void volunteerMarshaler() {
        JSON.registerObjectMarshaller(Sample) { s ->
            [
                    wbid: s.wbid,
                    timestamp: s.timestamp,
                    airTemp: s.airTemp,
                    ammoniaBlank: s.ammoniaBlank,
                    ammoniaNTest1: s.ammoniaNTest1,
                    ammoniaNTest2: s.ammoniaNTest2,
                    chlorideBlank: s.chlorideBlank,
                    chlorideTest1: s.chlorideTest1,
                    chlorideTest2: s.chlorideTest2,
                    clean: s.clean,
                    deadAnimal: s.deadAnimal,
                    dish1: s.dish1,
                    dish2: s.dish2,
                    dish3: s.dish3,
                    do1: s.do1,
                    do2: s.do2,
                    exoticSPP: s.exoticSPP,
                    fishKill: s.fishKill,
                    floatingDetritus: s.floatingDetritus,
                    flowAlteration: s.flowAlteration,
                    foamSlashScum: s.foamSlashScum,
                    habitatAlteration: s.habitatAlteration,
                    ironPercipitates: s.ironPercipitates,
                    lat: s.lat,
                    lng: s.lng,
                    legal: s.legal,
                    manureInStream: s.manureInStream,
                    nitrateTest1: s.nitrateTest1,
                    nitriteTest1: s.nitriteTest1,
                    nitriteTest2: s.nitriteTest2,
                    nitroComments: s.nitroComments,
                    numberOfVolunteers: s.numberOfVolunteers,
                    observationComments: s.observationComments,
                    offensiveOdor: s.offensiveOdor,
                    oilyFileGrease: s.oilyFileGrease,
                    orthoBlankPhosphorus: s.orthoBlankPhosphorus,
                    orthoPHTest1: s.orthoPHTest1,
                    orthoPHTest2: s.orthoPHTest2,
                    ph1: s.ph1,
                    ph2: s.ph2,
                    phComments: s.phComments,
                    recentCattleActivity: s.recentCattleActivity,
                    sampleVolume: s.sampleVolume,
                    sampler1: s.sampler1,
                    sampler2: s.sampler2,
                    secciDepth: s.secciDepth,
                    significantAlgae: s.significantAlgae,
                    siltation: s.siltation,
                    siteName: s.siteName,
                    status: s.status,
                    stageQualifier: s.stageQualifier,
                    streamStage: s.streamStage,
                    trash: s.trash,
                    unsightlyColor: s.unsightlyColor,
                    waterTemp: s.waterTemp,
                    weather: s.weather,
                    windDir: s.windDir,
                    windSpeed: s.windSpeed,
                    volunteer: s.volunteers.collect { v ->
                        [
                                name: v.name,
                                hours: v.hours,
                                activity: v.activity
                        ]
                    }
            ]
        }
    }
}
