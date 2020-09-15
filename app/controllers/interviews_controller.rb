class InterviewsController < ApplicationController
    def create
        @candidate = Candidate.find(params[:candidate_id])
        @interview = @candidate.interviews.create(interview_params)

        redirect_to candidate_path(@candidate)
    end

    private
        def interview_params
            params.require(:interview).permit(:start_date, :start_time, :end_date, :end_time)
        end
end
