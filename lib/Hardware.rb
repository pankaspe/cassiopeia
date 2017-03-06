# include Colors for output
require_relative 'Colors'

class Hardware
  
  # set title for each block
  def self.title(text)
    @text = text.upcase.bold+$/
  end
  
  # clear screen
  def self.clr_screen
    cmd = "\e[H\e[2J"
    return cmd
  end
  
  # GENERIC info hardware
  def self.basic_info
    cmd = %x{uname -s -n -r -o}.bg_black.cyan.bold+$/
    self.clr_screen + self.title("About your system") + cmd
  end
    
  # FILESYSTEM info
  def self.filesystem_info
    cmd = %x{df -h}.bg_black.cyan.bold+$/
    cmd_advanced = %x{df -a}.bg_black.magenta.bold+$/
    
    print "Display advanced info? [Y]es or [N]o: "
    input = gets.chomp.to_s.upcase
    
    if input == "YES" || input == "Y"
      self.clr_screen + self.title("The tables of your filesystem") + cmd_advanced 
    else
      self.clr_screen + self.title("The tables of your filesystem") + cmd
    end
  end
  
  # CPU info
  def self.cpu_info
    cmd = %x{lscpu | grep -e "op-mode" -e "CPU" -e "Core" -e "Vendor" -e "Architecture" -e "Model" -e "Thread" -e "Virtualization"}.bg_black.cyan.bold+$/
    self.clr_screen + self.title("CPU information") + cmd
  end

  # RAM info
  def self.ram_info
    cmd = %x{free -m}.bg_black.cyan.bold+$/  
    self.clr_screen + self.title("RAM information") + cmd
  end
  
  # VIDEO info
  def self.vga_info
    cmd = %x{glxinfo -B}.bg_black.cyan.bold+$/
    self.clr_screen + self.title("VIDEO information") + cmd
  end
  
end