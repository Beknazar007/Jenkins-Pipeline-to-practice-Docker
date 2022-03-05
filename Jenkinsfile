pipeline {
  agent {
    label 'slave2'
  }
  stages {
    stage('build') {
      parallel {
        stage('build') {
          steps {
            sh '''
echo assalam aleikum
        '''
          }
        }

        stage('') {
          steps {
            sleep 10
          }
        }

      }
    }

    stage('run') {
      parallel {
        stage('run') {
          steps {
            sh '''
          
            '''
          }
        }

        stage('') {
          steps {
            mail(to: 'saitovbeknazar6@gmail.com', subject: 'Assalam Aleikum', body: 'to the asdf')
          }
        }

      }
    }

  }
}