namespace :db do
  desc "Resets MySQL and Mongodb Data"
  task :clean_all => [:environment,'db:migrate:reset'] do
    #FieldPrototype.delete_all
    #LoanDetail.delete_all
    clean_mongodb
  end

  desc "Calls Clean then Seed"
  task :nuke => ['db:clean_all','db:seed'] do
    puts "finished nuke!"
  end
end

def clean_mongodb
  puts "cleaning mongodb...."
  Mongoid.database.collections.each do |collection|
    unless collection.name =~ /^system\./
      collection.remove
    end
  end
  puts "finished cleaning mongodb."
end