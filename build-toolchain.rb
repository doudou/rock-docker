load 'common'

each_image do |img|
    img.volume_from 'rock_cache_autoproj'
    img.config 'autoproj_config' do
        add 'default-master', metadata: 'master'
        add 'default-next', metadata: 'next'
        add 'default-stable', metadata: 'stable'
    end
end

build 'build-toolchain' do
    from_build 'bootstrap', ignore: 'autoproj_config'
end

