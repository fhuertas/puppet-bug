# Copyright Francisco Huertas, Center for Open Middleware, Universidad Politecnica de Madrid

define nada2::mkdir ($dir ) {
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

class nada2 ($not, $dir){
  #class {"nada2::install": dir => "$dir", not => "$not" }
  nada2::mkdir{"dir2-1" : dir => "${dir}-1", }
  nada2::mkdir{"dir2-2" : dir => "${dir}-2", }
  nada2::mkdir{"dir2-3" : dir => "${dir}-3", }
}

class nada2::install($not, $dir){
  nada2::mkdir{"dir2-1" : dir => "${dir}-1", }
  nada2::mkdir{"dir2-2" : dir => "${dir}-2", }
  nada2::mkdir{"dir2-3" : dir => "${dir}-3", }
}
