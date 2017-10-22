puts 'This program converts audio and video files to MP3. Please press'
puts
puts '[1] if your source files are FLAC'
puts '[2] if your source files are WAV'
puts '[3] if your source files are OGG'
puts '[4] if your source files are MP4'
puts '[5] if you don\'t know, don\'t care, or just want EVERY file in the folder to become an MP3.'

format = gets.chomp

puts 'Now please enter the directory of the files'

direc = gets.chomp + '/'
Dir.chdir(direc)

system('cd direc')
system('mkdir mp3')

puts 'Ok. Abort the program if it wants to start overwriting files lol'
gets

#now for the conversions

if format.to_i == 1
system('for f in *.flac; do ffmpeg -i "$f" -b:a 320k "mp3/${f%.flac}.mp3";done')
# fuck yeah high quality files only!
elsif format.to_i == 2
system('for f in *.wav; do ffmpeg -i "$f" -b:a 320k "mp3/${f%.wav}.mp3";done')
elsif format.to_i == 3
system('for f in *.ogg; do ffmpeg -i "$f" -b:a 320k "mp3/${f%.ogg}.mp3";done')
elsif format.to_i == 4
system('for f in *.mp4; do ffmpeg -i "$f" -b:a 320k "mp3/${f%.mp4}.mp3";done')
elsif format.to_i == 5
system('for f in *.*; do ffmpeg -i "$f" -b:a 320k "mp3/${f%.*}.mp3";done')
else
puts
puts 'ERROR: You entered something other than number 1-5 in the beginning! The Gods are not mocked! Restart the program!'
end
gets
