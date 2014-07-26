username 'rock'
image 'cache' do
    volume_from 'rock_cache_autoproj'
    docker_name 'rock/bootstrap'
    tag 'latest' do
        docker_tag_name 'debian-unstable_dev_mode=false_ruby=2.0'
    end
end

build 'cache'
