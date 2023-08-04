require_relative 'slot_machine'

slot_machine = SlotMachine.new

puts "Welcome to the Slot Machine game!"
puts "=" * 30

loop do
  puts "Press 1 to play"
  puts "Press 0 to exit"
  action = gets.chomp.to_i
  print `clear`
  action == 1 ? slot_machine.play : break
end