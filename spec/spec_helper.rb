require 'rubygems'
require 'bundler/setup'

require 'minitest/spec'
require 'minitest/autorun'
require 'bundler'
require 'fileutils'
require 'net/ftp'

Bundler.setup
Bundler.require


testdir = File.dirname(__FILE__)
$LOAD_PATH.unshift testdir unless $LOAD_PATH.include?(testdir)

libdir = File.dirname(File.dirname(__FILE__)) + '/lib'
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include?(libdir)

path = File.expand_path(File.join(File.dirname(__FILE__), '../lib'))
$LOAD_PATH << path

require 'dojan'
