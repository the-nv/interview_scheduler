class UsermailerMailer < ApplicationMailer
    def sample_email
        @candidate = params[:candidate]
        mail(to: @candidate.email, subject: "Welcome !")
    end

    def interview_created
        @interview = params[:interview]
        mail(to: @interview.candidate.email, subject: "Interview Scheduled!")
    end

    def interview_updated
        @interview = params[:interview]
        mail(to: @interview.candidate.email, subject: "Interview Rescheduled!")
    end
end
