n = ARGV[0].to_i
correct_when_unchanged = 0
correct_when_changed = 0
stuff = ["goat1", "goat2", "car"]

n.times do
  stuff.shuffle!

  player_choice = stuff.sample

  if player_choice == "car"
    correct_when_unchanged += 1
  end
end

n.times do
  stuff = ["goat1", "goat2", "car"]
  stuff.shuffle!

  player_choice = stuff.sample
  if player_choice == "goat1"
    stuff.delete("goat1")
    stuff.delete("goat2")
  else
    stuff.delete(player_choice)
    stuff.delete("goat1")
  end
  player_choice = stuff[0]

  if player_choice == "car"
    correct_when_changed += 1
  end
end

unchanged_percentage = (correct_when_unchanged.to_f / n * 100).round(2)
changed_percentage = (correct_when_changed.to_f / n * 100).round(2)
puts "Percentage games guessed correctly:"
puts "Without switching: %#{unchanged_percentage}"
puts "With switching: %#{changed_percentage}"
