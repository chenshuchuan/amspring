require 'spec_helper'

subject { page }
describe "StaticPages" do
  describe "Home page" do
  	before { visit root_path }
    it { should have have_content('Sample App')}
    it { should have have_title("Ruby on Rails Tutorial Sample App | Home")} 
    it { should_not have_title('| Home')}
  end

  describe "Help page" do
  	before { visit help_path}
    it {should have the content 'Sample App'" do
      expect(page).to have_content('Sample App')
    end

    it "should have the title 'Help'" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end       
  end

  describe "About page" do
  	before {visit about_path}
    it "should have the content 'Sample App'" do
      expect(page).to have_content('Sample App')
    end

    it "should have the title 'About'" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
    end      
  end

  describe "Contact page" do
  	before {visit contact_path}
    it "should have the content 'Sample App'" do
      expect(page).to have_content('Sample App')
    end

    it "should have the title 'Contact'" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
    end      
  end

end
