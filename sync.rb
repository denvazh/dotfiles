#!/usr/bin/env ruby
#
# Dotfiles sync script
# Create symlink in current user home directory for each dotfile in this repository
# Based on: https://github.com/sapegin/dotfiles/blob/master/sync.py

require 'readline'
require 'fileutils'

IGNORE_FILES = ['.DS_Store']
SOURCE_DIR = File.join(__dir__, 'tilde')
TARGET_DIR = ENV.fetch('DOTFILES_TARGET_DIR', '~')

def input(prompt = "", newline = false)
  prompt += "\n" if newline
  Readline.readline(prompt, true).squeeze(" ").strip
end

def link_to?(source, target)
  File.symlink?(target) && File.readlink(target) == source
end

def remove(target)
  return FileUtils.rm_r(target) if File.directory?(target) && !File.symlink?(target)
  File.unlink(target)
end

def sync
  # change to source dir
  Dir.chdir(SOURCE_DIR) do
    # get list of files in source dir and exclude files that should be ignored
    Dir.glob('*', File::FNM_DOTMATCH)
      .reject { |f| f == '.' || f == '..' || IGNORE_FILES.include?(f) }.each do |filename|
      dotfile = File.join(File.expand_path(TARGET_DIR), filename)
      source = File.join(SOURCE_DIR, filename)

      # check if dotfile already exist
      if File.exist?(dotfile)
        # skip if that dotfile is symlink and resolves to source file
        next if link_to?(source, dotfile)

        # prompt user if its okay to overwrite file
        response = input "Overwrite file \"#{dotfile}\"? [y/N] "
        unless response.downcase.start_with?('y')
          puts "Skipping \"#{dotfile}\""
          next
        end

        # force remove target
        remove(dotfile)
      end

      # create symlink
      File.symlink(source, dotfile)
      puts "#{source} -> #{dotfile}"
    end
  end
end

sync
