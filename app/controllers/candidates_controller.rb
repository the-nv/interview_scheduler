class CandidatesController < ApplicationController
    def show
        @candidate = Candidate.find(params[:id])
    end

    def new

    end

    def create
        @candidate = Candidate.new(candidate_params)
        @candidate.save

        redirect_to @candidate
    end

    private
        def candidate_params
            params.require(:candidate).permit([:name, :email])
        end
end
