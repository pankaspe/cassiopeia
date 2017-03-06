#!/usr/bin/env ruby
require_relative 'lib/Hardware'

# CLI ruby script for hardware information on unix system 
# Version 0.0.1
# Created by Andrea B.
# www.andreavonb.it

choice = false

puts Hardware::clr_screen

while choice != "0"
	
  # Print menu
  puts "[1]OS info\t [2]Filesystem info\t [3]CPU info\t [4]RAM info\t [5]VGA info\t [0]Exit".bold
  print "Seleziona un'opzione: "
  choice = gets.chomp.to_s
	
  # Case the choice var
  case choice
    when "1" 
      puts Hardware::basic_info
    when "2"
      puts Hardware::filesystem_info 
    when "3"
      puts Hardware::cpu_info
    when "4"
      puts Hardware::ram_info
    when "5"
      puts Hardware::vga_info
    when "0"
      puts "Alla prossima!".bold
      exit
    else
      puts "Input non valido!".bg_magenta.black.underline+$/
    end
	
end
