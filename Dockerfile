FROM burtlo/devwebapp-ruby:k8s

COPY service.rb /app/lib/service.rb

CMD ["rackup", "--port", "8080", "--env", "production"]