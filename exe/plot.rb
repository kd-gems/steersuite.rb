#!/usr/bin/env -S ruby -s
# frozen_string_literal: true

require 'tqdm'
require "steersuite"


if $help
  puts "Usage: plot.rb [-to=DIR] FILE [FILE...]"
  exit 0
end

ARGV.tqdm.each do |arg|
  target = if $to
             File.join($to, File.basename(arg, '.bin') + '.png')
           else
             Pathname.new(arg).sub_ext(".png").to_s
           end
  Steersuite::SteersimPlot.plot_file(arg, target)
end
