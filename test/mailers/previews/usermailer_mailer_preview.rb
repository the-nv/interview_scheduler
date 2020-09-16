# Preview all emails at http://localhost:3000/rails/mailers/usermailer_mailer
class UsermailerMailerPreview < ActionMailer::Preview
    def sample_email
        candidate = Candidate.new(name: "Neeraj", email: "the.n.verma@gmail.com")
    
        UsermailerMailer.with(candidate: candidate).sample_email
    end
end
