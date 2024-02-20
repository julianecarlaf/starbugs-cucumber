

class HomePage
include Capybara::DSL

    def open
        visit 'https://starbugs.vercel.app/'
    end

end