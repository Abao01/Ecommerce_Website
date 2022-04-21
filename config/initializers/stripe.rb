Rails.configuration.stripe = {
  publishable_key: ENV["PUBLISHABLE_KEY"],
  secret_key:      ENV["SECRET_KEY"]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
# pk_test_51Kr793EWxIgGHqExGurAuWkR2QmGvV5Ql60mx49d55B418UZPGudPKq2xYFJAmKaYxaglGYnAU7gAqgvyaSNI28Q00eRamFKi2
# sk_test_51Kr793EWxIgGHqExvkbq6HWI14QWBKPIM1Q1yMNQfSQulhQSO904vwhdiePFEdUxqoU0c9loqIFCdSmrYU3ZIqBo00SrFxFBVq