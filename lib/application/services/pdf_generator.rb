# frozen_string_literal: true

require 'pdfkit'

class PDFGenerator
  def initialize(html_template)
    @html_template = html_template
  end

  def generate_pdf(output_file)
    kit = PDFKit.new(@html_template, page_size: 'Letter')
    kit.to_file(output_file)
  end
end
