# encoding: utf-8

if RUBY_VERSION >= '1.9.3'
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start

  require 'pathname'
  ROOT = Pathname.new(File.expand_path('../../', __FILE__))
  $:.unshift((ROOT + 'lib').to_s)
  $:.unshift((ROOT + 'spec').to_s)
end

#-----------------------------------------------------------------------------#

require 'bundler/setup'
require 'bacon'
require 'mocha-on-bacon'
require 'pretty_bacon'
require 'claide'
require 'spec_helper/fixtures'

#-----------------------------------------------------------------------------#

def should_raise_help(error_message)
  error = nil
  begin
    yield
  rescue CLAide::Help => e
    error = e
  end
  error.should.not == nil
  error.error_message.should == error_message
end



