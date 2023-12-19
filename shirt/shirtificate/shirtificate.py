from fpdf import FPDF
class PDF():
    def __init__(self, name):
        self._pdf = FPDF()
        self._pdf.add_page()
        self._pdf.set_font("helvetica", "B", 50)
    def header(self):
        # Rendering logo:
        self.image("./shirtificate.png", 10, 8, 33)
        # Setting font: helvetica bold 15
        self.set_font("helvetica", "B", 15)
        # Moving cursor to the right:
        self.cell(80)
        # Printing title:
        self.cell(30, 10, "Title", border=1, align="C")
        # Performing a line break:
        self.ln(20)

pdf = PDF()

#pdf.set_font('helvetica')
#pdf.cell(text="hello world")
pdf.set_title("CS50 Shirtificate")
pdf.cell(30, 10, "Title", border=1, align="C")
pdf.image("./shirtificate.png")
pdf.output("hello_world.pdf")
