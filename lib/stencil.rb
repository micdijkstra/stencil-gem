require "stencil/version"

module Stencil
  class Watcher
    def sass
      file = File.expand_path(File.join(File.dirname(__FILE__), "assets/stylesheets/application.scss"))
      Sass2Scss.convert(file)
    end
  end
end
