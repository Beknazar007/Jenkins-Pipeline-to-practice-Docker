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
      stage("run"){
        steps{
          sh """
            docker rum --rm hello_there
            """
      }
    }
  }
}