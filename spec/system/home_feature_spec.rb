require "rails_helper"

RSpec.describe "Homepage", type: :system do
  before { visit root_path }

  it "rendered page contains both base and application layouts" do
    assert_selector("html>head+body")
    assert_selector("body p")
    expect(page.title).to match(/Home/)
  end

  it_behaves_like "an accessible page"
end
