workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'
on_worker_boot do
    # Настройки, специфические для Rails 4.1+ см.: https://devcenter.heroku.com/articles/
    # deploying-rails-applications-with-the-puma-web-server#on-worker-boot
    # ниже закоментированный код взят по ссылке выше, 
    # работоспособность не понятно т.к. ни актуальны ни этот не работает
    
    #ActiveSupport.on_load(:active_record) do
        #config = ActiveRecord::Base.configurations[Rails.env] ||
                   # Rails.application.config.database_configuration[Rails.env]
     #   config['pool'] = ENV['RAILS_MAX_THREADS'] || 5
     #   ActiveRecord::Base.establish_connection(config)
     # end
     ActiveRecord::Base.establish_connection
end