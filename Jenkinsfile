pipeline{
  agent {label 'slave2'}
  stages{
    stage("build"){
      steps{
        sh """
        docker build -t hello_there .
        """
      }
    }
    stage{
      steps{
        sh """
        docker rum --rm hello_there
         """
      }
    }
  }
}