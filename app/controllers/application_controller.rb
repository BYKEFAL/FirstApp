class ApplicationController < ActionController::Base
    def Hello
        render html: "hello Bobi"
    end
end
