# frozen_string_literal: true

RSpec.describe "catalog/index.html.erb" do
  describe "with no search parameters" do
    before do
      allow(view).to receive(:has_search_parameters?).and_return(false)
      allow(view).to receive(:blacklight_config).and_return(CatalogController.blacklight_config)
      @response = instance_double(Blacklight::Solr::Response, empty?: true, total: 11, start: 1, limit_value: 10, aggregations: {})
    end

    let(:sidebar) { view.content_for(:sidebar) }

    it "renders the Search::SidebarComponent component" do
      render

      expect(sidebar).to match /Limit your search/
    end
  end

  describe "with search parameters" do
    before do
      allow(view).to receive(:has_search_parameters?).and_return(true)
      stub_template "catalog/_results_pagination.html.erb" => ""
      stub_template "catalog/_search_header.html.erb" => "header_content"
      allow(view).to receive(:blacklight_config).and_return(Blacklight::Configuration.new)
      @response = instance_double(Blacklight::Solr::Response, empty?: true, total: 11, start: 1, limit_value: 10)
    end

    it "renders the search_header partial" do
      render
      expect(rendered).to match /header_content/
    end
  end
end
