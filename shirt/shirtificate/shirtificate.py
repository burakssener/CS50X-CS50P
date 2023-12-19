from fpdf import FPDF

pdf = FPDF()
pdf.add_page()
#pdf.set_font('helvetica', size=12)
#pdf.cell(text="hello world")
pdf.set_title("CS50 Shirtificate")
pdf.header(30, 10, "Title", border=1, align="C")
pdf.image("./shirtificate.png")
pdf.output("hello_world.pdf")
