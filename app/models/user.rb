class User < ApplicationRecord
	require 'csv'

	def self.import (file)
		CSV.foreach(file, headers:true) do |row|
			User.create! row.to_h
    end
    last_names = row['last_name']
    u = User.all
    last_names.shuffle
    u.each_with_index do |i,id|


      i.last_name = last_names[id]
      i.save!
    end

    u = User.all
    u.each do |i|
     puts i.to_json(only: [:first_name, :last_name]) 
    end
  end
end