require 'spec_helper'
describe Stencil do
  it 'renders the css from a scss file' do
    path = 'spec/assets/stylesheets/'
    expect(Stencil.sass(path)).to eq "Sass rendered #{path}"
    expect(File.open('spec/build/application.css').read).to include 'display:-webkit-flex;'
  end

  it 'renders the javascript' do
    path = 'spec/assets/javascripts/'
    expect(Stencil.javascript(path)).to eq "JavaScript rendered #{path}"
    expect(File.open('spec/build/application.js').read).to include 'console.log'
  end

  it 'renders html from a liquid file' do
    path = 'spec/templates/'
    expect(Stencil.templates(path)).to eq "Liquid rendered #{path}"
    expect(File.open('spec/build/index.html').read).to include 'html'
  end

  it 'renders html from a liquid file' do
    path = 'spec/emails/'
    expect(Stencil.emails(path)).to eq "Liquid rendered #{path}"
    expect(File.open('spec/build/email-welcome.html').read).to include 'html'
    expect(File.open('spec/build/email-welcome.html').read).to include '<h1>Hello!</h1>'
  end

  it 'inlines css for an email file' do
    path = 'spec/build/'
    expect(Stencil.inline(path)).to eq "Inline rendered #{path}"
    expect(File.open('spec/build/email-welcome.html').read).to include '<h1 style="color: black; font-weight: bold">Hello!</h1>'
  end
end
