module HelpScout
  class Rating
    attr_reader :number, :id, :type, :threadid, :threadCreatedAt, :ratingId, :rating, :ratingCustomerId, :ratingComments, :ratingCreatedAt, :ratingCustomerName, :ratingUserId, :ratingUserName

    RATING_TYPES = {
      1 => "Great",
      2 => "Okay",
      3 => "Not Good"
    }

    # Creates a new Rating object
    def initialize(object)
      @createdAt = DateTime.iso8601(object["createdAt"]) if object["createdAt"]
      @modifiedAt = DateTime.iso8601(object["modifiedAt"]) if object["modifiedAt"]

      @number = object["number"] #The conversation number
      @id = object["id"] #conversation_id
      @type = object["type"]
      @threadid = object["threadid"]
      @threadCreatedAt = object["threadCreatedAt"]
      @ratingId = object["ratingId"] #level of rating described as "Unique identifier of the rating"???
      @rating = object["rating"] || lookup_rating(@ratingId)
      @ratingCustomerId = object["ratingCustomerId"]
      @ratingComments = object["ratingComments"]
      @ratingCreatedAt = object["ratingCreatedAt"]
      @ratingCustomerName = object["ratingCustomerName"]
      @ratingUserId = object["ratingUserId"]
      @ratingUserName = object["ratingUserName"]
    end

    private

    def lookup_rating rating_id
      RATING_TYPES[rating_id]
    end
  end
end
