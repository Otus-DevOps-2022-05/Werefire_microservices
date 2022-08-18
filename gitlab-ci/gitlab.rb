external_url 'http://51.250.69.152'
gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password').gsub("\n", "")
