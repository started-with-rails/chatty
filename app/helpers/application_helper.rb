module ApplicationHelper
    def get_random_image(record)
        image_tag("https://www.gravatar.com/avatar/#{record.try(:id)}?s=32&d=identicon&r=PG&f=1") if record
    end
end
