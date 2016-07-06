require 'csv'

desc "Fix csv file"
task :fix => [:environment] do

  file = "db/files/1032_1.csv"
  x = 208
  CSV.foreach(file, :headers => false) do |row|
    #Question.update(x, :explain => row[0] ) 
	Question.update(x, :prob => row[3])
	Question.update(x, :ans => row[2])
	x += 1
  end

end

