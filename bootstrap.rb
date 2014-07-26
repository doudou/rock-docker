load 'common'
build 'bootstrap' do
    if ENV['UPDATE'] == '1'
        from_build 'bootstrap'
        dockerfile_template 'Dockerfile.bootstrap_update'
    end
end
