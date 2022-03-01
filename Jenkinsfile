pipeline{
  agent {label 'slave2'}
  stages{
      stage("build"){
        steps{
        sh """
          sudo docker build -t hello_there .
        """
      }
    }
      stage("run"){
        steps{
          sh """
            sudo docker rum  rm hello_there
            """
      }
    }
  }
}