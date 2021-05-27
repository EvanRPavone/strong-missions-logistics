module ApplicationHelper

    def readable_time(time)
        time.strftime("%B %d, %Y")
    end

    def author_of(record)
        user_signed_in? && current_user.id == record.user_id
    end

    def admin?
        user_signed_in? && current_user.admin?
    end

    def rdyForItinerary?
        user_signed_in? && current_user.rdyForItinerary?
    end

    def readyToPay?
        user_signed_in? && current_user.rdyToPay?
    end
end
