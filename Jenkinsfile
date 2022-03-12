pipeline {
  agent any
  stages {
    stage('build') {
      parallel {
        stage('build') {
          steps {
            sh '''
echo assalam aleikum
        '''
            libraryResource 'shared-library'
          }
        }

        stage('error') {
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

        stage('error') {
          steps {
            mail(to: 'saitovbeknazar6@gmail.com', subject: 'Assalam Aleikum', body: 'to the asdf', bcc: 'Beknazar')
          }
        }

      }
    }

  }
}