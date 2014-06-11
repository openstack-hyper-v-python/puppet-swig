class swig (
    $version     = $swig::params::version,
    $url         = $swig::params::url,
    $package     = $swig::params::package,
    $swigpath    = $swig::params::swigpath,
) inherits swig::params {
    windows_common::remote_file{"swigwin":
        source      => "${url}",
        destination => "${swigpath}\\${package}-${version}.zip",
        before      => Windows_7zip::Extract_file['swigwin'],
        require     => File["${$swigpath}"],
    }
    
    windows_7zip::extract_file{'swigwin':
        file        => "${swigpath}\\${package}-${version}.zip",
        destination => $swigpath,
        before      => windows_path['swigwin'],
        subscribe   => Windows_common::Remote_file["swigwin"],
    }
    
    windows_path { $swigpath:
        ensure      => present,
        require     => Windows_7zip::Extract_file['swigwin'],
    }
}
