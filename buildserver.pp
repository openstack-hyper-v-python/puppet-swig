node python-build-server {
    include init
    include windows_git
    class 'buildserver::jenkins' {
        include jenkins
        jenkins::plugin {
            "git" : ;
            "github" : ;
        }
    }
    include jenkins_job_builder
    include nasm
    include mingw # this needs to include gendef and pthreads!
    include wdk
    include dotnet35
    include visualcplusplus2008
    include platformsdk
    include swig
    include mysql
}