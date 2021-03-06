# Copyright Francisco Huertas, Center for Open Middleware, Universidad Politecnica de Madrid

define nada::mkdir ($dir ) {
  $in_tmp_dir         = "${tomcat7::params::tmp_dir}"
  file { "/tmp/${module_name}-${title}.sh" :
    mode     => 744,
    owner    => root,
    group    => root,
    content  => template("${module_name}/mkdir-${::osfamily}.sh.erb") ,
  }
  exec { "/tmp/${module_name}-${title}.sh":
    cwd     => "/tmp",
    require => File["/tmp/${module_name}-${title}.sh"],
  }
}


define nada::def {
   notify{"${title}-1" : }
   notify{"${title}-2" : }
   notify{"${title}-3" : }
   notify{"${title}-4" : }
}


class nada ($not, $dir){
  class {"nada::install": dir => "$dir", not => "$not" }
}

class nada::install ($not, $dir) {
  nada::mkdir{"dir1-1"  : dir => "${dir}-1", }
  nada::mkdir{"dir1-2"  : dir => "${dir}-2", }
  nada::mkdir{"dir1-3"  : dir => "${dir}-3", }
}
