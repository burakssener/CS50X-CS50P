from fpdf import FPDF
class PDF():
    def __init__(self, name):
        self._pdf = FPDF(orientation="portrait", format="A4")
        self._pdf.add_page()
        self._pdf.set_font("helvetica", "B", 50)
        self._pdf.cell(text="CS50 Shirtificate", markdown=True)

    def save(self, name):
        self._pdf.output(name)

    def image(self, path):
        self._pdf.image(path, w=self._pdf.epw)



pdf = PDF("cs50")
pdf.image("./shirtificate.png")
pdf.save("Shirtificate.pdf")
