from fpdf import FPDF

pdf = FPDF()
pdf.add_page()
pdf.set_font('helvetica', size=12)
pdf.cell(text="hello world")
pdf.image(
    "../docs/fpdf2-logo.png", 10, 10, 50, 0, "", "https://py-pdf.github.io/fpdf2/"
)
pdf.output("hello_world.pdf")
