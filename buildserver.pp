node python-build-server {
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
    class 'buildserver::mingw' {
        include mingw
        $mgw_path_base = 'C:\MinGW'
        exec {'install-gendef':
            command   => "set \"mingw=${mgw_path_base}\" ; ${mgw_get_path}\\bin\\mingw-get.exe install mingw32-gendef",
            provider  => powershell,
        }
        exec {'install-pthreads':
            command   => "set \"mingw=${mgw_path_base}\" ; ${mgw_get_path}\\bin\\mingw-get.exe install mingw32-pthreads-w32",
            provider  => powershell,
        }
    }
    include wdk
    include dotnet35
    include visualcplusplus2008
    include platformsdk
    include swig
    include mysql
}