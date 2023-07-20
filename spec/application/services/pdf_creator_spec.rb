# frozen_string_literal: true

require 'application/services/pdf_generator'

describe PDFGenerator do
  let(:html_template) do
    <<-HTML
    <!DOCTYPE html>
    <html>
    <head>
      <title>Meu Template HTML</title>
    </head>
    <body>
      <h1>Exemplo de PDF gerado com Ruby!</h1>
      <p>Este é um PDF gerado a partir de um template HTML.</p>
    </body>
    </html>
    HTML
  end

  let(:output_file) { 'test_output.pdf' }

  subject(:pdf_generator) { PDFGenerator.new(html_template) }

  after(:example) do
    FileUtils.rm_f(output_file)
  end

  describe '#generate_pdf' do
    it 'should generate a PDF file from the HTML template' do
      pdf_generator.generate_pdf(output_file)
      expect(File.exist?(output_file)).to be(true)
    end
  end
end
