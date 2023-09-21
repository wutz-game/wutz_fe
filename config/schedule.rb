every 1.day, at: '12:00 am' do
  runner 'DailyEmailSenderWorker.perform_async'
end