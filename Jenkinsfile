pipeline {
    agent any
    environment {
        QA_SERVER = 'https://qa.application.com/'
        CT_SERVER = 'http://ct.application.com/'
    }
    stages {
    
	    stage('Run Robot Tests') {
	        steps {
                sh 'echo INICIO'
                sh 'python3 -m rflint --ignore LineTooLong GoogleTest1.robot'
                sh 'echo FIN'
                sh 'python3 -m robot.run --NoStatusRC --outputdir reports .'
                //sh 'python3 -m robot.run --NoStatusRC --rerunfailed reports1/output.xml --outputdir reports .'
                //sh 'python3 -m robot.rebot --merge --output reports/output.xml -l reports/log.html -r reports/report.html reports1/output.xml reports/output.xml'
                sh 'exit 0'
	      	}
            post {
                always {
                    script {
                    step(
                            [
                            $class              : 'RobotPublisher',
                            outputPath          : 'reports',
                            outputFileName      : '**/output.xml',
                            reportFileName      : '**/report.html',
                            logFileName         : '**/log.html',
                            disableArchiveOutput: false,
                            passThreshold       : 50,
                            unstableThreshold   : 40,
                            otherFiles          : "**/*.png,**/*.jpg",
                            ]
                        )
                    }
                }
            }
	    }
    }
}