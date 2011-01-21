passwords = File.read('p079_keylog.txt').split

chains = {}

passwords.each do |pwd|
  pwd = pwd.split //
  before = pwd
  after = []
  pwd.each do |c|
    before -= [c]
    chains[c] ||= {:before => [], :after => []}
    chains[c][:before] |= before
    chains[c][:after]  |= after
    
    after += [c]
  end
end

pwd = {}
chains.each do |c,a|
  pwd[a[:before].length] = c
  puts "#{c} is before #{a[:before].join(',')}"
end

pwd = pwd.sort.map { |xs| xs[1] }
p pwd.join("").reverse