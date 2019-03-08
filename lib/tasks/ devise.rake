namespace :device do
  desc "Mass password reset and send email instructions"
  task mass_password_reset: :environment do
    model = ENV['MODEL'] || 'User'
    begin
      model_mailer = "#{model}Mailer".constantize
      model = model.constantize

      model.where(id: 1).each do |record|
        raw, enc = Devise.token_generator.generate(model, :reset_password_token)

          record.reset_password_token = enc
          record.reset_password_sent_at = Time.now.utc
          record.save

        # Send change notification (Ensure you have created #{model}Mailer e.g. UserMailer)
        model_mailer.password_reset(record, raw).deliver_now
      end
    rescue Exception => e
      puts "Error: #{e.message}"
    end
  end
end