# frozen_string_literal: true

include :bundler, static: true

require 'gem_toys'
expand GemToys::Template

alias_tool :g, :gem

tool :console do
  def run
    ## `rubocop-packaging` requires such instead of `require_relative`
    require 'faraday/encode_xml'

    require 'pry'
    Pry.start
  end
end

alias_tool :c, :console
