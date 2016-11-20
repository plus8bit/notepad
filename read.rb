require_relative 'post.rb'
require_relative 'link.rb'
require_relative 'task.rb'
require_relative 'memo.rb'
require 'optparse'

options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: read.rb [options]'

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--type POST TYPE', 'what type of posts to show (any default)') { |o| options[:type] = o} #
  opt.on('--id POST_ID', 'if set id -- show only this post') { |o| options[:id] = o} #
  opt.on('--Limit NUMBER', 'how much to show the last posts (by default, all)') { |o| options[:limit] = o} #

end.parse!

result = Post.find(options[:limit], options[:type], options[:id])

if result.is_a? Post
  puts "Note #{result.class.name}, id = #{options[:id]}"

  result.to_strings.each do |line|
    puts line
  end
else

  print "| id\t| @type\t| @created_at\t\t\t| @text \t\t\t| @url\t\t| @due_date \t "

  result.each do |row|
    puts

    row.each do |element|
      print "| #{element.to_s.delete("\\n\\r")[0..40]}\t"
    end
  end
end

puts

