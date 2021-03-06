require "awesome_print"

ap "Path to folder 1:"
folder_1 = gets.chomp
ap "Path to folder 2:"
folder_2 = gets.chomp

files_1 = Dir.children(folder_1)
files_2 = Dir.children(folder_2)

file_names_1 = []
to_delete = []

files_1.each do |file|
  file_names_1 << file.split(".")[0]
end

files_2.each do |file|
  unless file_names_1.include?(file.split(".")[0])
    to_delete << file
  end
end

ap "Are you sure you want to delete the following files? y/n"
ap to_delete

ans = gets.chomp

until ans == "y" || ans == "n"
  ap "Invalid input, please answer y or n"
  ans = gets.chomp
end

if ans == "n"
  ap "Cancelled process"
  exit
end

if ans == "y"
  ap "Deleting files"
  to_delete.each do |f|
    ap "Deleting #{folder_2}/#{f}"
    system("rm -f #{folder_2}/#{f}")
  end
end