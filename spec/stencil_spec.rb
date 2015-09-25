require 'spec_helper'
describe Stencil do
  it 'renders the css from a scss file' do
    path = 'spec/assets/stylesheets/'
    expect(Stencil.sass(path)).to eq "Sass rendered #{path}"
  end

  it 'renders the javascript' do
    path = 'spec/assets/javascripts/'
    expect(Stencil.javascript(path)).to eq "JavaScript rendered #{path}"
  end

  it 'renders html from a liquid file' do
    path = 'spec/templates/'
    expect(Stencil.liquid(path)).to eq "Liquid rendered #{path}"
  end

  it 'inlines css for an index file' do
    path = 'spec/build/'
    expect(Stencil.inline(path)).to eq "Inline rendered #{path}"
  end
end
