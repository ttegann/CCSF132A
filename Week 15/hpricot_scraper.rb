#!/usr/local/bin/ruby
# NAME: Tegan Broderick
# COURSE: CS132A
# DATE: 20190512
# FILE: hpricot_scraper.rb
# DESC: Week 15 - Script reads HTML text generated by rails_sites.php, and collects and display pairs of information found in the "<a></a>" elements


require 'hpricot'
require 'open-uri'

# Use the imported open function to read rails_sites.php
source_html = open('http://hills.ccsf.edu/~dputnam/rails_sites.php').read

# Create an Hpricot object using the html read from rails_sites.php
html = Hpricot(source_html)

# Print the inner html and URL for the <a> elements.
a_all = html.search('a')

template = "%2s%20s%40s" #template for output

puts template % ["#", "INNER HTML", "URL"] #Header row
count = 1
a_all.each do |i|
  puts template % [count,i.inner_html,i['href']] # Note that attributes such as the HREF value of an <a> element uses square bracket syntax
  count += 1
end
