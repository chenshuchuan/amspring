require 'spec_helper'

describe "StaticPages" do
  subject { page }

  shared_examples_for "all static pages" do
    it { should_have_content(heading) }
    it { should_have_title(full_title(page_title)) }
  end  

  describe "Home page" do
  	before { visit root_path }
    it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home')}
  end

  describe "Help page" do
  	before { visit help_path }
    it { should have_content('Sample App')}
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
  	before { visit about_path }
    it { should have_content('About') }
    it { should have_title(full_title('About')) }    
  end

  describe "Contact page" do
  	before { visit contact_path }
    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }    
  end

end
