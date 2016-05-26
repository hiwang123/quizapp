require 'csv'

desc "Import teams from csv file"
task :import => [:environment] do

  file = "db/files/test1.csv"

  CSV.foreach(file, :headers => false) do |row|
    Question.create ({
      :tag => row[0],
      :prob => row[1],
      :ans => row[2],
	  :explain => row[3],
	  :typ => row[4],
	  :test_id => row[5].chomp
    })
  end

end
