# Copyright Francisco Huertas, Center for Open Middleware, Universidad Politecnica de Madrid


class {'nada' : not => "class1", dir => "/tmp/dir1",  }
class {'nada2' : not => "class2", dir => "/tmp/dir2", require => Class['nada'], }
