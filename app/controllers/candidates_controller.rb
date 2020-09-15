class CandidatesController < ApplicationController
    def show
        @candidate = Candidate.find(params[:id])
    end

    def new

    end

    def create
        @candidate = nil

        if Candidate.where(email: candidate_params[:email]).exists?
            @candidate = Candidate.where(email: candidate_params[:email]).take
        else
            @candidate = Candidate.new(candidate_params)
            @candidate.save
        end

        redirect_to @candidate
    end

    private
        def candidate_params
            params.require(:candidate).permit([:name, :email])
        end
end
