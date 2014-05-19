username 'rock'
debian = image 'debian' do
    config 'ruby' do
        add 'ruby1.9.1', '/usr/bin/ruby1.9.1'
        add 'ruby2.0', '/usr/bin/ruby2.0'
        add 'ruby2.1', '/usr/bin/ruby2.1'
    end
    tag 'unstable'
end

build 'bootstrap'
build 'update', :on => debian.
    with('tag' => 'unstable',
         'ruby' => ['ruby1.9.1', '/usr/bin/ruby1.9.1'])
