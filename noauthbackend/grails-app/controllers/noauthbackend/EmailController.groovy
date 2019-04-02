package noauthbackend

class EmailController {

    def index() { }

    def sendEmail(){
//        println params.csv
        sendMail{
            to "mcwenzel@mtu.edu"
            from "mwenzel164@gmail.com"
            subject "Testing grails email via ajax"
            body params.csv
        }
    }
}
