username 'rock'
image 'debian' do
    config 'dev_mode' do
        add true
        add false
    end
    config 'ruby' do
        add ['ruby1.9.1', '/usr/bin/ruby1.9.1'], metadata: '1.9'
        add ['ruby2.0', '/usr/bin/ruby2.0'], metadata: '2.0'
        add ['ruby2.1', '/usr/bin/ruby2.1'], metadata: '2.1'
    end
    config 'package_manager' do
        add ['apt-get update', 'apt-get install -y %s'], metadata: nil
    end
    tag 'unstable'
    tag 'testing'
end

image 'ubuntu' do
    config 'dev_mode' do
        add true
        add false
    end

    config 'ruby' do
        add ['ruby1.9.1', '/usr/bin/ruby1.9.1'], metadata: '1.9'

    config 'package_manager' do
        add ['apt-get update', 'apt-get install -y %s'], metadata: nil
    end

    tag '14.04'
end

image 'opensuse' do
    docker_image 'andtecheu/opensuse_13.1'
    config 'dev_mode' do
        add true
    end
    config 'ruby' do
        add ['ruby19', '/usr/bin/ruby1.9'], metadata: '1.9'
        add ['ruby20', '/usr/bin/ruby2.0'], metadata: '2.0'
    end
    config 'package_manager' do
        add ['true', 'zypper --non-interactive install %s'], metadata: nil
    end
    end
end


build 'bootstrap'
# build 'update', :on => debian.
#     with('tag' => 'unstable',
#          'ruby' => ['ruby1.9.1', '/usr/bin/ruby1.9.1'])
