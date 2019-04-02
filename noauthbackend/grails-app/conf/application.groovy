grails.gorm.default.mapping = {
	autowire true
}

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'noauthbackend.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'noauthbackend.UserRole'
grails.plugin.springsecurity.authority.className = 'noauthbackend.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['ROLE_USER']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/javascripts/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/user/**',             access: ['permitAll']],
	[pattern: '/**/bluethumblogger/**',    access: ['ROLE_USER']],
	[pattern: '/dbconsole/**',             access: ['ROLE_ADMIN']],
	[pattern: '/reviewLogs/**',             access: ['ROLE_ADMIN']],
	[pattern: '/sample/**',             access: ['permitAll']],
	[pattern: '/role/**',             access: ['permitAll']],
	[pattern: '/registrationCode/**', access: ['permitAll']],
	[pattern: '/securityInfo/**',     access: ['permitAll']],
	[pattern: '/login/**',           access: ['permitAll']],
	[pattern: '/logout/**',           access: ['permitAll']],
	[pattern: '/register/**',         access: ['permitAll']],
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/javascripts/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.ui.register.postRegisterUrl = '/welcome'
grails.plugin.springsecurity.ui.register.emailBody = 'test email body'
grails.plugin.springsecurity.ui.register.emailFrom = 'test email from'
grails.plugin.springsecurity.ui.register.emailSubject = 'test email subject'

