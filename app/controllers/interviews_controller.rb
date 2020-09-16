class InterviewsController < ApplicationController
    def edit
        @interview = Interview.find(params[:id])
    end
    
    def create
        @candidate = Candidate.find(params[:candidate_id])
        @interview = @candidate.interviews.new(interview_params)

        if @interview.save
            redirect_to candidate_path(@candidate)
        else
            render :template => 'candidates/show'
        end
        
    end

    def update
        @interview = Interview.find(params[:id])

        @interview.update(interview_params)

        redirect_to candidate_path(@interview.candidate)
    end

    private
        def interview_params
            params.require(:interview).permit(:start_date, :start_time, :end_date, :end_time)
        end
end
