load 'common'
build 'bootstrap' do |image|
    image.metadata['dev_mode'] || (image.metadata['ruby'] == '1.9')
end

# build 'update', :on => debian.
#     with('tag' => 'unstable',
#          'ruby' => ['ruby1.9.1', '/usr/bin/ruby1.9.1'])
