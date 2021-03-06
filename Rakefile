require 'rake'

desc "Hook our dotfiles into system-standard positions."
task :install do
  # symlink all .symlink files from section folders to root
  linkables = Dir.glob('*/**{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      if backup || backup_all
        `mkdir $HOME/.dotfile_backups` unless File.directory? "$HOME/.dotfile_backups"
        `mv "$HOME/.#{file}" "$HOME/.dotfile_backups/.#{file}.backup"` 
      end
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end

  # print instructions for user to run setup files
  setups = Dir.glob('*/setup')
  
  unless setups.empty?
    puts ""
    puts "I see you have some setup files that need to be run. Be sure to read them and run them as desired:"
  end

  setups.each do |setup|
    puts setup
  end  
end

task :uninstall do

  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end
    
    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.dotfile_backups/.#{file}.backup")
      `mv "$HOME/.dotfile_backups/.#{file}.backup" "$HOME/.#{file}"` 
    end

  end
  # remove backup folder after all backups moved back to original location
  `rm -rf $HOME/.dotfile_backups`
end

task :default => 'install'
