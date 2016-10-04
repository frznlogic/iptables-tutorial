#!/usr/bin/groovy 

parallel 'pdf': {
    stage('PDF') {
        node {
            checkout scm
            sh "make pdf -j4"
        }
    }
},
'html': {
    stage('HTML') {
        node {
            checkout scm
            sh "make html"
        }
    }
},
'src': {
    stage('src') {
        node {
            checkout scm
            sh "make src"
        }
    }
},
'ps': {
    stage('PS') {
        node {
            checkout scm
            sh "make ps"
        }
    }
}

parallel 'spanish': {
    stage('Spanish') {
        node {
            checkout scm
            sh "make spanish"
        }
    }
},
'portuguese': {
    stage('Portuguese') {
        node {
            checkout scm
            sh "make portuguese"
        }
    }
}

