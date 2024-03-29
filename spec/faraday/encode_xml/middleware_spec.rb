# frozen_string_literal: true

RSpec.describe Faraday::EncodeXML::Middleware do
  let(:middleware) { described_class.new(->(env) { Faraday::Response.new(env) }, **options) }

  let(:options) { {} }

  def process(body, content_type = nil)
    env = { body: body, request_headers: Faraday::Utils::Headers.new }
    env[:request_headers]['content-type'] = content_type if content_type
    middleware.call(Faraday::Env.from(env)).env
  end

  def result_body
    result[:body]
  end

  def result_type
    result[:request_headers]['content-type']
  end

  context 'without body' do
    let(:result) { process(nil) }

    it "doesn't change body" do
      expect(result_body).to be_nil
    end

    it "doesn't add content type" do
      expect(result_type).to be_nil
    end
  end

  context 'with empty body' do
    let(:result) { process('') }

    it "doesn't change body" do
      expect(result_body).to be_empty
    end

    it "doesn't add content type" do
      expect(result_type).to be_nil
    end
  end

  context 'with string body' do
    let(:result) { process('{"a": 1}') }

    it "doesn't change body" do
      expect(result_body).to eq('{"a": 1}')
    end

    it 'adds content type' do
      expect(result_type).to eq('application/xml')
    end
  end

  context 'with object body' do
    let(:result) { process(a: 1) }

    it 'encodes body' do
      expect(result_body).to eq('<a>1</a>')
    end

    it 'adds content type' do
      expect(result_type).to eq('application/xml')
    end
  end

  context 'with nested object body' do
    let(:result) { process(a: { b: 1 }) }

    it 'encodes body' do
      expect(result_body).to eq('<a><b>1</b></a>')
    end

    it 'adds content type' do
      expect(result_type).to eq('application/xml')
    end
  end

  context 'with array of objects in container body' do
    let(:result) { process(a: [{ b: 1 }, { b: 2 }]) }

    it 'adds content type' do
      expect(result_type).to eq('application/xml')
    end

    context 'without additional options' do
      it 'encodes body' do
        expect(result_body).to eq('<a><b>1</b></a><a><b>2</b></a>')
      end
    end

    context 'with additional `unwrap` option' do
      let(:options) { { gyoku_options: { unwrap: true } } }

      it 'encodes body' do
        expect(result_body).to eq('<a><b>1</b><b>2</b></a>')
      end
    end
  end

  context 'with empty object body' do
    let(:result) { process({}) }

    it 'encodes body' do
      expect(result_body).to eq('')
    end
  end

  context 'with object body with xml type' do
    let(:result) { process({ a: 1 }, 'application/xml; charset=utf-8') }

    it 'encodes body' do
      expect(result_body).to eq('<a>1</a>')
    end

    it "doesn't change content type" do
      expect(result_type).to eq('application/xml; charset=utf-8')
    end
  end

  context 'with object body with incompatible type' do
    let(:result) { process({ a: 1 }, 'application/json; charset=utf-8') }

    it "doesn't change body" do
      expect(result_body).to eq(a: 1)
    end

    it "doesn't change content type" do
      expect(result_type).to eq('application/json; charset=utf-8')
    end
  end
end
