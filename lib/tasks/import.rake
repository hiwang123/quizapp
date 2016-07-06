require 'csv'

desc "Import teams from csv file"
task :import => [:environment] do

  file = "db/files/1001_1.csv"

  CSV.foreach(file, :headers => false) do |row|
    Question.create ({
      :tag => row[1],
      :prob => row[2],
      :ans => row[3],
	  :explain => row[4],
	  :typ => row[0],
	  :test_id => row[5].chomp
    })
  end

end
