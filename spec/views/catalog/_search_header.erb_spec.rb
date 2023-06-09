# frozen_string_literal: true

# spec for sidebar partial in catalog show view

RSpec.describe "/catalog/_search_header.html.erb" do
  it "renders the default search header partials" do
    stub_template "_did_you_mean.html.erb" => "did_you_mean"
    stub_template "_sort_and_per_page.html.erb" => "sort_and_per_page"
    allow(view).to receive(:blacklight_config).and_return(CatalogController.blacklight_config)
    render
    expect(rendered).to match /did_you_mean/
    expect(rendered).to match /sort_and_per_page/
  end
end
