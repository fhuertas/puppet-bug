# Copyright Francisco Huertas, Center for Open Middleware, Universidad Politecnica de Madrid

define nada2::mkdir ($dir ) {
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


define nada2::def {
   notify{"${title}-1" : }
   notify{"${title}-2" : }
   notify{"${title}-3" : }
   notify{"${title}-4" : }
}



class nada2 ($not, $dir){
  class {"nada2::install": dir => "$dir", not => "$not" }
}

class nada2::install($not, $dir){
  nada2::mkdir{"dir2-1" : dir => "${dir}-1", }
  nada2::mkdir{"dir2-2" : dir => "${dir}-2", }
  nada2::mkdir{"dir2-3" : dir => "${dir}-3", }
  nada2::mkdir{"dir2-4" : dir => "${dir}-4", }
  nada2::mkdir{"dir2-5" : dir => "${dir}-5", }
  nada2::mkdir{"dir2-6" : dir => "${dir}-6", }
#  notify {"${not}-2" : require => Nada2::Mkdir["dir2-1"], }
#  notify {"${not}-3" : }
#  notify {"${not}-4" : }
}
