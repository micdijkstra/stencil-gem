require "stencil/version"
require 'sassc'
require 'filewatcher'
require 'liquid'
require 'autoprefixer-rails'
require 'premailer'
require 'sass_paths'
require 'uglifier'
require 'webrick'

module Stencil
  SassPaths.append('assets/stylesheets')

  def self.javascript folder
    begin
      contents = ""
      folders = [folder + 'lib/', folder]
      folders.each do |f|
        Dir.glob(f + '*.js') do |path|
          begin
            contents += File.open(path).read
          rescue => e
            puts "JavaScript error: #{e}"
          end
        end
      end

      uglified = Uglifier.new.compile contents
      output_filename = folder.gsub('assets/javascripts', 'build/') + 'application.js'
      File.open(output_filename, 'w') { |file| file.write(uglified) }

      "JavaScript rendered #{folder}"
    rescue => e
      "JavaScript error: #{e}"
    end
  end

  def self.sass folder
    begin
      Dir.glob(folder + '*.scss') do |path|
        next if path =~ /\_/ # do not render partials
        begin
          file = File.open(path).read
          engine = SassC::Engine.new(file, { style: :compressed, load_paths: ['assets/stylesheets/'] })
          prefixed = AutoprefixerRails.process(engine.render, browsers: ['last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1'])
          output_filename = path.gsub('scss', 'css').gsub('assets/stylesheets', 'build')
          File.open(output_filename, 'w') { |file| file.write(prefixed.css) }
        rescue => e
          puts "Sass error: #{e}"
        end
      end
      "Sass rendered #{folder}"
    rescue => e
      "Sass error: #{e}"
    end
  end

  def self.liquid folder
    begin
      Liquid::Template.file_system = Liquid::LocalFileSystem.new(folder)
      Dir.glob(folder + '*.liquid') do |path|
        next if path =~ /\_/ # do not render partials
        begin
          file = File.open(path).read
          liquid = Liquid::Template.parse(file)
          output_filename = path.gsub('liquid', 'html').gsub('templates', 'build')
          File.open(output_filename, 'w') { |file| file.write(liquid.render) }
        rescue => e
          puts "Liquid error: #{e}"
        end
      end
      "Liquid rendered #{folder}"
    rescue => e
      "Liquid error: #{e}"
    end
  end

  def self.inline folder
    begin
      Liquid::Template.file_system = Liquid::LocalFileSystem.new(folder)
      Dir.glob(folder + '*.html') do |path|
        next if path.include? '-inline.html'
        begin
          premailer = Premailer.new(path, warn_level: Premailer::Warnings::SAFE)
          output_filename = path.gsub('.html', '-inline.html')
          File.open(output_filename, 'w') { |file| file.write(premailer.to_inline_css) }

          # Output any CSS warnings
          premailer.warnings.each do |w|
            puts "#{w[:message]} (#{w[:level]}) may not render properly in #{w[:clients]}"
          end
        rescue => e
          puts "Inline error: #{e}"
        end
      end
      "Inline rendered #{folder}"
    rescue => e
      "Inline error: #{e}"
    end
  end
end
