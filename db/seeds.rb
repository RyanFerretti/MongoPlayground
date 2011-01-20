# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#     field :name, :type => String
#     field :description, :type => String
#     field :field_type, :type => String
#     field :segment, :type => String
#     field :readonly, :type => Boolean
#     field :navable, :type => Boolean
#     field :napable, :type => Boolean

FieldPrototype.create! :segment => "Note", :name => "Original Loan Amount", :description => "The original value of the loan when the loan was created. This will validate for numbers only, unless NAP or NAV", :field_type => "BigDecimal", :napable => true, :navable => true
FieldPrototype.create! :segment => "Note", :name => "Loan Term", :description => "The terms of the loan when the loan was created. This will validate for numbers only", :field_type => "BigDecimal"
FieldPrototype.create! :segment => "Note", :name => "Note Date", :description => "The original date of the note... be sure to double check the note documents.", :field_type => "Date"
FieldPrototype.create! :segment => "Note", :name => "Some Readonly Field", :description => "Could be used for any sort of readonly data.", :field_type => "String", :readonly => true
FieldPrototype.create! :segment => "Note", :name => "Interest Compounds", :description => "Does the interest for the loan compound or not.", :field_type => "Boolean", :navable => true
FieldPrototype.create! :segment => "Note", :name => "Future Subordinate Debt Permitted", :description => "Who knows what this field is supposed to do... I would just skip it!.", :field_type => "DropDown", :dd_values => ["In the Future","Back in the Day","Only Today"], :napable => true
FieldPrototype.create! :segment => "Note", :name => "Note Comments", :description => "Describe any other details not captured in the note fields... please check your spelling!", :field_type => "Text"

puts "Fields created:#{FieldPrototype.all.count}"

Loan.create! :account_number => "12345"
Loan.create! :account_number => "09876"

puts "Loans created: #{Loan.all.count}"
puts "First Loan has : #{Loan.first.loan_detail.loan_fields.count} fields"