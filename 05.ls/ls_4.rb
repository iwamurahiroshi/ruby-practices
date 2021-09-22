require 'etc'
require 'date'

files = Dir.glob('*')

total_byte_blocks = 0
files.each do |x|
  total_byte_blocks += File::lstat(x).blocks
end
puts "total #{total_byte_blocks}"
files.each do |file|
  data_of_file = File::lstat(file)
  mode = data_of_file.mode.to_s(8)
  mode = '0' + mode if mode.length < 6
  file_mode = { '12' => 'l',
                '10' => '-',
                '04' => 'd',
                '01' => 'p' }
  print file_mode[mode[0..1]]
  mode[3..5].chars.each.with_index(1) do |x, i|
    permissions = { '0' => '---',
                    '1' => '--x',
                    '2' => '-w-',
                    '3' => '-wx',
                    '4' => 'r--',
                    '5' => 'r-x',
                    '6' => 'rw-',
                    '7' => 'rwx'}[x]
    if mode[2] == '4' && i == 1
      if permissions[2] == 'x'
        permissions[2] = 's'
      else
        permissions[2] = 'S'
      end
      print permissions
    elsif mode[2] == '2' && i == 2
      if permissions[2] == 'x'
        permissions[2] = 's'
      else
        permissions[2] = 'S'
      end
      print permissions
    elsif mode[2] == '1' && i == 3
      if permissions[2] == 'x'
        permissions[2] = 't'
      else
        permissions[2] = 'T'
      end
      print permissions
    else
      print permissions
    end
  end
  def margin_print(original)
    print ' ' + original
  end
  margin_print(data_of_file.nlink.to_s)
  margin_print(Etc.getpwuid(data_of_file.uid).name)
  margin_print(Etc.getgrgid(data_of_file.gid).name)
  margin_print(data_of_file.size.to_s)
  mtime_of_files = data_of_file.mtime.to_a
  margin_print(mtime_of_files[4].to_s)
  margin_print(mtime_of_files[3].to_s)
  if (Date.today << 6).to_time > data_of_file.mtime || data_of_file.mtime > Time.now
    margin_print(mtime_of_files[5].to_s)
  else
    margin_print(sprintf("%02d", mtime_of_files[2]).to_s + ':' + sprintf("%02d", mtime_of_files[1]).to_s)
  end
  if data_of_file != File::Stat.new(file)
    margin_print(file + ' -> ' + File.readlink(file))
  else
    margin_print(file)
  end
  puts
end
