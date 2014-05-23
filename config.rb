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
    ## There is a problem with the testing/jessie images on the docker index
    # tag 'testing' do
    #     docker_tag_name 'jessie'
    # end
end

image 'ubuntu' do
    config 'dev_mode' do
        add true
        add false
    end


    config 'package_manager' do
        add ['apt-get update', 'apt-get install -y %s'], metadata: nil
    end

    tag '12.04' do
        config 'ruby' do
            add ['ruby1.9.1', '/usr/bin/ruby1.9.1'], metadata: '1.9'
        end
    end
    tag '12.10' do
        config 'ruby' do
            add ['ruby1.9.1', '/usr/bin/ruby1.9.1'], metadata: '1.9'
        end
    end
    tag '13.04' do
        config 'ruby' do
            add ['ruby1.9.1', '/usr/bin/ruby1.9.1'], metadata: '1.9'
        end
    end
    tag '13.10' do
        config 'ruby' do
            add ['ruby1.9.1', '/usr/bin/ruby1.9.1'], metadata: '1.9'
            add ['ruby2.0', '/usr/bin/ruby2.0'], metadata: '2.0'
        end
    end
    tag '14.04' do
        config 'ruby' do
            add ['ruby1.9.1', '/usr/bin/ruby1.9.1'], metadata: '1.9'
            add ['ruby2.0', '/usr/bin/ruby2.0'], metadata: '2.0'
        end
    end
end

image 'opensuse' do
    tag '13.1' do
        docker_name 'sylvainjoyeux/opensuse-13.1'
        docker_tag_name 'latest'
    end

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

image 'arch' do
    docker_name 'base/archlinux'
    config 'dev_mode' do
        add true
    end
    config 'ruby' do
        add ['ruby', '/usr/bin/ruby'], metadata: '2.1'
    end
    config 'package_manager' do
        add ['true', 'pacman -Sy --noconfirm %s'], metadata: nil
    end
end

image 'fedora' do
    config 'dev_mode' do
        add true
    end
    config 'ruby' do
        add ['ruby', '/usr/bin/ruby'], metadata: '2.0'
    end
    config 'package_manager' do
        add ['true', 'yum install -y %s'], metadata: nil
    end
    tag '20'
end

build 'bootstrap' do |image|
    image.metadata['dev_mode'] || (image.metadata['ruby'] == '1.9')
end
# build 'update', :on => debian.
#     with('tag' => 'unstable',
#          'ruby' => ['ruby1.9.1', '/usr/bin/ruby1.9.1'])
