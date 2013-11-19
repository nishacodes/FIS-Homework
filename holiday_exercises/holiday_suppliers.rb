holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :forth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

# Questions

# How would you access the second supply for the forth_of_july? ex: holiday_supplies[:spring][:memorial_day][0]

holiday_supplies[:summer][:forth_of_july][1]

# Add a supply to a Winter holiday.

holiday_supplies[:winter][:christmas] << "Christmas tree"

# Add a supply to memorial day.

holiday_supplies[:spring][:memorial_day] << "Beer"

# Add a new holiday to any season with supplies.

holiday_supplies[:winter][:valentines_day] = ["Roses", "Chocolate", "Candles"]

# Write a method to collect all Winter supplies from all the winter holidays. ex: winter_suppliers(holiday_supplies) #=> ["Lights", "Wreath", etc]

def wintersupplies
  winter_supplies = []
  holiday_supplies[:winter].collect do |holiday,suppliesarray|
    suppliesarray.collect do |supplies|
      winter_supplies << supplies
    end
  end
  winter_supplies
end

# Write a loop to list out all the supplies you have for each holiday and the season.
# Output:

# Winter:
#   Christmas: Lights and Wreath
#   New Years: Party Hats

holiday_supplies.each do |season, hash|
  puts "#{season}:"
  hash.each do |holiday, suppliesarray|
     puts "#{holiday}: " + suppliesarray.join(", ")
  end
end



# Write a method to collect all holidays with BBQ.
# holidays_with_bbqs(holiday_supplies) #=> [:fourth_of_july, :memorial_day]

def bbq
  bbq = []
  holiday_supplies.select do |season, hash|
    hash.collect do |holiday, suppliesarray|
       bbq << holiday if suppliesarray.include?("BBQ")
    end
  end
end








