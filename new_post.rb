require_relative 'post.rb'
require_relative 'link.rb'
require_relative 'task.rb'
require_relative 'memo.rb'

puts "Hello I'm your smart notepad version 02 + Sqlite"
puts "What do you want to write?"

choices = Post.post_types.keys

choice = -1

until choice >= 0 && choice < choices.size

	choices.each_with_index do |type, index|
		puts "\t#{index}. #{type}"
end

	choice = STDIN.gets.chomp.to_i

end

entry = Post.create(choices[choice])

entry.read_from_console

id = entry.save_to_db

puts "The post has been saved #{id}"
