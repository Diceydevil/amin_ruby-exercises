# Goal: Parse CSV by hand (no gems), compute and output summary.
# Input: A file sales.csv with columns date,region,amount.
 
# Task:
# Read and split each line into fields.
# Sum total amount per region.
# Write a new CSV sales_summary.csv with region,total_amount.

require "csv"

arr_of_rows = CSV.read("leads_list.csv", headers: true)
arr_of_rows.each do |row|
  puts "in #{row['Date Applied']}, #{row['Name']} applied for the position of bartending.\n
  his email is: #{row['Email']}\n
  his telephone is: #{row['Phone']}"
end