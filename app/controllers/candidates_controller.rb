class CandidatesController < ApplicationController
    def show
        @candidate = Candidate.find(params[:id])
    end

    def new
        @candidate = Candidate.new
    end

    def create
        if Candidate.where(email: candidate_params[:email]).exists?
            @candidate = Candidate.where(email: candidate_params[:email]).take

            redirect_to @candidate
        else
            @candidate = Candidate.new(candidate_params)

            if @candidate.save
                UsermailerMailer.with(candidate: @candidate).sample_email.deliver_now
                redirect_to @candidate
            else
                render 'new'
            end
        end

        
        
    end

    private
        def candidate_params
            params.require(:candidate).permit([:name, :email])
        end
end
